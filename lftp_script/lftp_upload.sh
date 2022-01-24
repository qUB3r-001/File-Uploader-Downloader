#!/bin/bash/
# lftp is a sophisticated file transfer program.

# -R flag uploads the files from the current local directory to the remote directory
lftp ftp://<USERNAME>:<PASSWORD>@<HOSTNAME> <<EOF
set ftp:ssl-allow no
cd <TO_DIRECTORY_NEEDED_TO_BE_DOWNLOADED>
mirror -c -R -P <NUMBER_OF_PARALLEL_PROCESS>
bye
EOF