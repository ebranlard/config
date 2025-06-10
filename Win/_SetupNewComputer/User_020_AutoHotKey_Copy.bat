@echo off
:: --------------------------------------------------------------------------------
:: --- MAIN DIRECTORIES 
:: --------------------------------------------------------------------------------
:: Convenient varibles: %USERNAME% %USERPROFILE%
set SCRIPT_DIR=%~dp0
:: --------------------------------------------------------------------------------
:: ---  AutoHotKeys 
:: --------------------------------------------------------------------------------
echo ------------------------ Setting up AutoHotKeys ------------------------------
set DIR=%USERPROFILE%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup
mkdir "%DIR%"
set FIL=%USERPROFILE%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup\AutoHotkey_All.ahk
copy "%SCRIPT_DIR%AutoHotKey_All.ahk" "%FIL%"
