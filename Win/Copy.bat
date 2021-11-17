:: This script needs administrative acces to create symlinks
@echo off

:: --------------------------------------------------------------------------------
:: --- MAIN DIRECTORIES 
:: --------------------------------------------------------------------------------
:: Convenient varibles: %USERNAME% %USERPROFILE%
:: set SCRIPT_DIR=%USERPROFILE%\Config\Win
set SCRIPT_DIR=C:\Config\Win
:: set DOT_DIR=%USERPROFILE%\Config\dotfiles
:: set HOME_DIR=%USERPROFILE%\.babun\cygwin\home\ebra
:: set HOME_DIR=C:\cygwin64\home\ebra
::
:: --------------------------------------------------------------------------------
:: --- QuickLaunch -> (Aborted: bad user permissions)
:: --------------------------------------------------------------------------------
::set DIR=C:\Users\%USERNAME%\AppData\Roaming\Microsoft\Internet Explorer
::move /Y   "%DIR%\Quick Launch" "%DIR%\Quick Launch_bkp"
::mklink /D "%DIR%\Quick Launch" "%SCRIPT_DIR%\QuickLaunch"
::
::
:: --------------------------------------------------------------------------------
:: ---  AutoHotKeys 
:: --------------------------------------------------------------------------------
echo ------------------------ Setting up AutoHotKeys ------------------------------
set DIR=%USERPROFILE%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup
mkdir "%DIR%"
set FIL=%USERPROFILE%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup\All.ahk
copy "%SCRIPT_DIR%\KeyboardShortcuts\AutoHotKeys\All.ahk" "%FIL%"


:: --------------------------------------------------------------------------------
:: --- ConEmu 
:: --------------------------------------------------------------------------------
echo -------------------------- Setting up ConEmu ---------------------------------
echo In ConEmu, import the following file: "%SCRIPT_DIR%\Console\ConEmu.xml"
::set FIL=C:\Users\%USERNAME%\AppData\Roaming\ConEmu.xml
::del "%FIL%" > nul 2>&1
:::: mklink /H "%FIL%" "%SCRIPT_DIR%\Console\ConEmu.xml"
::copy "%SCRIPT_DIR%\Console\ConEmu.xml" "%FIL%"

:: --------------------------------------------------------------------------------
:: --- Git
:: --------------------------------------------------------------------------------
:: echo -------------------------- Setting up Git ------------------------------------
:: set FIL=%USERPROFILE%\.gitconfig
:: del "%FIL%" > nul 2>&1
:: mklink /H "%FIL%" "%DOT_DIR%\gitconfig"
:: 
:: :: --------------------------------------------------------------------------------
:: :: --- Back to script dir 
:: :: --------------------------------------------------------------------------------
:: cd %SCRIPT_DIR%
echo -------------------------- Done ----------------------------------------------
