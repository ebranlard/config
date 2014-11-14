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
xfce4-terminal \
    -T TERM-HOME --working-directory=/home/manu/ --tab\
    -T TERM-SYSTEM --working-directory=/etc/ --tab\
    -T TERM-SSH --working-directory=/work/lib/OmniVor_lib/fortran/ --tab \
    -T TERM-PhDThesis --working-directory=/work/publications/phdthesis/ --command='run-cmd git status' --tab \
    -T TERM-WORK --working-directory=/work/ --tab\
    -T TERM-VC-PRESC --working-directory=/work/vc-prescr/omnvor --tab\
    -T TERM-OMNIVOR_JOBS --working-directory=/work/jobs/  --tab\
    -T TERM-OMNIVOR_TESTS --working-directory=/work/lib/OmniVor_lib/fortran/__tests__/ --command='run-cmd git status' --tab\
    -T TERM-OMNIVOR --working-directory=/work/lib/OmniVor_lib/fortran --command='run-cmd git status'\
    --maximize
