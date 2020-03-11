#!/bin/bash -v
mkdir output
python -m kicad-automation.eeschema.schematic export $(echo "$1")/$(echo "$2") output 
pwd
ls -lrt
echo "Hello $1 $2"
time=$(date)
echo ::set-output name=time::$time
