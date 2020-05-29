#!/bin/bash
if [ $# -lt 2 ] ; then
  echo "Usage: 7zPushDir [archive name.7z] [DirectoryName/]"
  exit
fi
DIR=$(realpath $0 | grep -o -i "^.*\/")
#a useful one-liner which will give you the full directory name of the script no matter where it is being called from.
"$DIR/7zPushFiles.sh" "$@"*

