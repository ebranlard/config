@echo off
:: Check for admin privileges
net session >nul 2>&1
if %errorlevel% neq 0 (
    echo Requesting administrative privileges...
    powershell -Command "Start-Process '%~f0' -Verb RunAs"
    exit /b
)

:: Run the PowerShell command as admin
powershell -Command "Set-ExecutionPolicy RemoteSigned -Scope LocalMachine -Force"
echo Execution policy set to RemoteSigned.
pause