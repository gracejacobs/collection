

#!/bin/bash
for VARI in /mnt/tigrlab/scratch/edickie/ABIDE/freesurfer/USM/USM*
  do
    path=$VARI
    VARI=${VARI##*/}
    VARI=${VARI%*.tar}
    mdir /projects/gjacobs/USM/$VARI
		tar xvf $path -C /projects/gjacobs/USM/

done
