#!/bin/bash


DWIConvert --inputDicomDirectory  --conversionMode DicomToNrrd --outputVolume  .nrrd


find . -maxdepth 1 -mindepth 1 -type d -printf '%f\n' >> /mnt/tigrlab/projects/gjacobs/POND/Dicoms_to_nrrds/325.txt

unu head 004-DTI-AX-EP2D-grappa2-2mm-19dir3b0-1000.nrrd

while read p; do
	echo "working on" $p
	DWIConvert --inputDicomDirectory $p --conversionMode DicomToNrrd --outputVolume $p.nrrd


done </projects/gjacobs/POND/Dicoms_to_nrrds/476.txt


gtractConcatDwi --inputVolume 003-DTI-AX-EP2D-grappa2-2mm-19dir3b0-1000.nrrd  --inputVolume 005-DTI-AX-EP2D-grappa2-2mm-20dir3b0-1000.nrrd --inputVolume 007-DTI-AX-EP2D-grappa2-2mm-21dir3b0-1000.nrrd --outputVolume MR160-088-0470-01.nrrd


gtractConcatDwi --inputVolume 005-DTI-AX-EP2D-grappa2-2mm-20dir3b0-1000.nrrd --inputVolume 003-DTI-AX-EP2D-grappa2-2mm-19dir3b0-1000.nrrd --inputVolume 007-DTI-AX-EP2D-grappa2-2mm-21dir3b0-1000.nrrd --outputVolume MR160-088-0473-01.nrrd

gtractConcatDwi  --inputVolume 006-DTI-AX-EP2D-grappa2-2mm-19dir3b0-1000.nrrd --inputVolume 008-DTI-AX-EP2D-grappa2-2mm-20dir3b0-1000.nrrd --inputVolume 010-DTI-AX-EP2D-grappa2-2mm-21dir3b0-1000.nrrd --outputVolume MR160-088-0476-01.nrrd

gtractConcatDwi  --inputVolume 003-DTI_AX_EP2D_grappa2_2mm_19dir3b0_1000.nrrd --inputVolume 009-DTI_AX_EP2D_grappa2_2mm_20dir3b0_1000.nrrd --inputVolume 015-DTI_AX_EP2D_grappa2_2mm_21dir3b0_1000.nrrd --outputVolume MR160-105-0027-01.nrrd

gtractConcatDwi  --inputVolume 003-DTI_AX_EP2D_grappa2_2mm_19dir3b0_1000.nrrd --inputVolume 006-DTI_AX_EP2D_grappa2_2mm_20dir3b0_1000.nrrd --inputVolume 009-DTI_AX_EP2D_grappa2_2mm_21dir3b0_1000.nrrd --outputVolume MR160-105-0040-01.nrrd


gtractConcatDwi  --inputVolume 025-DTI-AX-EP2D-grappa2-2mm-19dir3b0-1000.nrrd --inputVolume 027-DTI-AX-EP2D-grappa2-2mm-21dir3b0-1000.nrrd --outputVolume MR160-105-0228-02.nrrd




gtractConcatDwi  --inputVolume 020-DTI-AX-EP2D-grappa2-2mm-19dir3b0-1000.nrrd --inputVolume 022-DTI-AX-EP2D-grappa2-2mm-20dir3b0-1000.nrrd --inputVolume 024-DTI-AX-EP2D-grappa2-2mm-21dir3b0-1000.nrrd --outputVolume MR160-105-0325-01.nrrd










