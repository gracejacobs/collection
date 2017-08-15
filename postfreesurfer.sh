#!/bin/bash

# SGE Options
#$ -S /bin/bash
#$ -q main.q
#$ -j y
#$ -o /archive/data-2.0/ANDT/data/freesurfer/logs
#$ -e /archive/data-2.0/ANDT/data/freesurfer/logs
#$ -l mem_free=6G,virtual_free=6G

#source the module system
source /etc/profile
##load the Freesurfer enviroment
module load freesurfer/5.3.0
module load /archive/data-2.0/code/datman.module
## this script was created by dm-proc-freesurfer.py

PREFIX="Trinity"
SUBJECTS_DIR="/scratch/gjacobs/Trinity"

export SUBJECTS_DIR=${SUBJECTS_DIR}

ENGIMA_ExtractCortical.sh ${SUBJECTS_DIR} ${PREFIX}
ENGIMA_ExtractSubcortical.sh ${SUBJECTS_DIR} ${PREFIX}
