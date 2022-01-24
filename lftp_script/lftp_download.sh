#!/bin/bash/
# lftp is a sophisticated file transfer program.


lftp ftp://<USERNAME>:<PASSWORD>@<HOSTNAME> <<EOF
set ftp:ssl-allow no
cd <TO_DIRECTORY_NEEDED_TO_BE_DOWNLOADED>
mirror -c -P <NUMBER_OF_PARALLEL_PROCESS>
bye
EOF