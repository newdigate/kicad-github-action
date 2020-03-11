#!/bin/bash -v
mkdir output
#cd $(echo "$1")
ls /usr/lib/python2.7/dist-packages/kicad-automation/
python2 -m kicad-automation.eeschema.schematic export /github/workspace/$(echo "$1")/$(echo "$2") output 
ls -lrt
echo "Hello $1 $2"
time=$(date)
echo ::set-output name=time::$time
