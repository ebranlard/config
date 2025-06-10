#!/bin/bash
ALL_GOOD=0
#----------------------------------------------------------
#--- SAFETY TESTS
#----------------------------------------------------------
if [[ $OUTPATTERN == '' ]] 
then
    echo "!!! You need to specify OUT_PATTERN"
    exit -1
fi
if [[ $PBS_JOBNAME == 'local' ]] 
then
    echo "!!! JOBNAME CANNOT BE local"
    exit -1
fi
#----------------------------------------------------------
#--- DERIVED PARAMS
#----------------------------------------------------------
USERDIR=$PBS_O_WORKDIR
if [[ `echo $USERDIR | wc -c` == 1 ]]
then
    USERDIR=`pwd`
    NPROCS=1
    NNODES=1
    PBS_JOBNAME='local'
    PBS_NODEFILE=$USERDIR/"nodefile_"$PBS_JOBNAME
    echo $HOSTNAME > $PBS_NODEFILE
    SCRATCHDIR=$USERDIR'/tmp_scratch_dir'
    mkdir -p $SCRATCHDIR
else
    SCRATCHDIR=/scratch/$USER/$PBS_JOBID
    JOBPID=`echo $PBS_JOBID|awk -F. '{print $1}'`
    # create a new machinefile file which only contains unique nodes 
fi
HOSTFILE=$USERDIR/"hostfile_"$PBS_JOBNAME
cat $PBS_NODEFILE | uniq > $HOSTFILE
NPROCS=`wc -l < $PBS_NODEFILE`
NNODES=`cat $HOSTFILE |wc -l `
#----------------------------------------------------------
#--- PREPARING OUTPUT FOLDER (important if STD dumpted to it..)
#----------------------------------------------------------
RES_FOLDER=$USERDIR/results_$PBS_JOBNAME
mkdir -p $RES_FOLDER

#----------------------------------------------------------
#--- INIT - NUM_THREADS
#----------------------------------------------------------
echo "USERDIR     :" $USERDIR
echo "SCRATCHDIR  :" $SCRATCHDIR
echo "O_WORKDIR   :$PBS_O_WORKDIR"
echo "HOST        :`hostname`"
echo "TIME        :`date`"
echo "PWD         :`pwd`"
echo "JOBNAME     :$PBS_JOBNAME"
echo "JOBPID      :$JOBPID"
echo "PPN         :$PBS_NUM_PPN"
echo "NPROCS      :$NPROCS"
echo "NNODES      :$NNODES"
echo "NUM_THREADS :$OMP_NUM_THREADS"
if [ -f $HOSTFILE ] 
then
    echo "NODES:"
    cat $HOSTFILE
fi
echo "ULIMIT:"
ulimit -a

#----------------------------------------------------------
#--- INIT - FILE COPY
#----------------------------------------------------------

echo "-------------------------------------------------------"
echo "Switching to user dir: "$USERDIR
echo "-------------------------------------------------------"
cd $USERDIR
ALL_GOOD=1
