# File Uploader/Downloader

## 1. Using cURL/wget to download and upload files

To use cURL scripts first create a .netrc file at ~/.netrc home directory with given configuration.
```
machine <hostname>
login <username>
password <password>
```

- `download_file_list.sh` - To download file list from the server and save the URLs to a file.
- `download_files.sh` - To download the files from the server using the file list.
- `upload_files.sh` - To upload files to the server from the file list.

**Note** - The file list used with the `upload_files.sh` script only contains the filesnames whereas the file list generated by `download_file_list.sh` saves files with server URL. 

## 2. Using LFTP to download and upload files

LFTP ( `lftp` ) is a file transfer program that allows sophisticated ftp, http and other connections to other hosts. If site is specified then lftp will connect to that site otherwise a connection has to be established with the `open` command.

**Note** - LFTP has an advantage of uploading/downloading nested directories. Also lftp has inbuilt feature to parallely download and upload files/directory