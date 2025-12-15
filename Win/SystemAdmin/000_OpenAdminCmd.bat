@echo off
:: Get the current folder of the batch script
set "current_dir=%~dp0"

:: Check for admin rights
net session >nul 2>&1
if %errorlevel% neq 0 (
    :: Relaunch cmd.exe as admin in the current folder
    powershell -Command "Start-Process cmd -ArgumentList '/k cd /d \"%current_dir%\"' -Verb runAs"
    exit /b
)

:: Already admin: just open cmd in the current directory
cd /d "%current_dir%"
cmd
