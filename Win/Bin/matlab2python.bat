@echo off
setlocal EnableDelayedExpansion
FOR %%a IN (%*) DO (
    set inputfile=%%~a
    set basename=%%~na
    set outname=!basename!.py
    echo - Generating file !outname! from !inputfile!
    python C:/Work/_libs/matlab2python/matlab2python.py !inputfile! -o !outname!
)
