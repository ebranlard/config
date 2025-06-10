@echo off

echo ==== Removing Windows Web Experience Pack...
powershell -Command "Get-AppxPackage -AllUsers | Where-Object {$_.Name -like '*WebExperience*'} | Remove-AppxPackage"

echo Done.

