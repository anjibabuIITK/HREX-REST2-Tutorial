#!/bin/bash
for i in 0 2 ; do
read -p " Enter .edr file : " edrfile
read -p " Enter output filename (.xvg):  " output
#find *.edr > edrfiles
filename="edrfiles"
#for i in `seq 0 4` ; do
#while read file ; do
#gmx energy -f hremd_$i.edr -o hremd_PE_$i.xvg
gmx energy -f $edrfile -o $output
#cp hremd_PE_$i.xvg ANALYSIS/
cp $output ANALYSIS/
cd ANALYSIS
# cleaning xvg file
#sed -i "/^#/d" hremd_PE_$i.xvg
#sed -i "/^@/d" hremd_PE_$i.xvg
sed -i "/^#/d" $output
sed -i "/^@/d" $output
echo ""
echo " Cleaned"
cd ../
#
#done < $filename
echo -e "\e[31;44m File has stored as remd_PE_$i.xvg \e[0m"
echo " ==============================="
echo ""
clear
done

echo " ANJI BABU KAPAKAYALA "
#

