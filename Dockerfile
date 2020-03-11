# Container image that runs your code
FROM productize/kicad-automation-scripts

ENTRYPOINT ["python -m kicad-automation.eeschema.schematic export /kicad-project/<some-schematic>.sch <build_dir> <svg or pdf> <all-pages (True or False)>"]
