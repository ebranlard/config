#!/bin/bash 
# #x=`xrandr --query |grep 2720 |wc -l`; #home
# x=`xrandr --query |grep 3360 |wc -l`;  #riso
# if [[ $x > 0 ]] 
# then
#     terminator --geometry +2000 -m  -l 4terms
# else
#     terminator -m -l 4terms    
# fi
# Screen 0: minimum 2720 x 1024, current 2720 x 1024, maximum 2720 x 1024
# default connected 2720x1024+0+0 0mm x 0mm
#    2720x1024      50.0* 
if [[ $HOSTNAME == 'work' ]]
then
#     -T TERM-PhDThesis --working-directory=/work/publications/phdthesis/ --command='run-cmd git status' --tab \
xfce4-terminal \
    -T TERM-HOME            --working-directory=/home/manu/ --tab\
    -T TERM-SYSTEM          --working-directory=/etc/ --tab\
    -T TERM-SSH             --working-directory=/work/libs/OmniVor/_jobs/ --tab \
    -T TERM-PROJECT         --working-directory=/work/projects/2015/ --tab \
    -T TERM-PROJECT         --working-directory=/work/projects/2015/ --tab \
    -T TERM-OMNIVOR_TESTS   --working-directory=/work/libs/OmniVor/_src/__tests__/ --tab\
    -T TERM-OMNIVOR_SRC     --working-directory=/work/libs/OmniVor/_src --tab\
    -T TERM-OMNIVOR         --working-directory=/work/libs/OmniVor/ --command='mr status' \
    --maximize
fi

if [[ $HOSTNAME == 'olympe' ]]
then
xfce4-terminal \
    -T TERM-HOME    --working-directory=/home/manu/ --tab\
    -T TERM-SYSTEM  --working-directory=/etc/ --tab\
    -T TERM-PROJECT --working-directory=/work/projects/2015/ --tab \
    -T TERM-PROJECT --working-directory=/work/projects/2015/ --tab \
    -T TERM-OMN     --working-directory=/work/libs/OmniVor/_src --tab\
    -T TERM-TESTS   --working-directory=/work/libs/OmniVor/_src/__tests__ --tab\
    -T TERM-SRC     --working-directory=/work/libs/OmniVor/_src  
    --maximize
fi
