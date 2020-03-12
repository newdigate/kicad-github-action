#!/bin/bash -v
mkdir output
cd /home/runner/work/teensy-eurorack/teensy-eurorack/$(echo "$1")
#ls /usr/lib/python2.7/dist-packages/kicad-automation/
#echo PYTHONPATH=$PYTHONPATH
#export PYTHONPATH=/usr/lib/python2.7/dist-packages/:$PYTHONPATH
python2 -m kicad-automation.eeschema.schematic export $(echo "$2") output
cp -r output /home/runner/work/teensy-eurorack/teensy-eurorack/output
cd /home/runner/work/teensy-eurorack/teensy-eurorack/
ls -lrt
ls -lrt output/
#echo "Hello $1 $2"
time=$(date)
echo ::set-output name=time::$time
