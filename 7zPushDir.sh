#!/bin/bash
if ! (($# >= 2)) ; then
	echo "Usage: 7zPushDir.sh [directory to push] [filename of 7z archive]"
	exit 0
fi
SCRIPT_DIR=$(dirname $(realpath -s $0))
7z a -p -mhe $SCRIPT_DIR/Google_Drive/$2 $1/*
$HOME/go/bin/drive push -ignore-checksum=false -no-prompt $SCRIPT_DIR/Google_Drive/$2
