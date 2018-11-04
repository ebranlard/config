@echo off
:: --------------------------------------------------------------------------------
:: --- MAIN DIRECTORIES 
:: --------------------------------------------------------------------------------
:: Convenient varibles: %USERNAME% %USERPROFILE%
set SCRIPT_DIR=C:\Config\Win
:: --------------------------------------------------------------------------------
:: ---  AutoHotKeys 
:: --------------------------------------------------------------------------------
echo ------------------------ Setting up AutoHotKeys ------------------------------
set DIR=%USERPROFILE%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup
mkdir "%DIR%"
set FIL=%USERPROFILE%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup\All.ahk
copy "%SCRIPT_DIR%\KeyboardShortcuts\AutoHotKeys\All.ahk" "%FIL%"
