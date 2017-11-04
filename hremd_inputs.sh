# five replicas
nrep=5
# "effective" temperature range
tmin=300
tmax=1000

# build geometric progression
list=$(
awk -v n=$nrep \
    -v tmin=$tmin \
    -v tmax=$tmax \
  'BEGIN{for(i=0;i<n;i++){
    t=tmin*exp(i*log(tmax/tmin)/(n-1));
    printf(t); if(i<n-1)printf(",");
  }
}'
)
echo "$list"
# clean directory
rm -fr \#*
rm -fr topol*

for((i=0;i<nrep;i++))
do

# choose lambda as T[0]/T[i]
# remember that high temperature is equivalent to low lambda
  lambda=$(echo $list | awk 'BEGIN{FS=",";}{print $1/$'$((i+1))';}')
echo "$lambda"
# process topology
# (if you are curious, try "diff topol0.top topol1.top" to see the changes)
# plumed partial_tempering $lambda < ala_wat.top > ala_wat_scaled_$i.top
# clean the scaled topologyies ( anji)
#sed -i '1,12 d' ala_wat_scaled_$i.top
# prepare tpr file
# -maxwarn is often needed because box could be charged
#gmx_mpi  grompp  -f nvt.mdp -c ala_$i.gro  -p ala_wat_scaled_$i.top  -maxwarn 1 -o hremd_$i.tpr
done
#mpirun -np $nrep gmx_mpi mdrun_d -v -plumed plumed.dat -multi $nrep -replex 100 -nsteps 15000000 -hrex
#rm \#*
