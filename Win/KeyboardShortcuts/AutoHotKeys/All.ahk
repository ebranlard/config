#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

;; ----------------------------------------------------------------------
;;NoCapsLock.ahk
;; ----------------------------------------------------------------------
*CapsLock::Return


;; ----------------------------------------------------------------------
;;SwitchMonitor.ahk
;; ----------------------------------------------------------------------
global leftMonitorWidth = 1920
global leftMonitorHeight = 1080
global rightMonitorWidth = 1600
global rightMonitorHeight = 900

#1:: send_left()
#2:: send_right()
   

send_right(){
    activeWindow := WinActive("A")
    borderThreshold := -10
    if ( activeWindow = 0 ) {
        return
    }
    WinGet, minMax, MinMax, ahk_id %activeWindow%
    WinGetPos, x, y, width, height, ahk_id %activeWindow%
   
    ; Sending to right
    if (x < leftMonitorWidth  ) {
        newY := y
        newX := leftMonitorWidth + 1
	xScale :=1
	yScale :=1
        newWidth := width * xScale
        newHeight := height * yScale
	WinMove, ahk_id %activeWindow%, , %newX%, %newY%, %newWidth%, %newHeight%
	WinActivate ahk_id %activeWindow%  ;Needed - otherwise another window may overlap it
    } 
    return
}
send_left(){
    activeWindow := WinActive("A")
    borderThreshold := -10
    if (activeWindow = 0 ){
        return
    }
    WinGet, minMax, MinMax, ahk_id %activeWindow%
    WinGetPos, x, y, width, height, ahk_id %activeWindow%
   
    ; Sending to left
    if (x > leftMonitorWidth-10  ) {
        newY := y
        newX := x - leftMonitorWidth
        xScale := screenLeftMonitorWidth / screenRightMonitorWidth
        yScale := screenLeftMonitorHeight / screenRightMonitorHeight
       xScale :=1
       yScale :=1
        newWidth := width * xScale
        newHeight := height * yScale
        WinMove, ahk_id %activeWindow%, , %newX%, %newY%, %newWidth%, %newHeight%
        WinActivate ahk_id %activeWindow%  ;Needed - otherwise another window may overlap it
     }
return
}

;; ----------------------------------------------------------------------
;;WindowClose.ahk
;; ----------------------------------------------------------------------
; WinClose
#esc::Send !{F4}

;; ----------------------------------------------------------------------
;;WindowToggleMaximize.ahk
;; ----------------------------------------------------------------------
#3::
   WinGet MX, MinMax, A
   If MX
        WinRestore A
   Else WinMaximize A
Return

;; ----------------------------------------------------------------------
;;WindowsExplorer.ahk
;; ----------------------------------------------------------------------
#t::
Run, Explorer C:\Users
return

;; ----------------------------------------------------------------------
;;WindowsRun.ahk
;; ----------------------------------------------------------------------
shell:=ComObjCreate("Shell.Application")
#r::shell.FileRun()


;; ----------------------------------------------------------------------
;;WindowsNoStartupMenu.ahk
;; ----------------------------------------------------------------------
~LWin up:: return


;; ----------------------------------------------------------------------
;;WindowSwitcher.ahk
;; ----------------------------------------------------------------------
;;  Run, "C:\Users\ebra\Config\Win\Window Switcher.lnk"

;; LWin & k::AltTab
;; LWin & j::ShiftAltTab

;;  #Tab:: Run, "C:\Users\ebra\Config\Win\Window Switcher"


task_switch() {
run, "C:\Users\ebra\Config\Win\KeyboardShortcuts\Window Switcher" ; must be in script directory otherwise include path 
WinWait, Task Switching,, 2
KeyWait, LCtrl
Send, {Enter}
return
}

LCtrl & j:: task_switch() return
LCtrl & k:: task_switch() return
 
#IfWinActive, Task Switching
LCtrl & k::Send, {Right}
LCtrl & j::Send, {Left}

