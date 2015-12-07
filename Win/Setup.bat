set SCRIPT_DIR=%CD%
::
::set DIR=C:\Users\%USERNAME%\AppData\Roaming\Microsoft\Internet Explorer
::move /Y   "%DIR%\Quick Launch" "%DIR%\Quick Launch_bkp"
::mklink /D "%DIR%\Quick Launch" "%SCRIPT_DIR%\QuickLaunch"
::
::
:: AutoHotKeys in Startup
::set DIR=C:\Users\%USERNAME%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Start-up
::dir %DIR%
::mklink /H "%DIR%\All.ahk" "%SCRIPT_DIR%\KeyboardShortcuts\AutoHotKeys\All.ahk"

:: ConEmu
set FIL=C:\Users\%USERNAME%\AppData\Roaming\ConEmu.xml
move   /Y "%FIL%" "%FIL%.bkp"
mklink /H "%FIL%" "%SCRIPT_DIR%\Console\ConEmu.xml"

::
cd %SCRIPT_DIR%
