#!/bin/bash
OS=linux
ARCH=amd64
VERSION=1.13.4
SCRIPTDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
echo "Welcome to the driveChive installer. This script was made to set up convenient and fast archiving on linux. It has a few steps."
echo ----------
echo "1) If GO has not been installed in /usr/local, it will be downloaded from google and extracted/installed in /usr/local."
echo ----------
echo "2) If 'drive' is not found in the ~/go/bin/ folder, then the Google Drive client will be installed. (github.com/odeke-em/drive/cmd/drive)"
echo ----------
echo "3) If the Google_Drive folder is not found in the current directory, it will be made in the current working directory. This will contain the files uploaded to Google Drive. "
echo ----------
echo "4) Google drive will be initialized and you will need to sign in."
echo ----------
echo "5) After this the other commands will be ready to automate archiving, as long as the scripts are located in the same directory as Google_Drive folder."
echo ----------
read -p "Are you ready to continue? [Y/n]:" -n 1 -r
if [[ ! $REPLY =~ ^[Yy]$ ]]
then
  echo 
  exit 1
fi

if ! [ -d "$SCRIPTDIR/go" ] ; then
	echo "Downloading GO..."
	sudo curl https://dl.google.com/go/go$VERSION.$OS-$ARCH.tar.gz --output go$VERSION.$OS-$ARCH.tar.gz
	sudo tar -C "$SCRIPTDIR" -xzf go$VERSION.$OS-$ARCH.tar.gz
fi
export GOROOT=$SCRIPTDIR/go
export GOPATH=$SCRIPTDIR/gocode

if ! [ -f "$HOME/go/bin/drive" ] ; then
	echo "Installing Drive Client, please wait..."
	$GOROOT/bin/go get -u github.com/odeke-em/drive/cmd/drive
fi

if ! [ -d "Google_Drive" ] ; then
    mkdir Google_Drive
    chown -R `stat -c '%U' $HOME` Google_Drive
fi
if ! [ -d "$HOME/bin" ] ; then
  mkdir "$HOME/bin"
fi
ln -s $SCRIPTDIR/7zPushFiles.sh $HOME/bin/7zPushFiles
ln -s $SCRIPTDIR/7zPushDir.sh $HOME/bin/7zPushDir

echo "Initializing Google Drive directory. Ready to Log in."
$GOPATH/bin/drive init $SCRIPTDIR/Google_Drive
echo "Google drive auto upload is ready. use other script(s) to automatically archive things onto Google Drive."
