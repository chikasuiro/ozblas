#!/bin/bash
#PBS -q debug-mig
#PBS -l select=1
#PBS -l walltime=00:10:00
#PBS -W group_list=gXXXX
#PBS -j oe

module purge
module load nvidia/26.3

cd ${PBS_O_WORKDIR}

#################
# dsgemm (DGEMM using SGEMM)
#################
# -> summode=1 (NearSum) is not supported for mixed-precision (TYPE1 != TYPE2)
../../testing/testing_cuozblas_dsgemm --nodisp=1 --summode=0 --range=1:1024:pow > _dsgemm_nn_sum0_cuda.dat
