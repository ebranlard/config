
EnvironmentalVariable HomeDrive is "U", set it to "C"

Install fonts (sdouble clicks on fonts in Config/fonts

put _vimrc in parent directory of vim82

Download "zip" version of autohotkey 1.x
Run Copy script


How to set Path in Windows without admin rights.
1. From Start menu open Control Panel
2. In Control panel Go to User Accounts
3. In the user Accounts, Click on “Change my environment variables”




# Import Windows setup

System > Settings > Multitasking , turn off "When I snap a window, show what can snap next to it"




# Programs to install
EveditorFree
SumatraPdf
ConEmu



Msys2 (shell and package manager):

    pacman -Su mingw-w64-x86_64-gcc mingw-w64-x86_64-gcc-fortran mingw-w64-x86_64-cmake mingw-w64-x86_64-openblas mingw-w64-x86_64-lapack

     mingw-w64-x86_64-make

    pacman -Su mingw-w64-x86_64-gcc
    pacman -Su mingw-w64-x86_64-make
    pacman -Su mingw-w64-x86_64-gcc-fortran
    pacman -Su mingw-w64-x86_64-cmake
    pacman -Su mingw-w64-x86_64-openblas
    pacman -Su mingw-w64-x86_64-lapack


    pacman -S mingw-w64-x86_64-{gcc,cmake,make,gcc-gfortran,openblas,lapack} 


    set PATH=c:\msys64\mingw64\bin;%PATH%

    If you need to set the path each time you launch cmd:

    reg add "HKCU\Software\Microsoft\Command Processor" /v AutoRun ^
      /t REG_EXPAND_SZ /d "%"USERPROFILE"%\init.cmd" /f

    where init.cmd contains the following
        SET USER_PATH=c:\whatever
        SET PATH=%USER_PATH%;%PATH%


In Bin\
    FreeFileSync
    WebPlotDigitizer        
    UnxUtils
    briss-0.9 (pdf crop)
    msys64
    GNUMake3.81


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

My Tools:
    wmctrl
    xdotools
    SwitchAndPasteToMatlab

Console tools:
    ConEmu, ConsoleZ, Babun

# Windows Config:


## Power shell
Run: 

    Set-ExecutionPolicy RemoteSigned -Scope CurrentUser


Then copy paste the .ps1 file in folder Console





## Context menu
The BEST is to use the registry files locates in ContextMenu/ 

Alternatively ContextEdit can be used, but it doesn't have the background of the shell

## Mouse
Copy paste with mouse, see my AutoHostKey setup

## Taskbar: 
### TaskBar Config:
Right click on task bar:
- unlock
- Use small buttons
- Never combine

### Add QuickLaunch to TaskBar
Right-click the taskbar and select Toolbars-->New Toolbar.
(default Quick Launch is at: User\AppData\Roaming\Microsoft\Internet Explorer\Quick Launch)

## Explorer 
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

- Download AutohotKey to C:/Bin/

- See All.htk in Win/Shortcuts/

- Right click on script, open with, select autohotkey.exe

- Copy script 


- Create some scripts (Right click, new script.) 
 Example of script (Ctrl-Z lauches notepad):
    #z::
    Run, Notepad,
    return




# Vim
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

# Git
git config core.autocrlf true







---------------------------------------------------------------------------
OLD
---------------------------------------------------------------------------
# OLD

# WinSplit Revolution
Configuration is stored in:
"C:\Users\ebra\AppData\Roaming\Winsplit Revolution\"

# Babun

## Babun and ConEmu (see ConEmu)

# Cygwin

## Packages to add
vim
ssh
make 
gcc-fortran
dos2unix
unix2dos
git git-gui git-svn git-completion
wget

apt-cyg (from github), within Cygwin type:
lynx -source rawgit.com/transcode-open/apt-cyg/master/apt-cyg > apt-cyg
install apt-cyg /bin

