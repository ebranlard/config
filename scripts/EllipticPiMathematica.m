#!/usr/local/bin/MathematicaScript -script

(* Takes as argument first the list of n values then the list of m values *)


(* getting number of arguments *)
nargs=Dimensions[$ScriptCommandLine][[1]];
l=(nargs-1)/2;
n=ToExpression[$ScriptCommandLine[[1+Range[1,l]]]];
m=ToExpression[$ScriptCommandLine[[1+l+Range[1,l]]]];

Table[Write["stdout",EllipticPi[n[[i]],m[[i]]]],{i,1,l}];


(* Print /@ EllipticPi[n,m] *)






