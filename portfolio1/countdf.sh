# Student name: Joel Belton (10523443)

#!/bin/bash

nonemptyfile=0 emptyfile=0 nonemptydir=0 emptydir=0 # declare variables for use in script

for i in $(ls $1); do # specify list as items in specified directory
    if [[ -f $i && -s $i ]]; then # check the current item in directory is a file and not zero size
        ((nonemptyfile++)) # increment non-empty file count by 1
    elif [[ -f $i && ! -s $i ]]; then # check the current item in directory is a file and zero size
        ((emptyfile++)) # increment empty file count by 1
    elif [[ -d $i && -z $(ls $i) ]]; then # check the current item in directory is a directory with no contents
        ((emptydir++)) # increment empty directory count by 1
    elif [[ -d $i && ! -z $(ls $i) ]]; then # check the current item in directory is a directory with content
        ((nonemptydir++)) # increment non-empty directory count by 1
    fi
done

echo -e "The ${1##*/} directory contains:\n$nonemptyfile files that contain data\n$emptyfile files that are empty\n$nonemptydir non-empty directories\n$emptydir empty directories" # ${1##*/} strips path and just leaves directory name

exit 0