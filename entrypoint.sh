#!/bin/sh -l
python -m kicad-automation.eeschema.schematic export $1/$2.sch . svg all-pages True
python -m kicad-automation.eeschema.schematic export $1/$2.sch . pdf all-pages True
pwd
ls -lrt
echo "Hello $1 $2"
time=$(date)
echo ::set-output name=time::$time