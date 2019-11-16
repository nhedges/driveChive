#!/bin/bash
if ! [ -d "/usr/local/go" ] ; then
	echo "Downloading GO..."
	sudo curl https://dl.google.com/go/go1.13.4.linux-amd64.tar.gz --output go1.13.4.linux-amd64.tar.gz
	sudo tar -C /usr/local -xzf go1.13.4.linux-amd64.tar.gz
fi

if ! [ -f "$HOME/go/bin/drive" ] ; then
	echo "Installing Drive Client, please wait..."
	/usr/local/go/bin/go get -u github.com/odeke-em/drive/cmd/drive
fi

if ! [ -d "Google_Drive" ] ; then
    mkdir Google_Drive
    chown -R `stat -c '%U' $HOME` Google_Drive
fi
echo "Initializing Google Drive directory. Ready to Log in."
$HOME/go/bin/drive init ./Google_Drive
echo "Google drive auto upload is ready. use other script(s) to automatically archive things onto Google Drive."
