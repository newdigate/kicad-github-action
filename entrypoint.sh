#!/bin/bash -v
pwd
ls -lrt
#ls /usr/lib/python2.7/dist-packages/kicad-automation/
#echo PYTHONPATH=$PYTHONPATH
#export PYTHONPATH=/usr/lib/python2.7/dist-packages/:$PYTHONPATH
python2 -m kicad-automation.eeschema.schematic export /github/workspace/$1/$2 output
cp -r output /github/workspace/output
ls -lrt
ls -lrt output/
#echo "Hello $1 $2"
time=$(date)
echo ::set-output name=time::$time
