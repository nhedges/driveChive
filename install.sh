#!/bin/bash
chmod +x installGo.sh
./installGo.sh
export PATH=$PATH:/usr/local/go/bin
go get -u github.com/odeke-em/drive/cmd/drive
mkdir Google_Drive
go/bin/drive init ./Google_Drive
