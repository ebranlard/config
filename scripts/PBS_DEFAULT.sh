#!/bin/sh
#----------------------------------------------------------
#--- PBS PARAMS
#----------------------------------------------------------
# Jobname
#PBS -N JOBNAME
# Number of nodes and proc per nodes
#PBS -l nodes=1:ppn=1
# Estimated walltime HH:MM:SS
#PBS -l wallime=00:10:00
# Queue : xpresq, workq, valdeq
#PBS -q xpresq
# Export environment variables
#PBS -V


#----------------------------------------------------------
#--- PARAMS
#----------------------------------------------------------
SCRATCHDIR=/scrach/$USER/$PBS_JOBID
USERDIR= $PBS_O_WORKDIR

#----------------------------------------------------------
#--- INIT - FILE COPY
#----------------------------------------------------------
cd $USERDIR
cp FILES_FOR_RUN $SCRATCHDIR
cd $SCRATCHDIR

#----------------------------------------------------------
#--- RUN
#----------------------------------------------------------
./RUN INPUT


#----------------------------------------------------------
#--- COPY RESULT BACK
#----------------------------------------------------------
cp $SCRATCHDIR/RES $USERDIR

