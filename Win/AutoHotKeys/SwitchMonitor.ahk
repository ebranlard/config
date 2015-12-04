#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.


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

;;    if (minMax = 1) {
;        ; WinRestore, ahk_id %activeWindow%
;        ; a maximized window has x,y = -8,-8 on Windows 8
;        newY := y
;        if (x > borderThreshold) {
;            newX := x - screenLeftMonitorWidth
;            newWidth := screenLeftMonitorWidth   - screenRightMonitorWidth  + width
;            newHeight := screenLeftMonitorHeight - screenRightMonitorHeight + height
;        } else {
;            newX := x + screenLeftMonitorWidth
;            newWidth := screenRightMonitorWidth   - screenLeftMonitorWidth  + width
;            newHeight := screenRightMonitorHeight - screenLeftMonitorHeight + height
;        }
;    } else {
;        WinGetPos, x, y, width, height, ahk_id %activeWindow%
;        if (x > borderThreshold) {
;            xScale := screenLeftMonitorWidth / screenRightMonitorWidth
;            yScale := screenLeftMonitorHeight / screenRightMonitorHeight
;            newX := x * xScale
;            newY := y * yScale
;            newWidth := width * xScale
;            newHeight := height * yScale
;            newX := newX - screenLeftMonitorWidth
;        } else {
;            xScale := screenRightMonitorWidth / screenLeftMonitorWidth
;            yScale := screenRightMonitorHeight / screenLeftMonitorHeight
;            x := screenLeftMonitorWidth + x
;            newX := x * xScale
;            newY := y * yScale
;            newWidth := width * xScale
;            newHeight := height * yScale
;        }
;    }


