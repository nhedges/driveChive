#!/bin/bash
if ! (($# >= 2)) ; then
	echo "Usage: 7zPushDir.sh [filename of 7z archive] [files to push]"
	exit 0
fi
echo "Began "$(date)
SCRIPT_DIR=$(dirname $(realpath -s $0))
7z a -p -mhe $SCRIPT_DIR/Google_Drive/$1 "${@:2}"
echo "7z compression completed "$(date)
$HOME/go/bin/drive push -ignore-checksum=false -no-prompt $SCRIPT_DIR/Google_Drive/$1
echo "Upload completed "$(date)
md5sum $SCRIPT_DIR/Google_Drive/$1
echo "Checksum completed "$(date)
