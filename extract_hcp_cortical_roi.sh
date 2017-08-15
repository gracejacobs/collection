## extracting rs activity from cortical rois


module load /projects/saba/Useful_Scripts/modules/ciftify_module
module load /projects/saba/Useful_Scripts/modules/qcmon_module

ciftify_meants --surfaceonly \
 --outputlabels /my/outpu/path/dawn_labels_test.csv \
 --outputcsv /my/output/path/stuff.csv \
 /external/PNC/data/hcp/PNC_603275217000_SESS01/MNINonLinear/Results/REST_01/REST_01_Atlas_s12.0.dtseries.nii \
/external/PNC/data/hcp/PNC_603275217000_SESS01/MNINonLinear/fsaverage_LR32k/PNC_603275217000_SESS01.aparc.32k_fs_LR.dlabel.nii


while read f; do
echo $f


ciftify_meants --surfaceonly \
 --outputlabels /mnt/tigrlab/projects/gjacobs/rs_PNC/subject_roi_timeseries/$f'labels.csv' \
 --outputcsv /mnt/tigrlab/projects/gjacobs/rs_PNC/subject_roi_timeseries/$f'.csv' \
 /external/PNC/data/hcp/$f/MNINonLinear/Results/REST_01/REST_01_Atlas_s12.0.dtseries.nii \
/external/PNC/data/hcp/$f/MNINonLinear/fsaverage_LR32k/$f'.aparc.32k_fs_LR.dlabel.nii'

done </projects/gjacobs/rs_PNC/hcp_subjects.txt



## change the "func" file to the thickness to get thickness
ciftify_meants --surfaceonly --outputlabels dawn_labels_thinkness.csv --outputcsv dawn_thinkness_mean.csv /external/PNC/data/hcp/PNC_603275217000_SESS01/MNINonLinear/fsaverage_LR32k/PNC_603275217000_SESS01.thickness.32k_fs_LR.dscalar.nii /external/PNC/data/hcp/PNC_603275217000_SESS01/MNINonLinear/fsaverage_LR32k/PNC_603275217000_SESS01.aparc.32k_fs_LR.dlabel.nii


ciftify_meants --surfaceonly \
 --outputlabels /mnt/tigrlab/projects/gjacobs/rs_PNC/subject_roi_timeseries/labels.csv \
 --outputcsv /mnt/tigrlab/projects/gjacobs/rs_PNC/subject_roi_timeseries/roi.csv \
 /external/PNC/data/hcp/PNC_605090380179_SESS01/MNINonLinear/Results/REST_01/REST_01_Atlas_s12.0.dtseries.nii \
/external/PNC/data/hcp/PNC_605090380179_SESS01/MNINonLinear/fsaverage_LR32k/PNC_605090380179_SESS01.aparc.32k_fs_LR.dlabel.nii
