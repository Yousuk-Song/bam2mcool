#!/usr/bin/bash

chrsize_file=/data2/home/sbjs0428/Tool/bam2mcool/hg19.chr.size.txt

bin_size=1000
ncores=8 
max_split=2

pairs_file=$1
out_prefix=$2
# the cload command requires the chrom size file to exist besides the chrom size bin file.
cooler cload pairix -p $ncores -s $max_split ${chrsize_file}:$bin_size $pairs_file ${out_prefix}.cool
wait

cooler zoomify -o ${out_prefix}.mcool -r '1000,5000,10000,25000,50000,100000,200000,500000,1000000,2000000,5000000' ${out_prefix}.cool



