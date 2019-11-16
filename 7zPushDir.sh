#!/bin/bash
export PATH=$PATH:/usr/local/go/bin
7z a -p -mhe ~/gdrive/$1.7z $1/*
drive push -ignore-checksum=false -no-prompt ~/gdrive/$1.7z
