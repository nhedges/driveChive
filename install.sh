#!/bin/bash
OS=linux
ARCH=amd64
VERSION=1.13.4
SCRIPTDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
echo "Welcome to the driveChive installer. This script was made to set up convenient and fast archiving on linux. It has a few steps."
echo ----------
echo "1) If GO has not been installed in /usr/local, it will be downloaded from google and extracted/installed within this repository directory."
echo ----------
echo "2) If 'drive' is not found in this folder/gocode/bin/, then the Google Drive client will be installed. (github.com/odeke-em/drive/cmd/drive)"
echo ----------
echo "3) If 7ZIP is not installed, it will be installed via apt-get."
echo ----------
echo "4) Google drive will be initialized and you will need to sign in."
echo ----------
echo "5) After this the other commands will be ready to automate archiving, and symlinks to them are placed in ~/bin/ for easy access."
echo ----------
read -p "Are you ready to continue? [Y/n]:" -n 1 -r
if [[ ! $REPLY =~ ^[Yy]$ ]]
then
  echo 
  exit 1
fi

if ! [ -d "$SCRIPTDIR/go" ] | [ $(which go) ] ; then
	echo "Downloading GO..."
	sudo curl https://dl.google.com/go/go$VERSION.$OS-$ARCH.tar.gz --output go$VERSION.$OS-$ARCH.tar.gz
	sudo tar -C "$SCRIPTDIR" -xzf go$VERSION.$OS-$ARCH.tar.gz
  export GOROOT=$SCRIPTDIR/go
fi

if ! [ -d "$SCRIPTDIR/gocode" ] ; then
  mkdir "$SCRIPTDIR/gocode"
fi

export GOPATH=$SCRIPTDIR/gocode

if ! [ -f "$GOPATH/bin/drive" ] ; then
	echo "Installing Drive Client, which may take a long time; please wait..."
	$GOROOT/bin/go get -u github.com/odeke-em/drive/cmd/drive
fi

if ! [ $(which 7z) ] ; then # if 7zip is not installed, install it.
  echo "Installing 7zip using apt-get..."
  sudo apt-get install p7zip
fi

if ! [ -d "Google_Drive" ] ; then
    mkdir Google_Drive
    chown -R `stat -c '%U' $HOME` Google_Drive
fi
if ! [ -d "$HOME/bin" ] ; then
  mkdir "$HOME/bin"
fi
ln -s $SCRIPTDIR/7zPushFiles.sh $HOME/bin/7zPushFiles-test
ln -s $SCRIPTDIR/7zPushDir.sh $HOME/bin/7zPushDir-test

echo "Initializing Google Drive directory. Ready to Log in."
$GOPATH/bin/drive init $SCRIPTDIR/Google_Drive
echo "Google drive auto upload is ready. use other script(s) to automatically archive things onto Google Drive."
