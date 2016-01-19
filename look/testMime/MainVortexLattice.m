%% Initialization - Typical constants
InitClear;
addpath([MAINPATH 'code/WTlib/']);
addpath([MAINPATH 'code/BEM/']);
addpath([MAINPATH 'code/CFDPostPro/']);
addpath([MAINPATH 'code/CirculationFamilyCurves/']);
addpath(CCODEPATH);

%%
%sGeometry='flatplate';
sGeometry='elliptic';
sGeometry='Manu';
% sGeometry='FlatTUD'; % works better with no viscous model
sGeometry='NB4';
%sGeometry='B49';

[ WT ]   = fInitWT( sGeometry ,'xblade',[MAINPATH 'data/']);
% WT.Rotor.cone=0;% !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
WT.Rotor.rhub=0;
WT.Sources.Rotor.r(1)=0;
[ Algo ] = fInitVLAlgo( sGeometry );
% case definition
vSIM=WT.Spec.vSIM(WT.Spec.iSimDef,:);

[ Sim ]  = fInitSim( WT , vSIM );
[ Wind ] = fInitWind( Sim );
[ CFD ]  = fInitCFDPostPro(Sim,'');
%%
Algo.bRollUp=1;
Algo.bFarWake=0;
Algo.bPrescribedGamma=0;
Algo.bPlotGeometry=1; 
Algo.bPlots=1; 
% rGam0=linspace(0,1,100);
% [sse Gam0]=fFitGamma([0.8 0.95 1.6 0.5],rGam0,rGam0*0);
% Algo.r_GammaPrescribed=rGam0*(WT.Rotor.R-WT.Rotor.rhub)+WT.Rotor.rhub;
% Algo.GammaPrescribed=Gam0*50;
 Algo.r_GammaPrescribed=CFD.r;
 Algo.GammaPrescribed=CFD.Gamma;

% figure
% plot(Algo.r_GammaPrescribed,Algo.GammaPrescribed)
%%
% resolution
Algo.n_span=20;    % number of PANELS spanwise
Algo.n_chord=1;    % number of PANELS chordwise
Algo.Nrev=5;
Algo.Nphi=25;
Algo.Nrev_farwake=10;
Algo.Nrev_farwake_cut=20;
Algo.sSpanMeshFunction='Cosb';
opts.TipLoss=1;
Algo.bRough=0; % bRough=1 <> N=1;
Algo.ViscousModel=3;
% Simple variables
U0=[0;0;Sim.WS];
Omega=[0;0;Sim.RPM*2*pi/60];
R=WT.Rotor.R;
B=WT.Rotor.nB;
rho=Sim.rho;
KinVisc=Sim.KinVisc;
% time
if(norm(Omega)>0)
    t_bar_max=norm(U0)/R*2*pi*Algo.Nrev/norm(Omega);
    dt_bar=norm(U0)/R*2*pi/Algo.Nphi/norm(Omega);
else
    t_bar_max=2.5;
    dt_bar=0.05;
end


% Algo.Winglet=1;
% Algo.WingletLength=0.05;
% Algo.WingletAngle=85;
% Sim.Name=['Winglet' Sim.Name ];


% Geometry
[Xbound Ybound Zbound Xcolloc Ycolloc Zcolloc Xle Yle Zle Xte Yte Zte N Ti Tj Area C S Param Ii Ij chord_colloc Xllcp Yllcp Zllcp chord_ll S_ll N_ll Ti_ll Tj_ll Area_ll rllcp] = fGeometrySetup(WT,Sim,Algo);


%% Running BEM
% forcing r location
if(~Algo.Winglet)
    [ WT ] = fSetRotorGrid(rllcp,WT);
else
    rll=rllcp(rllcp<WT.Rotor.R);
    rll2=repmat((rll(end)+WT.Rotor.R)/2,1,Algo.n_span-length(rll));
    [ WT ] = fSetRotorGrid([rll rll2],WT);
end
% running BEM

[ BEMAlgo ] = fInitBEMAlgo();
BEMAlgo.TipLoss=opts.TipLoss;
[ BEM ] = fRunBEM(WT,Sim,Wind,BEMAlgo);



%% Run
run VL_Simulation

%% Loads Computation
run VL_Load

%% Wake shape
weirdGamma=[Gamma Gamma(:,end)];
figure(1224);
clf
hold all
surf(X, -Z, Y,weirdGamma);
plot3(Xle,-Zle,Yle,'k','LineWidth',2)
plot3(Xte,-Zte,Yte,'k','LineWidth',2)
grid on,box on;
xlabel('x');
ylabel('z');
zlabel('y');
xlim(1.5*R*[-1 1])
zlim(1.5*R*[-1 1])
ylim(ZLIM)
colorbar
title(sprintf('WakeCirculation%s',sGeometry))

%% Export
run VL_Export
%%
if(Algo.bUnsteadyLoads && ~Algo.bSteady)
    figure
    plot(vtime*norm(U0)/Param.c0,vCl,vtime*norm(U0)/Param.c0,vCl2)
    figure
    plot(vtime*norm(U0)/Param.c0,vCd,vtime*norm(U0)/Param.c0,vCd1,vtime*norm(U0)/Param.c0,vCd2)
end

%% Post Pro
% run VL_PostPro
% 
