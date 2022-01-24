#!/bin/bash/
# This script downloads the files from the URLs saved in the file passed as an argument.

# Pass argument with flag -f (file having URLs)
while getopts f: option
do
    case "${option}" in
        f) FILE=${OPTARG}
            ;;
        *) echo "Wrong params passed!"
            ;;
    esac
done

# Pass the piped output to parallel command.
# parallel -j <Parallel_Process> <next_command>
# curl -O to download files with the piped URL.
# -n to read credentials and hostname from .netrc file.
# -C - to continue broken or interuppted downloaded files.
# {} piped URL after cat File.
cat $FILE | parallel -j 4 curl -n -N -O -C - {} 

# Alternative to curl by using wget.
# -c to continue broken or interuppted downloaded files.
#cat $FILE | parallel -j 4 wget -c {} 