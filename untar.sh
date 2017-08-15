


#!/bin/bash
for VARI in /mnt/tigrlab/scratch/edickie/ABIDE/freesurfer/UM_2/UM*
  do
    path=$VARI
    VARI=${VARI##*/}
    VARI=${VARI%*.tar}
    mdir /scratch/gjacobs/UM_2/$VARI
		tar xvf $path -C /scratch/gjacobs/UM_2/

done
