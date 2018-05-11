#!/bin/bash

if [ $1 = "vortex" ]; then
    DIR="/work/publications/phdthesis/"
    Thunar "$DIR" & 
    sleep 0.1
    MoveWindow.sh L
    gvim -g --servername PhDThesis -S "$DIR""Session.vim"
    sleep 0.1
    MoveWindow.sh M
fi

if [ $1 = "vortexcode" ]; then
    DIR="/work/lib/OmniVor_lib/fortran/"
    thunar "$DIR"&
    gvim -S "$DIR""Session.vim"
fi


if [ $1 = "momentum" ]; then
    DIR="/work/publications/notes/"
    thunar "$DIR"&
    gvim -S "$DIR""SessionMomentum.vim"
fi


if [ $1 = "book" ]; then
    DIR="/work/publications/book/"
    thunar "$DIR"&
    gvim --servername WTbook-Branlard -S "$DIR""Session.vim"
    sleep 0.1
    MoveWindow.sh M
fi

if [ $1 = "matlab" ]; then
    DIR="/work/code/"
    title="matterm"
    xfce4-terminal --title "$title" -e "/opt/matlab/R2013b/bin/matlab -softwareopengl"
    sleep 1
    wmctrl -r "$title" -t 1

fi
if [ $1 = "yaw" ]; then
    DIR="/work/code/Yaw/"
    thunar "$DIR"&
    title="matterm"
    LaunchSession.sh matlab
    gvim /work/publications/articles/2013-nawea-yaw/Branlard-2013-nawea-yaw.tex
    evince /work/publications/articles/2013-nawea-yaw/Branlard-2013-nawea-yaw.pdf&
    sleep 1
    gvim --remote-tab-silent /work/code/Yaw/
fi
