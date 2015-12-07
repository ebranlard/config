:: This script needs administrative acces to create symlinks
@echo off

:: --------------------------------------------------------------------------------
:: --- MAIN DIRECTORIES 
:: --------------------------------------------------------------------------------
:: Convenient varibles: %USERNAME% %USERPROFILE%
set SCRIPT_DIR=%USERPROFILE%\Config\Win
set DOT_DIR=%USERPROFILE%\Config\dotfiles
set HOME_DIR=%USERPROFILE%\.babun\cygwin\home\ebra
set HOME_DIR=C:\cygwin64\home\ebra
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
set FIL=%USERPROFILE%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup\All.ahk
del %FIL% > nul 2>&1
echo %FIL%
mklink /H "%FIL%" "%SCRIPT_DIR%\KeyboardShortcuts\AutoHotKeys\All.ahk"

:: --------------------------------------------------------------------------------
:: --- ConEmu 
:: --------------------------------------------------------------------------------
echo -------------------------- Setting up ConEmu ---------------------------------
set FIL=C:\Users\%USERNAME%\AppData\Roaming\ConEmu.xml
del "%FIL%" > nul 2>&1
mklink /H "%FIL%" "%SCRIPT_DIR%\Console\ConEmu.xml"

:: --------------------------------------------------------------------------------
:: --- Git
:: --------------------------------------------------------------------------------
echo -------------------------- Setting up Git ------------------------------------
set FIL=%USERPROFILE%\.gitconfig
del "%FIL%" > nul 2>&1
mklink /H "%FIL%" "%DOT_DIR%\gitconfig"

:: --------------------------------------------------------------------------------
:: --- Vim 
:: --------------------------------------------------------------------------------
echo ----------------------------- Setting up Vim ---------------------------------
set DIR=%USERPROFILE%\vimfiles
rmdir "%DIR%" > nul 2>&1
mklink /D "%DIR%" "%DOT_DIR%\vim\"

set FIL=%USERPROFILE%\vimfiles\vimrc
del %FIL% > nul 2>&1
mklink /H "%FIL%" "%DOT_DIR%\vimrc"


:: --------------------------------------------------------------------------------
:: ---  Babun/Cygwin
:: --------------------------------------------------------------------------------
echo --------------------------- Setting up Babun ---------------------------------
:: del %HOME_DIR%\.bash_profile  > nul 2>&1
:: del %HOME_DIR%\.bashrc        > nul 2>&1
:: del %HOME_DIR%\.profile       > nul 2>&1
rmdir %HOME_DIR%\Config       > nul 2>&1
mklink /D "%HOME_DIR%\Config"        "%USERPROFILE%\Config"
:: mklink /D "%HOME_DIR%\.bashrc"       "%DOT_DIR%\bashrc_user.bash"    
:: mklink /D "%HOME_DIR%\.bash_profile" "%DOT_DIR%\bash_profile.bash" 
:: mklink /D "%HOME_DIR%\.profile"       "%DOT_DIR%\profile" 
:: mklink /D "%HOME_DIR%\.ctags"         "%DOT_DIR%\ctags" 
:: mklink /D "%HOME_DIR%\.gitconfig"     "%DOT_DIR%\gitconfig" 
:: 
:: :: Vim for babun
:: set DIR=%HOME_DIR%\.vim
:: rmdir "%DIR%" > nul 2>&1
:: mklink /D "%DIR%" "%DOT_DIR%\vim\"
:: 
:: set FIL=%HOME_DIR%\.vimrc
:: del %FIL% > nul 2>&1
:: mklink /D "%FIL%" "%DOT_DIR%\vimrc"

:: UserDir
mklink /D "%HOME_DIR%\Home"        "%USERPROFILE%"

echo "Run SetupDotFiles within cygwin to finish config"


:: --------------------------------------------------------------------------------
:: --- Back to script dir 
:: --------------------------------------------------------------------------------
cd %SCRIPT_DIR%
