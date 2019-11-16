#!/bin/bash
chmod +x installGo.sh
if ! [ -d "/usr/local/go" ] ; then
	sudo ./installGo.sh
fi

if ! [ -f "$HOME/go/bin/drive" ] ; then
	/usr/local/go/bin/go get -u github.com/odeke-em/drive/cmd/drive
fi

if ! [ -d "Google_Drive" ] ; then
    mkdir Google_Drive
    chown -R `stat -c '%U' $HOME` Google_Drive
fi
$HOME/go/bin/drive init ./Google_Drive
