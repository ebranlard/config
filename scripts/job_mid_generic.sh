#!/bin/bash
#----------------------------------------------------------
#--- SAFETY TESTS
#----------------------------------------------------------
if [[ $ALL_GOOD == 0 ]]
then
    echo "!!! Something went wrong before job mid. Exiting."
    exit -1
fi
ALL_GOOD=0
if [[ $SCRATCHDIR == '' ]] 
then
    echo "!!! You need to specify SCRATCHDIR"
    exit -1
fi
echo "-------------------------------------------------------"
echo "Switching to scratch dir"
echo "-------------------------------------------------------"
cd $SCRATCHDIR
echo "-------------------------------------------------------"
echo "Directory listing:"
echo "-------------------------------------------------------"
ls
echo "-------------------------------------------------------"
ALL_GOOD=1
