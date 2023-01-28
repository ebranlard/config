@echo off
:: (dir 2>&1 *`|echo CMD);&<# rem #>echo PowerShell CMD
:: Solution below needs python package psutil 
python -c "import re, psutil, os; is_powershell = bool(re.fullmatch('pwsh|pwsh.exe|powershell.exe', psutil.Process(os.getppid()).name()));  print('PowerShell') if (is_powershell) else print('CMD')"
