#!/bin/bash
7z a -p -mhe ~/gdrive/$1.7z $1/*
drive push ~/gdrive/$1.7z
