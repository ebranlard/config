@echo off

set MAIN=%~1

if "%MAIN%" == "" (
    call :help
    pause
    exit 
)

set PYTHONHOME=C:\Bin\Python27
set PYTHONPATH=C:\Bin\Python27\Lib
set PATH=%PYTHONHOME%;%PATH%


echo - Calling demacro on from %MAIN%
:: python C:/Config/scripts/de-macro.py %MAIN%.tex
:: -o !outname!


echo - Calling MakeStandaloneFigs on from %MAIN%-clean
python C:/Config/scripts/MakeStandaloneFigs.py %MAIN%-clean.tex

goto :eof


:help
echo usage: latexProd MAIN
echo.
echo MAIN: a latex file without extension
echo.
echo.
