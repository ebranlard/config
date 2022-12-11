#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
#KeyHistory 0
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

;; --------------------------------------------------------------------------------
;; --- Global variables 
;; --------------------------------------------------------------------------------
gvim:="C:\Bin\Vim\vim82\gvim.exe"
diff:="C:\Program Files\WinMerge\WinMergeU.exe /r"
;; cmd:="C:\ProgramData\chocolatey\bin\Console.exe"
cmd:="C:\Bin\ConEmu\ConEmu.exe" 

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
;; #h::return
#l::return
;; ^!l:: SendEvent #l  ; Lock
;;#k::return
;; --- FuzzyRun / Wox CtrlAlt Space or Alt Space or Win+r 
;#r:: Run, python C:\Work\Geekeries\fuzzy-run\fuzzy-run
;; #r:: Send ^!{Space}
;; #Space:: Send ^!{Space}
;; --- WindowsExplorer
#t:: Run, Explorer C:\Work
;; --- Switch to Matlab
#m:: Run, wmctrl -a MATLAB  ; ,,Hide
;; --- Switch to Gvim
#g:: Run, wmctrl -a gvim    ;,,Hide
;; --- Switch to ConEmu
#h:: Run, wmctrl -a ConEmu    ;,,Hide
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
        Send ^!{Space}
    }
;;     return
;; #IfWinActive, Search Panea
;; #IfWinActive ahk_class ImmersiveLauncher
#IfWinActive ahk_class Windows.UI.Core.CoreWindow
^[::Send {Esc}
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
;; #If WinActive("ahk_class IEFrame") || WinActive("ahk_class MozillaWindowClass")
;;^n::Send {Down}
;; ;;^j::Send {Down}
;; ;;^k::Send {Up}
;; ;;^n::Send {Down}
;; ;;^p::Send {Up}
;; ^+j::Send {Down}
;; ^+k::Send {Up}
;; ;;^+n::Send {Down}
;; ;; ^+k::Send {Up}
;; ^/::Send ^f
;; ^+h::Send +^{Tab}
;; ^+l::Send  ^{Tab}
;; ^+;:: Send ^l
;; ;;^o:: Send !{Left}  ; Back
;; ;;^i:: Send !{Right} ; Forward
;; ;;^u:: Send {PgUp}  ; 
;; ;;^d:: Send {PgDn}  ;
;; ^w:: return
;; ;;^+[:: Send +{Esc}
;; #If
;; --------------------------------------------------------------------------------
;; --- Explorer 
;; --------------------------------------------------------------------------------
#IfWinActive ahk_class CabinetWClass
^[:: Send {Esc}
^j::Send {Down}
^k::Send {Up}
^+j::Send {Down}
^+k::Send {Up}
/::Send ^f
::: Send !d    ; Go to address (Alt-D)
^0:: ; Go to file list
    Send !d ; first go to address bar
    Sleep, 10
    Send {Enter}
    Sleep, 10
    Send {F6}
    Sleep, 10
    Send {F6}  
    return
;; ^n:: return ; D
^o:: Send !{Left}  ; Go to previous folder in history
^i:: Send !{Right} ; Got to next folder in history
^p:: SendEvent !{Up}  ; Go to parent directory, Needs event because explorer doesnt like send (input mode)
^u:: Send {PgUp}  ; 
^d:: Send {PgDn}  ;
^+n:: Send ^n     ; new window of explorer
^e::Send {F2}     ; rename file
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
    ;MsgBox %edittext%
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
;; FAT FINGERS
F1::Send {F2}

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
;; esc::         MsgBox, 0, , STUPID STUPID STUPID STUPID STUPID STUPID STUPID STUPID STUPID, 0.1
;; ^c::          MsgBox, 0, , STUPID STUPID STUPID STUPID STUPID STUPID STUPID STUPID STUPID, 0.1
;; backspace::   MsgBox, 0, , STUPID STUPID STUPID STUPID STUPID STUPID STUPID STUPID STUPID, 0.1
;; #IfWinActive

#IfWinActive ahk_exe octave-gui.exe
^k::Send {Up}
^j::Send {Down}
#IfWinActive 

;; --------------------------------------------------------------------------------
;; --- Console 
;; --------------------------------------------------------------------------------
#IfWinActive ahk_exe cmd.exe
#esc::Send !{Space}c   ; close console
^k::Send {Up}
^j::Send {Down}
#IfWinActive

#IfWinActive ahk_exe ConEmu.exe
^k::Send {Up}
^j::Send {Down}
#IfWinActive

#IfWinActive ahk_exe debian.EXE
#esc::Send ^d   ; close console
#IfWinActive
;; --------------------------------------------------------------------------------
;; ---  WindowSwitcher 
;; --------------------------------------------------------------------------------
LWin & k::AltTab
LWin & j::ShiftAltTab

