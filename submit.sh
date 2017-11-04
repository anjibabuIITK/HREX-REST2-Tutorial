#!/bin/bash
#for i in `seq 0 4`;do
#gmx_mpi  grompp  -f nvt.mdp -c ala_$i.gro  -p ala_wat_scaled_$i.top  -maxwarn 1 -o hremd_$i.tpr
#done
mpirun -np 5 gmx_mpi mdrun -v -deffnm hremd_ -plumed plumed.dat -multi 5 -replex 10000 -hrex

