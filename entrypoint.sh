#!/bin/bash -v
mkdir output
python -m kicad-automation.eeschema.schematic export /$(echo "$1")/$(echo "$2") output --file_format svg --all-pages True
python -m kicad-automation.eeschema.schematic export /$(echo "$1")/$(echo "$2") output --file_format pdf --all-pages True
pwd
ls -lrt
echo "Hello $1 $2"
time=$(date)
echo ::set-output name=time::$time
