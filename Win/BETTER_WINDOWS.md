# Admin
gpedit.msc
control panel
services

# Programs to install
In Bin\
    Git  (see below for config)
    Eveditor
    Autohotkey v1
    Python  (add to path)
    msys64  (add to path)
    EveditorFree
    SumatraPdf
    ConEmu
    Inkscape
    Msys2 (See below)

    WebPlotDigitizer        
    UnxUtils
    FreeFileSync
    briss-0.9 (pdf crop)

chocolatey (package manager)
    choco install -y git autohotkey vim  winmerge conemu vlc inkscape treesizefree
    sumatrapdf
    cutepdf
    dropbox
    gimp
    virtualbox
    astrogrep
    pdfsam
    chocolateygui

Not on chocalatey:
    Briss: for pdf cropping
!-------------------------------------------------------------------------------
!-- PATH
!-------------------------------------------------------------------------------
TODO STILL IN BETA AND A MESS
>>> ALSO POWER SHELL PS1 change the path
>>> NOTE: "perl" is found in msys64 and git..

C:\Bin;
C:\Bin\msys64\mingw64\bin;
C:\Bin\Vim\vim91;
C:\Bin\Python\Python312;
C:\Bin\Python\Python312\Scripts;
C:\Bin\Strawberry\perl\bin;
C:\Bin\Git\bin;
C:\Bin\Git\cmd;
C:\Users\ebranlard\AppData\Local\Programs\MiKTeX\miktex\bin\x64;
C:\Bin\UnxUtils\usr\local\wbin;
%USERPROFILE%\AppData\Local\Microsoft\WindowsApps
C:\Bin\SumatraPDF;
C:\Bin\Inkscape\bin;


C:\Bin\Strawberry\c\bin;
C:\Bin\Strawberry\perl\site\bin;
C:\Bin\Git\usr\bin;
C:\Bin\Git\mingw64\bin;


! --------------------------------------------------------------------------------}
! --- Windows defender and other windows annoyances
! --------------------------------------------------------------------------------{
# Windows exe from commandline
taskschd
services.msc 
gpedit
appwiz.cpl :c
# Work watch dog:
Quest KACE   >
Pola Alto global protect  (VPN?) > Service Name PanGPS
# Disable in task scheduler
regedit 
    HKLM\SOFTWARE\Policies\Microsoft\Windows Defender

taskschd
   Task Schuler Library > Microsoft >  Windows > Windows Defender > Disable

services.msc 


gpedit


    Computer Configuration\Administrative Templates\Microsoft Windows Defender

Widgets remove: 

  -  gpedit
    Computer Configuration\Administrative Templates\Windows Components\Widgets

  - See reg file in Admin folder
Follow the below steps in GPO to resolve the misconfiguration. Configure the policy value for 
Computer Configuration >> Windows Settings >> Security Settings >> Local Policies >> Security Options >> "User Account Control: Run all administrators in Admin Approval Mode" > "Enabled"
Computer Configuration >> Windows Settings >> Security Settings >> Local Policies >> Security Options >> "User Account Control: Only elevate UIAccess applications > Enabled
Computer Configuration >> Windows Settings >> Security Settings >> Local Policies >> Security Options >> "User Account Control: Detect application installations > Enabled
Computer Configuration >> Windows Settings >> Security Settings >> Local Policies >> Security Options >> "User Account Control: Behavior of the elevation prompt >"Automatically deny elevation requests". 
Computer Configuration >> Windows Settings >> Security Settings >> Local Policies >> Security Options >> "User Account Control: Virtualize file and registry write > Enabled
Computer Configuration >> Windows Settings >> Security Settings >> Local Policies >> Security Options >> "User Account Control: Admin Approval Mode for the Built-in > Enable
Computer Configuration >> Windows Settings >> Security Settings >> Local Policies >> Security Options >> "User Account Control: Behavior of the elevation prompt for a d> Prompt


!-------------------------------------------------------------------------------
!-- APPLICATIONS CONFIG
!-------------------------------------------------------------------------------
# Msys2
    pacman -Su mingw-w64-x86_64-gcc mingw-w64-x86_64-gcc-fortran mingw-w64-x86_64-cmake mingw-w64-x86_64-openblas mingw-w64-x86_64-lapack

    set PATH=c:\msys64\mingw64\bin;%PATH%

    If you need to set the path each time you launch cmd:

    reg add "HKCU\Software\Microsoft\Command Processor" /v AutoRun ^
      /t REG_EXPAND_SZ /d "%"USERPROFILE"%\init.cmd" /f

    where init.cmd contains the following
        SET USER_PATH=c:\whatever
        SET PATH=%USER_PATH%;%PATH%



# Git
Not needed anymore
!git config --global core.sshCommand C:/Windows/System32/OpenSSH/ssh.exe
!git config core.autocrlf true


## SSH
ssh-keygen -t ed25519 -C "elmanuelito.github@gmail.com"

! NOTE: in a elevated command prompt
Get-Service -Name ssh-agent | Set-Service -StartupType Manual
Start-Service ssh-agent
ssh-add PATHTO/.ssh/id_ed25519

! THEN SET OPENSSH AS DEFAULT
git config --global core.sshCommand C:/Windows/System32/OpenSSH/ssh.exe

! Add key to github.com
cat ~/.ssh/id_ed25519.pub | clip
github.com > settings > SSH


# Vim
put _vimrc in parent directory of vim82

    - Some help:
    In vim: type :help runtimepath to see where the _vimrc_ is looked for.

    - Change $HOME
    If you want to change this location one option is to change the environment variable %HOME%
    Set the the environement variable $HOME to e.g. C:\Config\dotfiles\

    - Edit the "default vimrc"
    In program files
    edit the file _vimrc_to remove the source mswin and behave mswin line

    - Debug startup time
    gvim --staartuptime VimStartup.log



!-------------------------------------------------------------------------------
!-- WINDOWS CONFIG
!-------------------------------------------------------------------------------
# Windows Config:
Install Explorer Patcher
https://github.com/valinet/ExplorerPatcher
(right click on task bar > Properties )

OR 
    StartAllBack < License ware

# Import Windows setup

System > Settings > Multitasking , turn off "When I snap a window, show what can snap next to it"


## Power shell PowerShell
Run: 

    Set-ExecutionPolicy RemoteSigned -Scope CurrentUser

Then copy paste the .ps1 file in folder Console

## Context menu
The BEST is to use the registry files locates in ContextMenu/ 

Alternatively ContextEdit can be used, but it doesn't have the background of the shell

## Taskbar: 
### TaskBar Config:

### Add QuickLaunch to TaskBar
Right-click the taskbar and select Toolbars-->New Toolbar.
(default Quick Launch is at: User\AppData\Roaming\Microsoft\Internet Explorer\Quick Launch)

## Explorer 
See folder ContextMenu/

### Remove "user folders" under "This PC"
See my reg files in Config\Win
For isntance: 
    [-HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{B4BFCC3A-DB2C-424C-B029-7FE99A87C641}]
    [-HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{B4BFCC3A-DB2C-424C-B029-7FE99A87C641}]

### Disable Full path in title bar (and hence task bar) for Explorer 
Folder Options>View> Uncheck "Display the full path in the title bar"

## Fonts
Install Config\Fonts\DejaVuSansMono (select all and run as admin to install)
    
## Speed up Windows
### File Indexing
Unselect all the location that are indexed
### Power Perfomances
Set on High performance power plan
### Disable visual effects, and transparency
- Go to Advanced System settings, then Visual Tab, and select "Adjust for best Performance" (I keep smooth fonts)
- Go to Color and themes> Colors > Disable transparency



# Chrome with AdBlockPlus plugin
Install adblock plus

# AutoHotKeys

- Download AutohotKey v1 to C:/Bin/
- See All.htk in Win/Shortcuts/
- Right click on script, open with, select autohotkey.exe
- Copy script 
- Create some scripts (Right click, new script.) 
 Example of script (Ctrl-Z lauches notepad):
    #z::
    Run, Notepad,
    return

# Misc
    Install fonts (sdouble clicks on fonts in Config/fonts

    How to set Path in Windows without admin rights.
    1. From Start menu open Control Panel
    2. In Control panel Go to User Accounts
    3. In the user Accounts, Click on “Change my environment variables”

