# driveChive
Software for automatically archiving things to google drive

These bash scripts are for productivity in archiving files in a secure way.
The install script creates a google drive sync directory using odeke-em/drive (https://github.com/odeke-em/drive), an open source Google Drive client.
It also installs GO, which is required to install Drive.
The Google Drive is initiated by clicking on the link that appears in the terminal and pasting in the authentication key provided after logging in.
The 7zPushDir.sh and 7zPushFiles.sh scripts create an enrcypted 7z archive of the files or directory specified, and immediately uplaods the archive to Google Drive.
This is helpful because these two operations can take a long time for large ammounts of data. Progress indicators are shown as well, which is not the case for the 'file-roller' GUI interface that I was using before.
The scripts can be used to do scheduled backups by adding an application of them to crontab or something similar.
Other advantages exist as well, such as the ability to easily add a command to shut down the system once the files are done uploading, making these scripts great for 'run overnight' type tasks.
