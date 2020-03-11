#!/bin/bash -v
cd hardware/boards/mainboard
ls -lrt
pwd
mkdir output
#cd $(echo "$1")
python -m kicad-automation.eeschema.schematic export $(echo "$2") ../../../output 
cd ../../..
pwd
ls -lrt
echo "Hello $1 $2"
time=$(date)
echo ::set-output name=time::$time
