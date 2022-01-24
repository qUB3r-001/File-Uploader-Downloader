#!/bin/bash/
# This script upload files from the file list passed as an argument.
# Upload multiple files to a existing directory on the FTP server.

# Pass 2 arguments with flag -f(filename) and -u(URL of server)
while getopts f:u: option
do
    case "${option}" in
        f) FILE=${OPTARG}
            ;;
        u) URL=${OPTARG}
            ;;
        *) echo "Wrong params passed!"
            ;;
    esac
done

# Pass piped output from file to parallel command
# parallel -j <parallel_process> <next_command>
# curl -T to download files with the piped URL.
# -C - to continue broken or interuppted uploaded files.
# -n to read credentials and hostname from .netrc file.
# {} filename needed to be uploaded
# URL where the files are needed to be uploaded
cat $FILE | parallel -j 4 "curl -n -C - -T {} $URL" 

# ** NOTE **
# Create a list of files which is needed to be uploaded from a directory