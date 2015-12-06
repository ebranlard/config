#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

;;  Run, "C:\Users\ebra\Config\Win\Window Switcher.lnk"

;; LWin & k::AltTab
;; LWin & j::ShiftAltTab

;;  #Tab:: Run, "C:\Users\ebra\Config\Win\Window Switcher"


task_switch() {
run, "C:\Users\ebra\Config\Win\KeyboardShortcuts\Window Switcher" ; must be in script directory otherwise include path 
WinWait, Task Switching,, 2
KeyWait, LWin
Send, {Enter}
return
}

LWin & j:: task_switch() return
LWin & k:: task_switch() return
 
#IfWinActive, Task Switching
LWin & k::Send, {Right}
LWin & j::Send, {Left}


