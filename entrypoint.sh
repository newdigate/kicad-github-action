#!/bin/bash -v
cd hardware
cd boards
cd mainboard
ls -lrt
pwd
cd ../..
mkdir output
cd $(echo "$1")
python -m kicad-automation.eeschema.schematic export $(echo "$2") ../../output 
pwd
ls -lrt
echo "Hello $1 $2"
time=$(date)
echo ::set-output name=time::$time
