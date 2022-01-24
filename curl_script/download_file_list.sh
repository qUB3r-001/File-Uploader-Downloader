#!/bin/bash/
# This script creates a list of file URLs from the FTP server which is required to be downloaded.

# Pass 2 arguments with flag -f(filename) & -u(url of FTP server)
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

# Clear file before writing to it.
> $FILE;
# curl fetches the file list in a particular directory.
# -n is to read from .netrc files where the credentials ans hostname are saved.
# -l is list-only (only file name and not the absolute path) and -s silent mode.
# The list output is piped to awk and URL of server is appended to the filenames and stored the the FILE.
curl -n -l -s $URL | awk -v URL=$URL '{ print URL$1 }' >> $FILE