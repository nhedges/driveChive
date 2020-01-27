#!/bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
#a useful one-liner which will give you the full directory name of the script no matter where it is being called from.
"$DIR/7zPushFiles.sh" "$@"/*

