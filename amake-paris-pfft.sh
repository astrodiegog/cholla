#!/bin/bash

module load rocm
module load pfft
module load hdf5
module load gcc
module list

export HIP_PLATFORM=hcc
export MPI_HOME=$(echo "${PE_CRAY_FIXED_PKGCONFIG_PATH}" | sed 's,.*:\([^:]*\)mvapich\([^:]*\).*,\1mvapich\2,;s,/lib/pkgconfig,,')
export POISSON_SOLVER="-DPFFT -DPARIS"
export SUFFIX='.paris.pfft-amd'
#make clean
make
