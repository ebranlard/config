#!/bin/bash 

echo "----------------------- BEGIN SCREENCONF ---------------------------"
sleep 3
echo "----------------------- BEGIN SCREENCONF ---------------------------"

#x=`xrandr --query |grep 2720 |wc -l`; #home


x=`xrandr --query |grep 1920 |wc -l`;  #riso

echo "x:"$x

if [[ $x > 0 ]] 
then 
    #/home/manu/Config/profiles/screenlayout/RisoScreenPersoLaptop.sh
    xrandr --output LVDS-1 --mode 1440x900 --pos 1920x0 --rotate normal --output VGA-1 --mode 1920x1080 --pos 0x0 --rotate normal
fi
