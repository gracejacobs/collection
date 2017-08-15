%% counting voxels to get volumes from label files

addpath('/home/gjacobs/PNC_matlab/Nifti toolbox') %load path that has the nifti toolbox
myDir= '/projects/gjacobs/PNC/magetbrain_results_v01/all_outputs/' %folder with all of your nifti label files that you want to find volumes from

all_voxels1 = zeros(1000, 6); % number of subjects, number of structures
myFiles = dir(fullfile(myDir,'*pallidus-striatum.nii')); %gets all nii files in the about designated folder that you want to count voxels in

for k = 1:length(myFiles)
    myFiles(k).name % name of the file its working on for reference
    f = strcat(myDir,myFiles(k).name); %gets the name of the file 
    nii = load_nii(f);    %loads the nii file
    striatum = nii.img; 
    all_voxels1(k,1) = sum(striatum(:)==1); %first column, counts all voxels labelled 1 
    all_voxels1(k,2) = sum(striatum(:)==2); % second column, counts all voxels labelled 2
    all_voxels1(k,3) = sum(striatum(:)==3); % if your labels correspond to something other than a number, change the second number
    all_voxels1(k,4) = sum(striatum(:)==4); % 
    all_voxels1(k,5) = sum(striatum(:)==5); % 
    all_voxels1(k,6) = sum(striatum(:)==6); % 
    clear nii;
end

cd /projects/gjacobs/rs_PNC/ % change directory to where you want to save the file
csvwrite('edges_correlations.csv', edges); %generates a csv with all the volumes