#!/bin/bash -v
python2 -m kicad-automation.eeschema.schematic export /github/workspace/$1/$2 output
python2 -m kicad-automation.eeschema.schematic export -f pdf /github/workspace/$1/$2 output
python2 -m kicad-automation.eeschema.schematic run_erc /github/workspace/$1/$2 output

python2 -m kicad-automation.pcbnew_automation.run_drc /github/workspace/$1/$3 output
python2 -m kicad-automation.pcbnew_automation.plot /github/workspace/$1/$3 output/gerbers
python2 -m kicad-automation.pcbnew_automation.plot -f pdf /github/workspace/$1/$3 output/gerbers

tree
echo "Hello $1 $2 $3"
time=$(date)
echo ::set-output name=time::$time
