:: C:/Users/ebranlard/AppData/Roaming/Code/User/

@echo off

echo "Listing code user dir:"
set CODEDIR=%APPDATA%\Code\User

echo "%CODEDIR%
cd %CODEDIR%

ls

echo "Opening directory"
%SYSTEMROOT%\explorer.exe /e,%CODEDIR%

pause
