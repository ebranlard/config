#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
#KeyHistory 0
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

;; --------------------------------------------------------------------------------
;; --- Global variables 
;; --------------------------------------------------------------------------------
gvim:="C:\Program Files (x86)\Vim\vim81\gvim.exe"
diff:="C:\Program Files (x86)\WinMerge\WinMergeU.exe"
cmd:="C:\ProgramData\chocolatey\bin\Console.exe"
InsertMode:=0

;; --------------------------------------------`-----------------------------------
;; --- Move Windows  
;; --------------------------------------------------------------------------------
;; --- Home
;;lB := 110
; --- Work
lB := 102

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
if (lMW > 1920) {
    lMW:=lMW/2
    rMW:=lMW
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
;; TODO try to use this to get the workarea right
;; SnapToLeft() {
;;     WinGet, HWND, ID, A
;;     WinRestore, ahk_id %HWND%
;;     WinGetPos, X, Y, W, H, ahk_id %HWND%
;;     if (X != 0) {
;;         SysGet, MP, MonitorPrimary
;;         SysGet, MWA, MonitorWorkArea, %MP%
;;         NewWidth := W + X
;;         WinMove, ahk_id %HWND%,,0,%Y%,%NewWidth%,%H%
;;     }
;;     return
;; }



;; #a:: move_window("L")
;; #d:: move_window("R")
#a:: SendEvent #{Left}
#d:: SendEvent #{Right}
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


;; #1:: send_screen("L")
;; #2:: send_screen("R")
;; #1:: SendEvent #!{Left}
;; #2:: SendEvent #!{Right}
#1:: Send, {LWin Down}{LShift Down}{Right}{LShift Up}{LWin Up}
#2:: Send, {LWin Down}{LShift Down}{Left}{LShift Up}{LWin Up}
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
!esc::return

;; --------------------------------------------------------------------------------
;; --- Windows Keys Win+...
;; --------------------------------------------------------------------------------
#h::return
;;#k::return
;; --- FuzzyRun / Wox CtrlAlt Space or Alt Space or Win+r 
;#r:: Run, python C:\Work\Geekeries\fuzzy-run\fuzzy-run
#r:: Send ^!{Space}
#Space:: Send ^!{Space}
;; --- WindowsExplorer
#t:: Run, Explorer H:\
;; --- Switch to Matlab
#m:: Run, wmctrl -a MATLAB ,,Hide
;; --- Switch to Gvim
#g:: Run, wmctrl -a gvim ,,Hide
;; --- 
;; #t:: Run, Explorer C:\Users\emmbr
;; --- WindowsRun (doesnt work in windows 8 )
;; shell:=ComObjCreate("Shell.Application")
;; #r::shell.FileRun()
;; --------------------------------------------------------------------------------
;; --- WindowsSearch/WindowsMenu
;; --------------------------------------------------------------------------------
#f::
    Send, {RWin down}
    Send, {RWin up}
return
;; Lwin & f::Send #q
;;#f::SendEvent {LWin}
;; #f:: SendEvent {LWin}
;; #f:: Send {LWin}
; -- Twice the win key
;; LWin:: return
LWin:: 
	if (A_PriorHotkey <> A_ThisHotKey or A_TimeSincePriorHotkey > 300)
	{
		return
	} else {
        ;; WOX
        Send ^!{Space}
        ;; Windows
;;         Send, {LWin down}
;;         Send, {LWin up}
    }
    return
;; #IfWinActive, Search Panea
;; #IfWinActive ahk_class ImmersiveLauncher
#IfWinActive ahk_class Windows.UI.Core.CoreWindow
^n::Send {Down}
^p::Send {Up}
^j::Send {Down}
^k::Send {Up}
^c::Send !{F4}
Lwin::Send !{F4}
#IfWinActive

;; --------------------------------------------------------------------------------
;; ---  Browser
;; --------------------------------------------------------------------------------
#If WinActive("ahk_class IEFrame") || WinActive("ahk_class MozillaWindowClass")
^n::Send {Down}
;;^j::Send {Down}
;;^k::Send {Up}
;;^n::Send {Down}
;;^p::Send {Up}
^+j::Send {Down}
^+k::Send {Up}
;;^+n::Send {Down}
;; ^+k::Send {Up}
^/::Send ^f
^+h::Send +^{Tab}
^+l::Send  ^{Tab}
^+;:: Send ^l
;;^o:: Send !{Left}  ; Back
;;^i:: Send !{Right} ; Forward
;;^u:: Send {PgUp}  ; 
;;^d:: Send {PgDn}  ;
^w:: return
;;^+[:: Send +{Esc}
#If
;; --------------------------------------------------------------------------------
;; --- Explorer 
;; --------------------------------------------------------------------------------
#IfWinActive ahk_class CabinetWClass
;; ---  Insert mode togle with i/ctrl-[ and navigation with jk
;; ^[:: InsertMode:=0
;; i:: 
;;     if InsertMode=0
;;         InsertMode:=1
;;     else
;;         Send i
;;     return
;; j::
;;     if InsertMode=0
;;         Send {Down}
;;     else
;;         Send j
;;     return
;; k::
;;     if InsertMode=0
;;         Send {Up}
;;     else
;;         Send k
;;     return
;; +j::
;;     if InsertMode=0
;;         Send !{Down}
;;     else
;;         Send J
;;     return
;; +k::
;;     if InsertMode=0
;;         Send !{Up}
;;     else
;;         Send K
;;     return
;; 0:: 
;;     if InsertMode=0
;;        Send {Home}
;;     else
;;         Send 0
;;     return
;; x:: 
;;     if InsertMode=0
;;        Send {Del}
;;     else
;;         Send x
;;     return
;; h::
;;     if InsertMode=0
;;         Send {Left}
;;     else
;;         Send h
;;     return
;; l::
;; if InsertMode=0
;;     Send {Right}
;; else
;;     Send l
;; return
;; ^j::Send ^{Down}
;; ^k::Send ^{Up}
;; ^+j::Send ^+{Down}
;; ^+k::Send ^+{Up}
^j::Send {Down}
^k::Send {Up}
^+j::Send {Down}
^+k::Send {Up}
/::Send ^f
::: Send !d  ; For to address (Alt-D)
^;:: Send !d  ; For to address (Alt-D)
^+;:: Send !d  ; For to address (Alt-D)
^0:: ; Go to file list
    Send !d ; first go to address bar
    Sleep, 10
    Send {Enter}
    Sleep, 10
    Send {F6}
    Sleep, 10
    Send {F6}  
    return
^n:: return ; D
^o:: Send !{Left} ; 
^i:: Send !{Right} ; 
^p:: SendEvent !{Up}  ; Needs event because explorer doesnt like send (input mode)
^u:: Send {PgUp}  ; 
^d:: Send {PgDn}  ;
^+n:: Send ^n
^e::Send {F2} ; rename
; --- Edit a file in vim
^]::
    Clipboard =  ; Start blank for ClipWait detection to work.
    Send ^c
    ClipWait 2
    if ErrorLevel 
      return ; Nothing found on clipboard.
    StringReplace,Clipboard,Clipboard,`r`n," ",A
    Run, %gvim%  -p "%Clipboard%"
    return
; --- Diff it
^m::
    Clipboard =  ; Start blank for ClipWait detection to work.
    Send ^c
    ClipWait 2
    if ErrorLevel  ; Nothing found on clipboard.
       return
    StringReplace,Clipboard,Clipboard,`r`n," ",A
    Run, %diff%  "%Clipboard%"
    return
; ---- Open Terminal
open_terminal_explorer(){
    global cmd
    Send ^l
    ControlGetText, edittext , edit1, ahk_class CabinetWClass
    ;;MsgBox %edittext%
    if substr(edittext,2,1) <> ":"
        return
    ;; Run, %comspec%,%edittext%
    Run, %cmd%,%edittext%
    return
}
^s::    open_terminal_explorer()
, & s:: open_terminal_explorer()
;; , & s:: Send !fP  ; open a terminal
;; ^s::  Send !fP
#IfWinActive ; explorer

^backspace::Send +{F10}  ; Open Context menu
;; --------------------------------------------------------------------------------
;; --- Excel
;; --------------------------------------------------------------------------------
#IfWinActive ahk_exe EXCEL.EXE
^h::Send {Left}
^l::Send {Right}
^j::Send {Down}
^k::Send {Up}
^+h::Send {Left}
^+l::Send {Right}
^+j::Send {Down}
^+k::Send {Up}
^e::Send {F2}
^backspace::Send +{F10}
#IfWinActive
;; --------------------------------------------------------------------------------}
;; --- Vim! 
;; --------------------------------------------------------------------------------{
;; #IfWinActive ahk_class Vim
esc::         MsgBox, 0, , STUPID STUPID STUPID STUPID STUPID STUPID STUPID STUPID STUPID, 0.1
;; ^c::          MsgBox, 0, , STUPID STUPID STUPID STUPID STUPID STUPID STUPID STUPID STUPID, 0.1
;; backspace::   MsgBox, 0, , STUPID STUPID STUPID STUPID STUPID STUPID STUPID STUPID STUPID, 0.1
;; #IfWinActive


;; --------------------------------------------------------------------------------
;; --- Console 
;; --------------------------------------------------------------------------------
#IfWinActive ahk_exe cmd.exe
#esc::Send !{Space}c   ; close console
^k::Send {Up}
^j::Send {Down}
#IfWinActive

#IfWinActive ahk_class Console_2_Main
^k::Send {Up}
^j::Send {Down}
#IfWinActive

#IfWinActive ahk_exe debian.EXE
#esc::Send ^d   ; close console
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


;; --------------------------------------------------------------------------------
;; --- Wox quick launch
;; --------------------------------------------------------------------------------
#IfWinActive ahk_exe Wox.exe
^+::Send ^h
^h::Send {Left}
^l::Send {Right}
^x::Send {Del}
^c::
   Send ^a
   Send {Del}
   return
#IfWinActive

