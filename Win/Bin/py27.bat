@echo off
if not defined PROMPT (
    set "PROMPT=$P$G"
)
set "PROMPT=(py27) %PROMPT%"
set PYTHONHOME=C:\Bin\Python27
set PYTHONPATH=C:\Bin\Python27\Lib
set PATH=%PYTHONHOME%;%PATH%

cmd

::#call C:/Bin/Environments/py27/Scripts/activate.bat
