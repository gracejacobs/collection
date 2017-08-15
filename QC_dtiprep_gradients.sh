
#!/bin/bash

#cd /projects/jp/research/POND/concat/
#find . -maxdepth 1 -mindepth 1 -type d -printf '%f\n' >> /mnt/tigrlab/projects/gjacobs/POND/allsubjects.txt

while read p; do
	echo "working on" $p
	cat /mnt/tigrlab/projects/gjacobs/POND/DTIprep/$p'_QCReport.txt' | grep "DWI File:\|FAIL" >> /mnt/tigrlab/projects/gjacobs/POND/Failed.txt

done </mnt/tigrlab/projects/gjacobs/POND/allsubjects.txt





#grep "DWI File\|Included Gradients" /projects/gjacobs/POND/DTIprep/$p'_QCReport.txt'> > /projects/gjacobs/POND/Gradients.txt
