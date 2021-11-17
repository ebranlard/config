



# Programs to install
EveditorFree
SumatraPdf
ConEmu



Msys2 (shell and package manager):
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



# Firefox with AdBlockPlus plugin
Install adblock plus


# AutoHotKeys

- Install AutoHotKeys.  No need to patch for windows 10 (autohotkey installed with Chocolatey)
- Go to Config\Win\Autohotkey and ru nthe script copy.bat This Puts your scripts in:
	C:\Users\%USER%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup

- For windows 8 and higher, it may be best to enable UIAccess on the autohotkey.exe file. Download EnableUiAccess from:  https://autohotkey.com/board/topic/70449-enable-interaction-with-administrative-programs/ 
Unzip the files, and run the main script. Select AutohotKey.exe, overwrite it. 

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


# Links
http://lifehacker.com/how-to-get-the-best-linux-features-on-windows-1569195729

https://www.reddit.com/r/customization/comments/19t8ow/making_windows_feel_more_like_ubuntulinux/

http://www.instructables.com/id/Give-Your-Computer-A-Cool-Linux-Feel/


http://windowspager.sourceforge.
net/

http://lifehacker.com/lifehacker-pack-for-windows-our-list-of-the-best-windo-787533613

http://answers.microsoft.com/en-us/windows/forum/windows_7-desktop/how-do-i-change-the-windows-7-keyboard-shortcuts/0110d32d-66c0-4ce7-8682-eeb896e80c3f?page=2

https://www.google.dk/search?q=Manage+windows+shortcutsw&ie=utf-8&oe=utf-8&gws_rd=cr&ei=ppVhVo2jIsOcygP-y6zYCg


