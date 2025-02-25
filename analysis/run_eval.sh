#!/bin/bash

# Uncomment and edit the following lines to create symbolic links so you can choose
# where to keep your data
# ln -s <dataset-folder-full-path> spear_data  
# ln -s <outputs-folder-full-path> DIR_OUTPUT  
VERSION=$1

DIR_OUTPUT=/home/data/kbh/SPEAR/outputs/${VERSION}
DIR_SPEAR=/home/data/kbh/SPEAR/
DIR_SE=/home/data/kbh/SPEAR/${VERSION}

# Define variables
SET='Dev'
PROCESSING='baseline'


for DATASET in 1 4
do

# Output paths
# These can be whatever you want them to be
audio_dir_proc=${DIR_OUTPUT}/audio_${PROCESSING}_$(date '+%Y%m%d')
metrics_dir=${DIR_OUTPUT}/metrics

# Input paths relative to spear_data should not be changed
input_root_proc=${DIR_SPEAR}/Main/$SET
segments_csv="segments_$SET.csv"

# Derived paths
metrics_csv_proc="${metrics_dir}/${PROCESSING}_${SET}_D${DATASET}_S${SESSION}_M${MINUTE}.csv"
echo ${metrics_csv_proc}

# Compute metrics
python spear_evaluate.py $input_root_proc $audio_dir_proc $segments_csv $metrics_csv_proc --list_cases D$DATASET
done
