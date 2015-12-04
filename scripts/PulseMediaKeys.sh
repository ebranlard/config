#!/bin/bash
#############################################################
# PulseMediaKeys: control pulseaudio volume and display notification
#############################################################
# Description :
# Written by : Emmanuel Branlard
# Created : June 2010 
# Updated : (see git)
# Dependencies : 
# License : Feel free to modify and adapt it
# Udage : 
#     PulseMediaKeys.sh increase
#     PulseMediaKeys.sh decrease
#     PulseMediaKeys.sh mute
#############################################################
### Main Files
DIR=~/.config/pulse
CFG=~/.config/pulse/PulseMediaKeys.conf
STT=~/.config/pulse/PulseMediaKeys.stat
LCK=/tmp/PulseMediaKeys.lock
#### Function to store status to file
function store_status {
    echo "CURVOL=$1"  > $STT
    echo "MUTE=$2"   >> $STT
}
function create_default_config {
    echo "# CONFIG FILE for PulseMediaKeys.sh"                                              >  $CFG
    echo "# You have to experiment with the different values below."                        >> $CFG
    echo "# To experiment on you system, try the command:"                                  >> $CFG
    echo "# pactl set-sink-volume SINK VOL"                                                 >> $CFG
    echo "# Examples of values taken by SINK and VOL are given below."                      >> $CFG
    echo "# Look at what happens in pavucontrol."                                           >> $CFG
    echo "# "                                                                               >> $CFG
    echo "# SINK: this number might depend on the number of audio cards."                   >> $CFG
    echo "#     If the script doesnt work, try higher integers"                             >> $CFG
    echo "SINK=0"                                                                           >> $CFG
    echo "# DELTAVOL: volume increment"                                                     >> $CFG
    echo "DELTAVOL=3277"                                                                    >> $CFG
    echo "# MAXVOL: maximum volume you want to allow."                                      >> $CFG
    echo "MAXVOL=89875"                                                                     >> $CFG
    echo "# MINVOL: minimum volume allowed VERY IMPORTANT !!!"                              >> $CFG
    echo "#       Experiment with this value. A value too low might result in pulseaudio"   >> $CFG
    echo "#       muting your playback stream completely."                                  >> $CFG
    echo "MINVOL=14000"                                                                     >> $CFG
    echo "# REFVOL: if anything goes wrong, the script we'll go back to this volume value." >> $CFG
    echo "REFVOL=65536"                                                                     >> $CFG
}


### Function to notify
# function notify_mute {
#         icon="audio-volume-muted"
#         notify-send -t 1000 -i $icon "Mute: off"
# }
### Creating a lock file to ensure only one instance of this script is run at once
echo "lock"
lockfile -r 0 $LCK || exit 1

#### Creation of files/folders if they dont exist
test ! -d $DIR && mkdir $DIR
if [ ! -f $CFG ]
then
    echo "Creating config file with sink 0"
    create_default_config
fi
if [ ! -f $STT ]
then
    echo "Creating first status file"
    store_status $REFVOL "false"
fi
#### READING FILES 
echo "sourcing"
source $CFG
source $STT

# echo "SINK    $SINK"
# echo "DELTA   $DELTAVOL"
# echo "CURVOL  $CURVOL"
# echo "MAXVOL  $MAXVOL"
# echo "MINVOL  $MINVOL"
# echo "REFVOL  $REFVOL"
# echo "MUTE    $MUTE"

if [[ $# == 1 ]]
then
    if [[ $1 == "mute" ]]
    then
        if [[ $MUTE == "false" ]]
        then
            # We mute and exit
            pactl set-sink-mute $SINK 1
            MUTE="true"
            #notify_mute
         elif [[ $MUTE == "true" ]]
         then
            # We unmute
            pactl set-sink-mute $SINK 0
            MUTE="false"
        else
            # safety if garbage input in file
            MUTE="false"
        fi
    else
        echo "Volume old:" $CURVOL
        # Safety Check: Test that CURVOL is a proper number
        re='^[0-9]+$'
        if ! [[ $CURVOL =~ $re ]] 
        then
           CURVOL=$REFVOL
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
               if [[ $CURVOL -le $MINVOL ]]
               then
                   CURVOL=$MINVOL        
               fi
           else
               echo "Wrong argument"
           fi
        fi
        ## SETTING VOLUME
        echo "Volume new:" $CURVOL
        echo "pactl" $SINK " vol" $CURVOl
        #pactl set-sink-volume $SINK $CURVOL
        pactl set-sink-volume 0 $CURVOL
        pactl set-sink-volume 1 $CURVOL
    #     pactl set-sink-volume 1 $CURVOL
    fi
    ### Storing status to file
        echo "store"
    store_status $CURVOL $MUTE
else
    echo "Wrong number of argument"
fi

# --------------------------------------------------------------------------------
# --- NOTIFICATION 
# --------------------------------------------------------------------------------
# ## CHOSING ICON
# icon="audio-volume-low"
# if [[ $CURVOL -ge 50000 ]] 
# then
#     icon="audio-volume-high"
# elif [[ $CURVOL -ge 30000 ]]
# then
#     icon="audio-volume-medium"
# fi
# ## PERCENTAGE
# a=00
# p=`expr $CURVOL$a / $REFVOL`
# ## NOTIFICATION
# # Small safety if nid is empty
# if [[ $NID_PREVIOUS == "" ]]
# then
#     NID_PREVIOUS=1
# fi
# # notify-send -t 500 -i $icon "$p%"
# NID=$(notify-send -r $NID_PREVIOUS -p -t 500 -i $icon -h int:value:$p -h string:synchronous:volume "$p%")
# echo "$NID" > ~/.pulse/nid    
# sleep 0.1

#### Removing lock
echo "rm"
rm -f $LCK



