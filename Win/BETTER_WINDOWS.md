
# Use a software package manager
Install one program to install/manage all of your other programs...
Install Chocolatey


# Programs to install
WinSplit Revolution 11
AutoHotKey
Git  (with admin rights in Programfiles 86)
Vim
EveditorFree
ContextEdit  (to add a context menu action e.g. open command here)
ConsoleZ
Babun
ConEmu  (use AppData/Roaming/ConEmu.xml for config file)


#  


# Windows Config:

## TaskBar Config:
Right click on task bar:
- unlock
- Use small buttons
- Never combine

## Add QuickLaunch to TaskBar
Right-click the taskbar and select Toolbars-->New Toolbar.
(default Quick Launch is at: User\AppData\Roaming\Microsoft\Internet Explorer\Quick Launch)

## Disable Full path in title bar (and hence task bar) for Explorer 
Folder Options>View> Uncheck "Display the full path in the title bar"



# WinSplit Revolution
Configuration is stored in:
"C:\Users\ebra\AppData\Roaming\Winsplit Revolution\"


# HotKeys

- Install AutoHotKeys

- For windows 8 and higher, it may be best to enable UIAccess on the autohotkey.exe file. Download EnableUiAccess from:  https://autohotkey.com/board/topic/70449-enable-interaction-with-administrative-programs/ 
Unzip the files, and run the main script. Select AutohotKey.exe, overwrite it. 

- Create some scripts (Right click, new script.) 
 Example of script (Ctrl-Z lauches notepad):
#z::
Run, Notepad,
return

- Put Your scripts in:
C:\Users\ebra\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup






# Git
git config core.autocrlf true


# Vim

edit the file _vimrc to remove the source mswin and behave mswin line

In vim: type :help runtimepath to see where the _vimrc is looked for.

If you want to change this location one option is to change the environment variable %HOME%





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
## Cygwin and ConEmu (see ConEmu)






# ConEmu
## ConEmu and Babun (see babun)

In ConEmu
    Go to Settings>Startup>Tasks
    Create a new task
        Task parameters - /icon "%userprofile%.babun\cygwin\bin\mintty.exe" /dir "%userprofile%"
        Commands %userprofile%\.babun\cygwin\bin\mintty.exe -

Then babun is available in the "Create new console" menu.







# Links
http://lifehacker.com/how-to-get-the-best-linux-features-on-windows-1569195729

https://www.reddit.com/r/customization/comments/19t8ow/making_windows_feel_more_like_ubuntulinux/

http://www.instructables.com/id/Give-Your-Computer-A-Cool-Linux-Feel/



http://windowspager.sourceforge.
net/

http://lifehacker.com/lifehacker-pack-for-windows-our-list-of-the-best-windo-787533613


http://answers.microsoft.com/en-us/windows/forum/windows_7-desktop/how-do-i-change-the-windows-7-keyboard-shortcuts/0110d32d-66c0-4ce7-8682-eeb896e80c3f?page=2


https://www.google.dk/search?q=Manage+windows+shortcutsw&ie=utf-8&oe=utf-8&gws_rd=cr&ei=ppVhVo2jIsOcygP-y6zYCg


