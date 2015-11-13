#!/bin/bash

#PBS -W group_list=bhurwitz
#PBS -q windfall
#PBS -l jobtype=cluster_only
#PBS -l select=1:ncpus=2:mem=4gb
#PBS -l place=pack:shared
#PBS -l walltime=24:00:00
#PBS -l cput=24:00:00
#PBS -M xiangl1@email.arizona.edu
#PBS -m bea

cd $BLAST_OUT_DIR
PARSED="$BLAST_OUT_DIR/$FILE.${PBS_ARRAY_INDEX}.blastout.parsed"
cat $PARSED >> $BLAST_OUT_DIR/$FILE.parsed 
