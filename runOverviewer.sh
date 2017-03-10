#!/bin/bash
st=$(date)
logfile=/minecraft/overviewer.log
echo "run starting at ${st}" >> ${logfile} 
overviewer.py --config=/opt/overviewer/overviewer.cfg >> ${logfile}
overviewer.py --config=/opt/overviewer/overviewer.cfg --genpoi >> ${logfile}
et=$(date)
echo "run ended at ${et}" >> ${logfile}
echo "" >> ${logfile}
echo "==========================" >> ${logfile}
echo "" >> ${logfile}
