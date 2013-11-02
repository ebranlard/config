#!/bin/bash
#############################################################
# PulseMediaKeys: control pulseaudio volume and display notification
#############################################################
# Description :
# Written by : Emmanuel Branlard
# Created : June 2010 
# Updated : October 2013
# Dependencies : a notify daemon like xfce4-notify. For notificaitons that updates, needs libnotify-bin from a izx/askubuntu ppa
# License : Feel free to modify and adapt it
# Udage : 
#     PulseMediaKeys.sh increase
#     PulseMediaKeys.sh decrease
#     PulseMediaKeys.sh mute
#############################################################
SINK=0 # might be changed
DELTAVOL=3277 #is 5% of the total volume, you can change this to suit your needs
MAXVOL=75875 # this is 115%. Max is 95536
REFVOL=65536 # this is by definition 100%. Used to compute percentage
#### Creation of files/folders if dont exist
test ! -d ~/.pulse        && mkdir ~/.pulse
test ! -f ~/.pulse/mute   && echo "false" > ~/.pulse/mute
test ! -f ~/.pulse/volume && echo "65536" > ~/.pulse/volume
test ! -f ~/.pulse/nid    && echo "0" > ~/.pulse/nid

#### READING FILES 
CURVOL=`cat ~/.pulse/volume`     #Reads in the current volume
MUTE=`cat ~/.pulse/mute`         #Reads mute state
NID_PREVIOUS=`cat ~/.pulse/nid`  #Reads previous nid

if [[ $1 == "mute" ]]
then
    if [[ $MUTE == "false" ]]
    then
        # We mute and exit
        pactl set-sink-mute $SINK 1
        echo "true" > ~/.pulse/mute
        icon="audio-volume-muted"
        notify-send -t 1000 -i $icon "Mute: off"
        exit
     else
        # We unmute
        pactl set-sink-mute $SINK 0
        echo "false" > ~/.pulse/mute    
    fi
else
    if [[ $1 == "increase" ]]
    then
        CURVOL=$(($CURVOL + $DELTAVOL)) 
        if [[ $CURVOL -ge $MAXVOL ]]
        then
            CURVOL=$MAXVOL        
        fi
    elif [[ $1 == "decrease" ]]
    then
        CURVOL=$(($CURVOL - $DELTAVOL))
        if [[ $CURVOL -le 0 ]]
        then
            CURVOL=0        
        fi
    fi
    ## SETTING VOLUME
    pactl set-sink-volume $SINK $CURVOL
    echo $CURVOL > ~/.pulse/volume # Write the new volume to disk to be read the next time the script is run.
fi

## CHOSING ICON
icon="audio-volume-low"
if [[ $CURVOL -ge 50000 ]] 
then
    icon="audio-volume-high"
elif [[ $CURVOL -ge 30000 ]]
then
    icon="audio-volume-medium"
fi
## PERCENTAGE
a=00
p=`expr $CURVOL$a / $REFVOL`
## NOTIFICATION
# Small safety if nid is empty
if [[ $NID_PREVIOUS == "" ]]
then
    NID_PREVIOUS=1
fi
# notify-send -t 500 -i $icon "$p%"
NID=$(notify-send -r $NID_PREVIOUS -p -t 500 -i $icon -h int:value:$p -h string:synchronous:volume "$p%")
echo "$NID" > ~/.pulse/nid    
