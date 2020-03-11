#!/bin/sh
echo on
python -m kicad-automation.eeschema.schematic export "/$1/$2" output svg all-pages True
python -m kicad-automation.eeschema.schematic export "/$1/$2" output pdf all-pages True
pwd
ls -lrt
echo "Hello $1 $2"
time=$(date)
echo ::set-output name=time::$time
