#csv stuff

zenity --info \
		--text="Select the 'AllOutputs Folder that was just created'"
		ALLOUT="$(zenity --file-selection --directory --title='Select all outputs folder')";

		case $? in 
			0) echo "\"$ALLOUT\" selected.";;
			1) exit;;
		       -1) exit;;

		esac
cd $ALLOUT

zenity --info \
		--text="Select any blank file"
		CSV="$(zenity --file-selection --title='')"; 


		case $? in 
			0) echo "\"$CSV\" selected.";;
			1) exit;;
		       -1) exit;;

		esac
#go through all csv files, create a temp file for each one without the first column 

for file in *.csv
do

echo $file


cut -d, -f1 --complement $file >> 'TEMP_'$file
sed -i 1i"FA"_$file,"Trace"_$file,"AD"_$file,"MidEigen"_$file,"MinEigen"_$file 'TEMP_'$file





done

output=`echo TEMP*`

echo $output


paste $output >>$CSV


#copy in first column 
cut -d, -f2-6 --complement $file >>NewTEMP.csv

grep 'OutliersPerSubject' NewTEMP.csv | cut -d'_' -f2-10 >>New2.csv
sed -i 1i"Subjects" New2.csv

sed -i 1i"Subjects" NewTEMP.csv
paste New2.csv $CSV >>Final_Large.csv



rm *TEMP*
rm New2.csv
rm $CSV



