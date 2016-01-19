#!/usr/bin/python
# Filename: fBEMsteady.py
# Ewan Machefaux January 12th 2011
# Perform steady  Blade Element Momentum computation

# Input
# 	Aero  	 = instance of class Aero 
# 	BEMParam = instance of class BEMParameter
# 	Env	     = instance of class Environment
# 	RotorBEM = instance of class Rotor

# Output
# 	BEM 	 = tuple containing 
                # phi: flow angle [deg]
                # alpha: angle of attack [deg]
                # a: axial induction factor [-]
                # aprime: tangential induction factor [-]
                # Cd: drag coefficient [-]
                # Cl: lift coefficient [-]
                # Cn: normal in-plane forces [-] 
                # Ct: out -of -plane forces [-]
                # CT: thrust coefficient [-]
                # Vrel: relative wind speed [m/s]
                # Pn: normal load on blade element [N]
                # Pt: tangential load on blade element [N]


from numpy import dot, divide, pi, arctan, isnan, sin, cos, deg2rad, arccos, exp, interp, sqrt
from numpy import linalg as LA
import getTorqueThrustFromBlade


def BEM(Aero, BEMParam, Env, RotorBEM):
	V0=Aero.V0[2]
	nB=RotorBEM.blades
	ne=RotorBEM.nE
	R=RotorBEM.radius # length of blade [m]
	r=RotorBEM.r # vector radial position [m]
	chord=RotorBEM.chord
	beta=RotorBEM.beta
	omega=RotorBEM.omega
	rho=Env.rho
	lambda_r=dot(omega,divide(r,V0))
	lambda_g=omega*R/V0
	sigma=(dot(dot(chord,0.001),nB))/(dot(dot(pi,r),2))
	pitch=0
	nbIt=BEMParam.nbIt
	alphaCrit=BEMParam.alphaCrit
	Pnfinal=[]
	Ptfinal=[]
	BEM.phi=[]
	BEM.alpha=[]
	BEM.a=[]
	BEM.aprime=[]
	BEM.Cd=[]
	BEM.Cl=[]
	BEM.Cn=[]
	BEM.Ct=[]
	BEM.CT=[]
	BEM.Vrel=[]

	for e in range(1,ne+1):
		#initialization
		a=0.2;
		alpha_last=0;
		alpha_last_last=0;
		aprime=0.01;
        
        #%BEM loop
		for i in range(1,nbIt+1):
				
			### Step 2 : flow angle
			phi=arctan( (1-a) /((1+aprime)*lambda_r[e-1]) )*180/pi #[deg]
			F=1 # To avoid complex values
			if isnan(phi) == True: 
				print('Algorithm did not converge')
				Pt=0
				Pn=0
				break
			if(sin(deg2rad(phi))>0.01):
				if(BEMParam.Tiploss) ==1:
					#prandtl tip correction
					f=nB*0.5*(R-r[e-1])/(r[e-1]*sin(deg2rad(phi)))
					F=2/pi*arccos(exp(-f))					
			### Step 3 : angle of attack		
			alpha=phi-(beta[e-1]+pitch) # [deg]			
			### Step 4 : profiles data
			alpha_data=RotorBEM.alpha
			Cl=interp(alpha, alpha_data, RotorBEM.Cl)
			Cd=interp(alpha, alpha_data, RotorBEM.Cd)		
			### Step 5 : Aerodynamic forces PER LENGTH and coefficients
			Cn=Cl*cos(deg2rad(phi)) + Cd*sin(deg2rad(phi))
			Ct=Cl*sin(deg2rad(phi)) - Cd*cos(deg2rad(phi))
			Vrel=V0*(1-a)/sin(deg2rad(phi))
			L=0.5*rho*LA.norm(Vrel)**2*chord[e-1]*Cl*0.001
			D=0.5*rho*LA.norm(Vrel)**2*chord[e-1]*Cd*0.001
			Pn=L*cos(deg2rad(phi)) + D*sin(deg2rad(phi))
			Pt=L*sin(deg2rad(phi)) - D*cos(deg2rad(phi))
			## induction factor
			# by default the next a is:	        
			a_last=a
			# normal expression, the default one is:
			a=1/( (4*F*sin(deg2rad(phi))**2) /(sigma[e-1]*Cn)+1 )
			## Thrust coefficient from the momentum theory => alast
			CT=(1-a_last)**2*sigma[e-1]*(Cn / (sin(deg2rad(phi))**2))
			if BEMParam.correction == 'GlauertCT':
				print('We gonna use GlauertCT correction')
				ac =0.3
				if a>ac:
					fg=0.25*(5-3*a)
					a=divide(CT,(4*F*(1-fg*a)))
			if BEMParam.correction == 'Spera':
				if (nbIt==i) and (e==1): print('We gonna use Spera correction')
				ac = 0.34
				if a>ac:
					K=4*F*(sin(deg2rad(phi)))**2/(sigma[e-1]*Cn)
					a=0.5*(2+K*(1-2*ac)-sqrt( (K*(1-2*ac)+2 )**2 + 4*(K*ac**2-1)    )  )				
			#relaxation
			a=a*BEMParam.relaxation+(1-BEMParam.relaxation)*a_last
			aprime=1/( (4*F*sin(deg2rad(phi))*cos(deg2rad(phi))) /(sigma[e-1]*Ct)  -1 )
			
            ### convergence criteria
			if (i>3)==True and (abs(alpha-alpha_last)<alphaCrit)==True  and (abs(alpha-alpha_last_last) < alphaCrit)==True:
				break;
 	
			alpha_last_last=alpha_last
			alpha_last=alpha
			
		Ptfinal.append(Pt)
		Pnfinal.append(Pn)
		BEM.phi.append(phi)
		BEM.alpha.append(alpha)
		BEM.a.append(a_last)
		BEM.aprime.append(aprime)
		BEM.Cd.append(Cd)
		BEM.Cl.append(Cl)
		BEM.Cn.append(Cn)
		BEM.Ct.append(Ct)
		BEM.CT.append(CT)
		BEM.Vrel.append(Vrel)

	## call torque function		
	Q = getTorqueThrustFromBlade.Torque(r,Ptfinal,R)
	BEM.Q=nB*Q
	T = getTorqueThrustFromBlade.Thrust(r,Pnfinal,R)
	BEM.T=nB*T
	BEM.Power=omega*BEM.Q
	BEM.CP=BEM.Power/(0.5*rho*V0**3*pi*R**2)
	BEM.CT=BEM.T/(0.5*rho*V0**2*pi*R**2)
	BEM.CQ=BEM.Q/(0.5*rho*V0**2*pi*R**3)
	print(BEM.Power)

	
	return BEM.Power, BEM.CP
