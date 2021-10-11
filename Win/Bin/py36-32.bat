@echo off
if not defined PROMPT (
    set "PROMPT=$P$G"
)
set "PROMPT=(py36-32) %PROMPT%"
set PYTHONHOME=C:\Bin\Python36-32
set PYTHONPATH=%PYTHONHOME%\Lib
set PATH=%PYTHONHOME%;%PATH%
set NUITKA_CLCACHE_BINARY=%PYTHONHOME%\clcache.exe
cmd

::#call C:/Bin/Environments/py36/Scripts/activate.bat
