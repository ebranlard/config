@echo off
echo Adding folders to Windows Defender exclusions...

:: Add C:\Bin
powershell -Command "Add-MpPreference -ExclusionPath 'C:\Bin'"

:: Add C:\Work
powershell -Command "Add-MpPreference -ExclusionPath 'C:\Work'"

echo Done.
pause

