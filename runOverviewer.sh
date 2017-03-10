#!/bin/bash
t=$(time)
echo "run starting at ${t}"
overviewer.py --config=/minecraft/overviewer.cfg
overviewer.py --config=/minecraft/overviewer.cfg --genpoi
