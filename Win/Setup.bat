:: This script needs administrative acces to create symlinks


:: --------------------------------------------------------------------------------
:: --- MAIN DIRECTORIES 
:: --------------------------------------------------------------------------------
set SCRIPT_DIR=C:\Users\%USERNAME%\Config\Win
set DOT_DIR=C:\Users\%USERNAME%\Config\dotfiles
set BABUN_DIR=C:\Users\%USERNAME%\.babun
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
:: Moving AutoHotKey file to startup
::set DIR=C:\Users\%USERNAME%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Start-up
::mklink /H "%DIR%\All.ahk" "%SCRIPT_DIR%\KeyboardShortcuts\AutoHotKeys\All.ahk"

:: --------------------------------------------------------------------------------
:: --- ConEmu 
:: --------------------------------------------------------------------------------
set FIL=C:\Users\%USERNAME%\AppData\Roaming\ConEmu.xml
del "%FIL%" 
mklink /H "%FIL%" "%SCRIPT_DIR%\Console\ConEmu.xml"

:: --------------------------------------------------------------------------------
:: --- Vim 
:: --------------------------------------------------------------------------------
cd %SCRIPT_DIR%

set DIR=C:\Users\%USERNAME%\vimfiles
::move   /Y "%DIR%" "%DIR%.bkp"
rmdir "%DIR%" 
mklink /D "%DIR%" "%DOT_DIR%\vim\"

set FIL=C:\Users\%USERNAME%\vimfiles\vimrc
del %FIL%
::move   /Y "%FIL%" "%FIL%.bkp"
mklink /H "%FIL%" "%DOT_DIR%\vimrc"


:: --------------------------------------------------------------------------------
:: ---  
:: --------------------------------------------------------------------------------
::
cd %SCRIPT_DIR%
