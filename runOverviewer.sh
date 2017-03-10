#!/bin/bash
t=$(time)
echo "run starting at ${t}"
overviewer.py --config=/opt/overviewer/overviewer.cfg
overviewer.py --config=/opt/overviewer/overviewer.cfg --genpoi
