#!/bin/bash -v
pwd
tree
python2 -m kicad-automation.eeschema.schematic export /github/workspace/$1/$2 output
#cp -r output /github/workspace/output
#ls -lrt
#ls -lrt output/
#echo "Hello $1 $2"
time=$(date)
echo ::set-output name=time::$time
