#!/bin/bash
if [[ $ALL_GOOD == 0 ]]
then
    echo "!!! Something went wrong before job end. Exiting."
    exit -1
fi
if [[ $RES_FOLDER == '' ]] 
then
    echo "!!! You need to specify SCRATCHDIR"
    exit -1
fi
if [[ $OUTPATTERN == '' ]] 
then
    echo "!!! You need to specify OUT_PATTERN"
    exit -1
fi
echo "-------------------------------------------------------"
echo "Copying result back to home.."
echo "-------------------------------------------------------"
RESDIR=$RES_FOLDER
OUTDIR=`ls -l |grep $OUTPATTERN |awk '{print $9}'`
nDIR=`ls -l |grep $OUTPATTERN |wc -l`
echo "nDIR        :$nDIR"
if [[ $nDIR == 0 ]] 
then
    echo "!!! No out dir found, aborting"
    echo "-------------------------------------------------------"
    echo "Directory listing:"
    echo "-------------------------------------------------------"
    ls -l
    exit -1
else
    if [[ $nDIR > 1 ]] 
    then
        echo "!!! More than one output dir, taking the first one!"
        OUTDIR=`ls -l |grep $OUTPATTERN |awk 'NR<2 {print $9}'`
    fi 
    echo "OUTDIR      :$OUTDIR"
    echo "RESDIR      :$RESDIR"
fi
rm -f $HOSTFILE
echo "-------------------------------------------------------"
echo "Done!"
