#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

; Left Monitor Width and Height
lMW := 1920
lMH:= 1080
rMW := 1600
rMH := 900
var:=1
varb:=1

myfun(){
    global var,varb
    MsgBox, % "On index " . varb . " " . var
}


move_window(motion){
    global lMW, lMH, rMW, lMH
    if (motion = "L"){
        MsgBox, % "Left" 
    }
    else {
        MsgBox, % "Not implemented" 
    }
}



#a:: 
move_window("L")
return



;; --------------------------------------------------------------------------------
;; --- SwitchMonitor.ahk
;; --------------------------------------------------------------------------------

#1:: send_left_screen()
#2:: send_right_screen()
   

send_right_screen(){
    global lMW, lMH, rMW, lMH
    activeWindow := WinActive("A")
    borderThreshold := -10
    if ( activeWindow = 0 ) {
        return
    }
    WinGet, minMax, MinMax, ahk_id %activeWindow%
    WinGetPos, x, y, width, height, ahk_id %activeWindow%
   
    ; Sending to right
    if (x < lMW  ) {
        newY := y
        newX := lMW + 1
        xScale :=1
        yScale :=1
        newWidth := width * xScale
        newHeight := height * yScale
	WinMove, ahk_id %activeWindow%, , %newX%, %newY%, %newWidth%, %newHeight%
	WinActivate ahk_id %activeWindow%  ;Needed - otherwise another window may overlap it
    } 
    return
}
send_left_screen(){
    global lMW, lMH, rMW, lMH
    activeWindow := WinActive("A")
    border := 106
    if (activeWindow = 0 ){
        return
    }
    WinGet, minMax, MinMax, ahk_id %activeWindow%
    WinGetPos, x, y, width, height, ahk_id %activeWindow%
   
    ; Sending to left
    if (x > lMW-10  ) {
        newY := y
        newX := x - lMW + border
        xScale := lMW / rMW
        yScale := lMH / rMH
       xScale :=1
       yScale :=1
       newWidth := width * xScale
       newHeight := height * yScale
        WinMove, ahk_id %activeWindow%, , %newX%, %newY%, %newWidth%, %newHeight%
        WinActivate ahk_id %activeWindow%  ;Needed - otherwise another window may overlap it
    }
return
}

;; --------------------------------------------------------------------------------
;; ---  
;; --------------------------------------------------------------------------------

;; --------------------------------------------------------------------------------
;; --- WindowToggleMaximize.ahk
;; --------------------------------------------------------------------------------
#3::
   WinGet MX, MinMax, A
   If MX
        WinRestore A
   Else WinMaximize A
Return
;; #3::WinMaximize, A 

global leftBar := 133
send_right(){
    global lMW, lMH, rMW, lMH
    
    activeWindow := WinActive("A")
    borderThreshold := -10
    if ( activeWindow = 0 ) {
        return
    }
    WinGet, minMax, MinMax, ahk_id %activeWindow%
    WinGetPos, x, y, width, height, ahk_id %activeWindow%
   
    if (x < lMW  ) {
        ; We are on left monitor
        newX := lB
        newY := 0
        newWidth  := lMW/2-lB/2
        newHeight := lMH
        WinMove, ahk_id %activeWindow%, , %newX%, %newY%, %newWidth%, %newHeight%
        WinActivate ahk_id %activeWindow%  ;Needed - otherwise another window may overlap it
    } 
    return
}
;; #a:: send_right()

;; --------------------------------------------------------------------------------
;; --- WindowClose.ahk
;; --------------------------------------------------------------------------------
#esc::Send !{F4}

;; --------------------------------------------------------------------------------
;; --- WindowsExplorer.ahk
;; --------------------------------------------------------------------------------
#t::
Run, Explorer C:\Users
return

;; --------------------------------------------------------------------------------
;;WindowsRun.ahk
;; --------------------------------------------------------------------------------
shell:=ComObjCreate("Shell.Application")
#r::shell.FileRun()


;; --------------------------------------------------------------------------------
;; --- WindowsNoStartupMenu
;; --------------------------------------------------------------------------------
;; ~LWin up:: return


;; --------------------------------------------------------------------------------
;; ---  WindowSwitcher (If Windows 8 and no UI Access)
;; --------------------------------------------------------------------------------
;; --------------------------------------------------------------------------------
;; task_switch() {
;; run, "H:\Config\Win\KeyboardShortcuts\Window Switcher" ; must be in script directory otherwise include path 
;; WinWait, Task Switching,, 2
;; KeyWait, LCtrl
;; Send, {Enter}
;; return
;; }
;; LCtrl & j:: task_switch() return
;; LCtrl & k:: task_switch() return
;; ;;  
;; #IfWinActive, Task Switching
;; LCtrl & k::Send, {Right}
;; LCtrl & j::Send, {Left}


task_switch_win() {
run, "H:\Config\Win\KeyboardShortcuts\Window Switcher" ; must be in script directory otherwise include path 
WinWait, Task Switching,, 2
KeyWait, LWin
Send, {Enter}
return
}

LWin & j:: task_switch_win() return
LWin & k:: task_switch_win() return



#IfWinActive, Task Switching
LWin & k::Send, {Right}
LWin & j::Send, {Left}



;; --------------------------------------------------------------------------------
;; ---  WindowSwitcher (works on all platform and windows 8 if you use EnableUIAccess)
;; --------------------------------------------------------------------------------
;; LWin & k::AltTab
;; LWin & j::ShiftAltTab

#z::Send {Alt down}{tab} ; Asterisk is required in this case.
;;*F1::Send {Alt down}{tab} ; Asterisk is required in this case.
;;!F2::Send {Alt up}  ; Release the Alt key, which activates the selected window.
;;~*Escape::
;;IfWinExist ahk_class #32771
;;    Send {Escape}{Alt up}  ; Cancel the menu without activating the selected window.
;;return

LCtrl & CapsLock::MsgBox 
!MButton::  ; Middle mouse button. The ! prefix makes it fire while the Alt key is down (which it is if the alt-tab menu is visible).
IfWinExist ahk_class #32771  ; Indicates that the alt-tab menu is present on the screen.
    Send !{Escape}{Alt up}
return

