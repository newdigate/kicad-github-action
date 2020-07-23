#!/bin/bash -v
python2 -m kicad-automation.eeschema.schematic run_erc --junit_xml /github/workspace/$1/$2 output/schematic
retval=$?
if [ $retval -ne 0 ]; then
    echo ::set-output name=time::$time
    echo ::set-output name=success::0
    echo ::set-output name=message::"ERC failed"
    exit 0;
fi

python2 -m kicad-automation.pcbnew_automation.run_drc /github/workspace/$1/$3 output/pcb --record
retval=$?
if [ $retval -ne 0 ]; then
    echo ::set-output name=time::$time
    echo ::set-output name=success::0
    echo ::set-output name=message::"DRC failed"
    exit 0;
fi

python2 -m kicad-automation.eeschema.schematic export /github/workspace/$1/$2 output/schematic/svg
python2 -m kicad-automation.eeschema.schematic export -f pdf /github/workspace/$1/$2 output/schematic
python3 -m kicad-automation.pcbnew_automation.plot /github/workspace/$1/$3 output/pcb/gerbers
python3 -m kicad-automation.pcbnew_automation.plot -f pdf /github/workspace/$1/$3 output/pcb/gerbers

#tree
echo "parameters: $1 $2 $3"
time=$(date)
echo ::set-output name=time::$time
echo ::set-output name=success::1
echo ::set-output name=message::"ERC and DRC succeeded"
