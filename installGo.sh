#!/bin/bash
curl https://dl.google.com/go/go1.13.4.linux-amd64.tar.gz --output go1.13.4.linux-amd64.tar.gz
tar -C /usr/local -xzf go1.13.4.linux-amd64.tar.gz
#echo "export PATH=$PATH:/usr/local/go/bin" >> ~/.profile
