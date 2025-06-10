echo ===== Step 1: Make sure virtualization is enabled in BIOS
echo   Reboot your computer and enter BIOS/UEFI usually by pressing Del, F2, or Esc.
echo  
echo   Enable Intel VT-x or AMD-V  virtualization support.
echo  
echo   Save and reboot.
pause



wsl --install
wsl --update


echo ============== IF FAILING
dism.exe /online /enable-feature /featurename:Microsoft-Windows-Subsystem-Linux /all /norestart
dism.exe /online /enable-feature /featurename:VirtualMachinePlatform /all /norestart


wsl --install -d Ubuntu


echo "TODO EDIT /etc/wsl.conf to avoid interop (see this script comment)"
:: [interop]
:: enabled=false
:: appendWindowsPath=false



echo "TODO POTENTIALLY CHANGE BASHRC TO AVOID CONFLICT OF WINDOWS PATH (see this script)"

:: echo """export PATH=`echo $PATH | tr ':' '\n' | grep -v /mnt/ | tr '\n' ':'`"
:: 
