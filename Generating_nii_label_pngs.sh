
# running a loop to generate png images of the amygdala labels to QC overlayed with the T1 images - curtesy of Tom!

module load /archive/code/packages.module
source activate

while read f; do
echo $f
/projects/twright/Projects/mask_viewer/gen_mask_views.py -t1 /external/PNC/data/t1_nii/$f/* --mask /external/PNC/data/magetbrain/amygdala/PNC_"$f"_AMY_labels.nii --output /projects/gjacobs/SES_grant_analyses/Resting-state/Amygdala_qc_png-images/PNC_"$f"_AMY_labels.png --title PNC_"$f"_AMY_labels.png


done < /projects/gjacobs/SES_grant_analyses/Resting-state/amygdala_subjects.csv
