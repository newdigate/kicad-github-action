#!/bin/bash -v
python2 -m kicad-automation.eeschema.schematic export /github/workspace/$1/$2 output
tree
echo "Hello $1 $2 $3"
time=$(date)
echo ::set-output name=time::$time
