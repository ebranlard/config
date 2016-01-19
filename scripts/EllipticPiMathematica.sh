#!/bin/bash
# MathematicaScript and MathKernel 9 have a bug that prevents output sent
# from a Mathematica script to stdout from being catched on a pipe or
# redirected to a file. This workaround runs the script inline into a 
# MathKernel session.

#  This script is slower than EllipticPiMathematica.m..... !!!!!!!!!!!!!!

export input="$@"
MathKernel -noprompt <<\EOF 
    inp = StringSplit[Environment["input"]];
    nargs=Dimensions[inp][[1]];
    l=(nargs)/2;
    n=ToExpression[inp[[Range[l]]]];
    m=ToExpression[inp[[l+Range[l]]]];
    Table[Write["stdout",EllipticPi[n[[i]],m[[i]]]],{i,1,l}];
EOF

