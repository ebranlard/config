@echo off

::Set-ExecutionPolicy RemoteSigned -Scope CurrentUser


:: Convenient varibles: %USERNAME% %USERPROFILE%
set SCRIPT_DIR=%~dp0
set DIR=%USERPROFILE%\Documents\WindowsPowerShell
mkdir "%DIR%"
set FIL="%DIR%\Microsoft.PowerShell_profile.ps1"
copy "%SCRIPT_DIR%Microsoft.PowerShell_profile.ps1" "%FIL%"
