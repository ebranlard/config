#!/bin/bash
ActiveWinID=$(xdotool getactivewindow)

echo $ActiveWinID > /home/manu/Config/tmp/ActiveWinID

