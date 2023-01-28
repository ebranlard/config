@echo off
if not defined PROMPT (
    set "PROMPT=$P$G"
)
set "PROMPT=(py37) %PROMPT%"
set PYTHONHOME=C:\Bin\Python\Python37
set PYTHONSCRIPT=%PYTHONHOME%\Scripts
set PYTHONPATH=%PYTHONHOME%\Lib
set PATH=%PYTHONHOME%;%PYTHONSCRIPT%;%PATH%
set NUITKA_CLCACHE_BINARY=%PYTHONHOME%\clcache.exe
cmd

::#call C:/Bin/Environments/py36/Scripts/activate.bat
