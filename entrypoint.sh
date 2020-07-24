#!/bin/bash -v
python2 -m kicad_automation.eeschema.schematic run_erc --junit_xml /github/workspace/$1/$2 output/schematic
retval=$?
if [ $retval -ne 0 ]; then
    echo ::set-output name=time::$time
    echo ::set-output name=success::0
    echo ::set-output name=message::"ERC failed"
    exit 0;
else
    rm output/schematic/run_erc_schematic_screencast.ogv
fi

python2 -m kicad_automation.pcbnew_automation.run_drc /github/workspace/$1/$3 output/pcb --record
retval=$?
if [ $retval -ne 0 ]; then
    echo ::set-output name=time::$time
    echo ::set-output name=success::0
    echo ::set-output name=message::"DRC failed"
    exit 0;
else
    rm output/pcb/run_drc_screencast.ogv
fi

python2 -m kicad_automation.eeschema.schematic export /github/workspace/$1/$2 output/schematic/svg
python2 -m kicad_automation.eeschema.schematic export -f pdf /github/workspace/$1/$2 output/schematic
rm output/schematic/svg/export_schematic_screencast.ogv
rm output/schematic/export_schematic_screencast.ogv

python3 -m kicad_automation.pcbnew_automation.plot /github/workspace/$1/$3 output/pcb/gerbers
python3 -m kicad_automation.pcbnew_automation.plot -f pdf /github/workspace/$1/$3 output/pcb/gerbers

git clone https://github.com/openscopeproject/InteractiveHtmlBom.git ~/InteractiveHtmlBom
cp -r ~/InteractiveHtmlBom/ ~/.config/kicad/scripting/
python2 -m kicad_automation.pcbnew_automation.run_interactivebom /github/workspace/$1/$3 output/pcb --record
cp /kicad-project/hardware/boards/bom/* output/pcb

#tree
echo "parameters: $1 $2 $3"
time=$(date)
echo ::set-output name=time::$time
echo ::set-output name=success::1
echo ::set-output name=message::"ERC and DRC succeeded"
