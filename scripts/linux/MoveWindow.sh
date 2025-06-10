#!/bin/bash
# Written by Emmanuel Branlard - November 2012
# Requires: wmctrl
# 
# This script assumes(and detect) the configuration is one of the two following:
# Case 1: External Screen (left, main screen) - Laptop Screen (right)
# Case 2: Laptop Screen (main screen)

# TODO: make it general and support horizontal bottom bars

# Argument takes values:
# R L T B BL BR TL TR C M SR SL: Right, left, top, bottom,etc, Center, Maximize, ScrenRight ScreenLeft
#
# Usage: ./MoveWindow.sh L


# Params:
XDIMLAPTOP=1600
YDIMLAPTOP=900
XOFFMAIN=110 # X offset main screen
YOFFDECO=8 # Y offset due to window decoration
YOFFMAIN=0 # Y offset main screen
YOFF2=0 # Y offset screen 2

# Advanced params
YTWEAK=4;
XTWEAK=-8;
XTOL=300 # Tolerance if a window is on two screens to chose between left or right



## Setup 
# Determine screen size
DIM=`xdpyinfo | awk '/dimensions:/ {print $2}'`;
XDIM=`echo $DIM|cut -f1 -d'x'`; # width
YDIM=`echo $DIM|cut -f2 -d'x'`; # height
# Get Active Window ID
WID=$(xdotool getactivewindow);
# Find Window Position location
XW=`xwininfo -id $WID |grep "Absolute upper-left X"| awk '{print $4}'`;



# --------------------------------------------------------------------------------
# --- That's not general enough 
# --------------------------------------------------------------------------------
# Depending on screen configuration, find screen dimensions
ONESCREEN=1
if [[ $DIM == "1920x1080" ]]
then
    ONESCREEN=1
else 
    if [[ $XDIM > $XDIMLAPTOP ]] # THIS IS A NASTY TEST!!!
    then
        ONESCREEN=0
    fi
fi


# --------------------------------------------------------------------------------
# --- That's trying to be general 
# --------------------------------------------------------------------------------
# Setting up the following variables
# XSTART
# YSTART
# WIDTH
# HEIGHT
if [[ $ONESCREEN == 1 ]] 
then
    # --- Single screen config 
    #     echo "Single screen config"
    XSTART=$XOFFMAIN;
    YSTART=$YOFFMAIN;
    WIDTH=`expr $XDIM - $XSTART`;
    HEIGHT=`expr $YDIM - $YOFFMAIN`;
else
    # --- Multiple screen config 
    #     echo "Multiple screens config"
    # TODO TODO TODO, this is not general
    XS2=`expr $XDIM - $XDIMLAPTOP`; # x start of screen 2
    XS2flex=`expr $XS2 - $XTOL`;      # add offset if window in between screens
    #     if [ $XW -gt $XS2 ]  
    if [ $XW -gt $XS2flex ]  
    then
        #         echo "Window is in right screen"
        XSTART=$XS2;
        YSTART=$YOFF2;
        WIDTH=$XDIMLAPTOP;
        HEIGHT=`expr $YDIMLAPTOP - $YOFF2`;
        XSTARTS1=
    else
        #         echo "Window is in left screen"
        XSTART=$XOFFMAIN;
        YSTART=$YOFFMAIN;
        WIDTH=`expr $XS2 - $XSTART`;
        HEIGHT=`expr $YDIM - $YOFF2`;
    fi
fi
# echo Params are: $XSTART $YSTART $WIDTH $HEIGHT




## General computations
# Half width and height
HW=`expr $WIDTH / 2`;
HH=`expr $HEIGHT / 2 - $YOFFDECO`;
# Full width and height
FW=`expr $WIDTH `;
FH=`expr $HEIGHT - $YOFFDECO`;

# Mid starts
YSTART2=`expr $YSTART + $HH + $YTWEAK`;
XSTART2=`expr $XSTART + $HW + $XTWEAK`;

# Center starts
YSTARTC=`expr $YSTART + $HH / 2`;
XSTARTC=`expr $XSTART + $HW / 2`;

## Starts for shifting form one screen to the other
if [[ $XDIM > $XDIMLAPTOP ]]
then # "Multiple screens config"
    XSTARTS1=`expr $XOFFMAIN + $XS2 / 4 `;
    XSTARTS2=`expr $XS2 + $XDIMLAPTOP / 4`;
else # "Single screen config"
    XSTARTS1=$XSTARTC;
    XSTARTS2=$XSTARTC;
fi


## Switch on input
case $1 in
    BL) #        echo "BottomLeft"
       wmctrl -r :ACTIVE: -b remove,maximized_vert,maximized_horz,fullscreen && wmctrl -r :ACTIVE: -e 0,$XSTART,$YSTART2,$HW,$HH
        ;;
    BR) #        echo "Bottomright"
       wmctrl -r :ACTIVE: -b remove,maximized_vert,maximized_horz,fullscreen && wmctrl -r :ACTIVE: -e 0,$XSTART2,$YSTART2,$HW,$HH
        ;;
    TL) #        echo "TopLeft"
       wmctrl -r :ACTIVE: -b remove,maximized_vert,maximized_horz,fullscreen && wmctrl -r :ACTIVE: -e 0,$XSTART,$YSTART,$HW,$HH
        ;;
    TR) #        echo "Topright"
       wmctrl -r :ACTIVE: -b remove,maximized_vert,maximized_horz,fullscreen && wmctrl -r :ACTIVE: -e 0,$XSTART2,$YSTART,$HW,$HH
        ;;
    B) #        echo "Bottom"
       wmctrl -r :ACTIVE: -b remove,maximized_vert,maximized_horz,fullscreen && wmctrl -r :ACTIVE: -e 0,$XSTART,$YSTART2,$FW,$HH
        ;;
    T) #        echo "Top"
       wmctrl -r :ACTIVE: -b remove,maximized_vert,maximized_horz,fullscreen && wmctrl -r :ACTIVE: -e 0,$XSTART,$YSTART,$FW,$HH
        ;;
    L) #        echo "Left"
       wmctrl -r :ACTIVE: -b remove,maximized_vert,maximized_horz,fullscreen && wmctrl -r :ACTIVE: -e 0,$XSTART,$YSTART,$HW,$FH
        ;;
    R) #        echo "right"
       wmctrl -r :ACTIVE: -b remove,maximized_vert,maximized_horz,fullscreen && wmctrl -r :ACTIVE: -e 0,$XSTART2,$YSTART,$HW,$FH
        ;;
    SL) #        echo "Left Screen"
       wmctrl -r :ACTIVE: -b remove,maximized_vert,maximized_horz,fullscreen && wmctrl -r :ACTIVE: -e 0,$XSTARTS1,$YSTARTC,-1,-1
        ;;
    SR) #        echo "right"
       wmctrl -r :ACTIVE: -b remove,maximized_vert,maximized_horz,fullscreen && wmctrl -r :ACTIVE: -e 0,$XSTARTS2,$YSTARTC,-1,-1
        ;;
    C) #        echo "Center"
       wmctrl -r :ACTIVE: -b remove,maximized_vert,maximized_horz,fullscreen && wmctrl -r :ACTIVE: -e 0,$XSTARTC,$YSTARTC,$HW,$HH
        ;;
    M) #        echo "Toggle Maximize"
       wmctrl -r :ACTIVE: -b toggle,maximized_vert,maximized_horz
       ;;
    *) #        echo "Nothing"
        ;;
esac



# OLD STUFF
# pywo put -p $1
# pywo put -p M --xinerama

# z=`nvidia-settings -q all | grep 1920|wc -l`
# if [ $z == 0 ] ; then echo "toupie"; fi

# 115
# 1924
# 
# 8
