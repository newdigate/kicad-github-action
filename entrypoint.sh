#!/bin/bash -v
mkdir output
cd $(echo "$1")
ls /usr/lib/python2.7/dist-packages/kicad-automation/
echo PYTHONPATH=$PYTHONPATH
export PYTHONPATH=/usr/lib/python2.7/dist-packages/:$PYTHONPATH
python2 -m kicad-automation.eeschema.schematic export $(echo "$2") output
cp -r output ../../../output
cd /github/workspace/
ls -lrt
echo "Hello $1 $2"
time=$(date)
echo ::set-output name=time::$time
