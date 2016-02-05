#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
#KeyHistory 0
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

;; --------------------------------------------------------------------------------
;; --- Move Windows  
;; --------------------------------------------------------------------------------
;; --- Home
;;lB := 110
; --- Work
lB := 133

SysGet, nMon, MonitorCount
SysGet, Mon1, Monitor, 1
lMW:= Mon1Right
lMH:= Mon1Bottom
if (nMon >1 ){
    SysGet, Mon2, Monitor, 2
    rMW:= Mon2Right-Mon2Left
    rMH:= Mon2Bottom
;;     MsgBox, Left: %Mon1Left% -- Top: %Mon1Top% -- Right: %Mon1Right% -- Bottom %Mon1Bottom%.
;;     MsgBox, Left: %Mon2Left% -- Top: %Mon2Top% -- Right: %Mon2Right% -- Bottom %Mon2Bottom%.
;;     MsgBox, % "Hello lMW" . lMW . " lMH" . lMH . " rMW" . rMW . " rMH" . rMH
}



move_window(motion){
    global lMW, lMH, rMW, rMH, lB
    ;;MsgBox, % "Motion " . motion . lMW

    ;; --------------------------------------------------------------------------------
    ;; --- Getting info about active window 
    ;; --------------------------------------------------------------------------------
    activeWindow := WinActive("A")
    borderThreshold := -10
    if ( activeWindow = 0 ) {
        return
    }
    WinGet, minMax, MinMax, ahk_id %activeWindow%
    WinGetPos, x, y, width, height, ahk_id %activeWindow%


    ;; --------------------------------------------------------------------------------
    ;; --- Setting up the different motions
    ;; --------------------------------------------------------------------------------
    if      (motion = "L"){
        if (x < lMW  ) {
            ; We are on left monitor
            newX := lB
            newY := 0
            newWidth  := lMW/2-lB/2
            newHeight := lMH
        } 
        else{
            ; We are on the right monitor
            newX := lMW
            newY := 0
            newWidth  := rMW/2
            newHeight := rMH
        }
    }
    else if (motion = "R"){ 
        if (x < lMW  ) {
            ; We are on left monitor
            newX := lB+lMW/2-lB/2
            newY := 0
            newWidth  := lMW/2-lB/2
            newHeight := lMH
        } 
        else{
            ; We are on the right monitor
            newX := lMW+rMW/2
            newY := 0
            newWidth  := rMW/2
            newHeight := rMH
        }
    }
    else if (motion = "T"){ 
        if (x < lMW  ) {
            ; We are on left monitor
            newX := lB
            newY := 0
            newWidth  := lMW-lB
            newHeight := lMH/2
        } 
        else{
            ; We are on the right monitor
            newX := lMW
            newY := 0
            newWidth  := rMW
            newHeight := rMH/2
        }
    }
    else if (motion = "B"){ 
        if (x < lMW  ) {
            ; We are on left monitor
            newX := lB
            newY := lMH/2
            newWidth  := lMW-lB
            newHeight := lMH/2
        } 
        else{
            ; We are on the right monitor
            newX := lMW
            newY := rMH/2
            newWidth  := rMW
            newHeight := rMH/2
        }
    }
    else if (motion = "C"){ 
        if (x < lMW-10  ) {
            ; We are on left monitor
            newWidth  := lMW/2
            newHeight := lMH/2
            newX := (newWidth/2)
            newY := (newHeight/2)
        } 
        else{
            ; We are on the right monitor
            newWidth  := rMW/2
            newHeight := rMH/2
            newX := lMW+(newWidth/2)
            newY :=     (newHeight/2)
        }
    }
    else if (motion = "TL"){ 
        if (x < lMW  ) {
            ; We are on left monitor
            newX := lB
            newY := 0
            newWidth  := lMW/2-lB/2
            newHeight := lMH/2
        } 
        else{
            ; We are on the right monitor
            newX := lMW
            newY := 0
            newWidth  := rMW/2
            newHeight := rMH/2
        }
    }
    else if (motion = "TR"){ 
        if (x < lMW  ) {
            ; We are on left monitor
            newX := lB+lMW/2-lB/2
            newY := 0
            newWidth  := lMW/2-lB/2
            newHeight := lMH/2
        } 
        else{
            ; We are on the right monitor
            newX := lMW+rMW/2
            newY := 0
            newWidth  := rMW/2
            newHeight := rMH/2
        }
    }
    else if (motion = "BL"){ 
        if (x < lMW  ) {
            ; We are on left monitor
            newX := lB
            newY := lMH/2
            newWidth  := lMW/2-lB/2
            newHeight := lMH/2
        } 
        else{
            ; We are on the right monitor
            newX := lMW
            newY := rMH/2
            newWidth  := rMW/2
            newHeight := rMH/2
        }
    }
    else if (motion = "BR"){ 
        if (x < lMW  ) {
            ; We are on left monitor
            newX := lB+lMW/2-lB/2
            newY := lMH/2
            newWidth  := lMW/2-lB/2
            newHeight := lMH/2
        } 
        else{
            ; We are on the right monitor
            newX := lMW+rMW/2
            newY := lMH/2
            newWidth  := rMW/2
            newHeight := rMH/2
        }
    }
    else {
        MsgBox, % "Not implemented: " . motion
    }
    ;;MsgBox, % " " . newX . " " . newY . " W" . newWidth . " H" . newHeight
    WinMove, ahk_id %activeWindow%, , %newX%, %newY%, %newWidth%, %newHeight%
    WinActivate ahk_id %activeWindow%  ;Needed - otherwise another window may overlap it
    return
}



#a:: move_window("L")
#d:: move_window("R")
#x:: move_window("B")
#w:: move_window("T")
#s:: move_window("C")
#e:: move_window("TR")
#q:: move_window("TL")
#c:: move_window("BR")
#z:: move_window("BL")



;; --------------------------------------------------------------------------------
;; --- SwitchMonitor.ahk
;; --------------------------------------------------------------------------------

send_screen(motion){
    global lMW, lMH, rMW, rMH, lB
    activeWindow := WinActive("A")
    borderThreshold := -10
    if ( activeWindow = 0 ) {
        return
    }
    WinGet, minMax, MinMax, ahk_id %activeWindow%
    WinGetPos, x, y, width, height, ahk_id %activeWindow%
   
    if (motion = "R") {
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
    }else {
        ; Sending to left
        if (x > lMW-10  ) {
          newY := y
          newX := x - lMW + border
          if (newX<lB) {
            newX:=lB
          }
          xScale := lMW / rMW
          yScale := lMH / rMH
          xScale :=1
          yScale :=1
          newWidth := width * xScale
          newHeight := height * yScale
          WinMove, ahk_id %activeWindow%, , %newX%, %newY%, %newWidth%, %newHeight%
          WinActivate ahk_id %activeWindow%  ;Needed - otherwise another window may overlap it
            }
    }
    return
}


#1:: send_screen("L")
#2:: send_screen("R")

;; --------------------------------------------------------------------------------
;; ---  
;; --------------------------------------------------------------------------------
#F1:: Send !{Space}m{Left}
#F2:: Send !{Space}s{Right}{Down}

;; --------------------------------------------------------------------------------
;; --- WindowToggleMaximize.ahk
;; --------------------------------------------------------------------------------
#3::
   WinGet MX, MinMax, A
   If MX
        WinRestore A
   Else WinMaximize A
Return
;; --------------------------------------------------------------------------------
;; --- NoCapsLock.ahk
;; --------------------------------------------------------------------------------
*CapsLock::Return

;; --------------------------------------------------------------------------------
;; --- WindowClose.ahk
;; --------------------------------------------------------------------------------
#esc::Send !{F4}

;; --------------------------------------------------------------------------------
;; --- Windows Keys to launch 
;; --------------------------------------------------------------------------------
;; --- WindowsExplorer
#t:: Run, Explorer H:\
;; --- 
;; #t:: Run, Explorer C:\Users\emmbr
;; --- WindowsRun (doesnt work in windows 8 )
;; shell:=ComObjCreate("Shell.Application")
;; #r::shell.FileRun()
Lwin & f::Send #q
#f::Send #q
;; --- WindowsSearch
#IfWinActive, Search Pane
^n::Send {Down}
^p::Send {Up}
^j::Send {Down}
^k::Send {Up}
^c::Send {End}+{Home}{Backspace}
Lwin::Send {Esc}
#IfWinActive

;; --------------------------------------------------------------------------------
;; --- Windows Shortcut desactivated
;; --------------------------------------------------------------------------------
;; LWin & Space :: return
;; --------------------------------------------------------------------------------
;; --- WindowsStartupMenu
;; --------------------------------------------------------------------------------
;; ~LWin up:: return

;; LWin:: return
; -- Twice the win key
~LWin up::
	if (A_PriorHotKey = A_ThisHotKey and A_TimeSincePriorHotkey < 500){
        Send {LWin}
;; 		MsgBox You double-pressed LWin!
    }
Return
;; Windows App Menu
#IfWinActive ahk_class ImmersiveLauncher
LWin:: Send {Esc}
^j::Send {Tab}
^k::Send !{Tab}
^h::Send {Left}
^l::Send {Right}
^n::Send {Down}{}
^p::Send {Up}
#IfWinActive


;; --------------------------------------------------------------------------------
;; ---  Browser
;; --------------------------------------------------------------------------------
#If WinActive("ahk_class IEFrame") || WinActive("ahk_class MozillaWindowClass")
^j::Send {Down}
^k::Send {Up}
^n::Send {Down}
^p::Send {Up}
^+j::Send {Down}
^+k::Send {Up}
^+n::Send {Down}
;; ^+k::Send {Up}
/::Send ^f
^+h::Send +^{Tab}
^+l::Send  ^{Tab}
^+;:: Send ^l
^o:: Send !{Left}  ; Back
^i:: Send !{Right} ; Forward
^u:: Send {PgUp}  ; 
^d:: Send {PgDn}  ;
#If
;; --------------------------------------------------------------------------------
;; --- Explorer 
;; --------------------------------------------------------------------------------
#IfWinActive ahk_class CabinetWClass
^j::Send {Down}
^k::Send {Up}
^+j::Send {Down}
^+k::Send {Up}
/::Send ^f
^+;:: Send !d  ; For to address (Alt-D)
^n:: return ; D
^o:: Send !{Left} ; 
^i:: Send !{Right} ; 
^p:: SendEvent !{Up}  ; Needs event because explorer doesnt like send (input mode)
^u:: Send {PgUp}  ; 
^d:: Send {PgDn}  ;
^+n:: Send ^n
, & s:: Send !fP
#IfWinActive

;; --------------------------------------------------------------------------------
;; --- Console 
;; --------------------------------------------------------------------------------
#IfWinActive ahk_class ConsoleWindowClass
#esc::Send !{Space}c
#IfWinActive


;; --------------------------------------------------------------------------------
;; ---  WindowSwitcher (If Windows 8 and no UI Access)
;; --------------------------------------------------------------------------------
;; --------------------------------------------------------------------------------
;; ;; task_switch() {
;; ;; run, "C:\Users\ebra\Config\Win\KeyboardShortcuts\Window Switcher" ; must be in script directory otherwise include path 
;; ;; WinWait, Task Switching,, 2
;; ;; KeyWait, LCtrl
;; ;; Send, {Enter}
;; ;; return
;; ;; }
;; ;; LCtrl & j:: task_switch() return
;; ;; LCtrl & k:: task_switch() return
;; ;;  
;; ;; #IfWinActive, Task Switching
;; ;; LCtrl & k::Send, {Right}
;; ;; LCtrl & j::Send, {Left}
;; 
;; --------------------------------------------------------------------------------
;; ---  WindowSwitcher (works on all platform and windows 8 if you use EnableUIAccess)
;; --------------------------------------------------------------------------------
LWin & k::AltTab
LWin & j::ShiftAltTab



