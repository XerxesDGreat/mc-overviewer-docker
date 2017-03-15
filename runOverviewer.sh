#!/bin/bash
st=$(date)

logfile=/minecraft/overviewer.log
configfile=/minecraft/overviewer.cfg

echo "run starting at ${st}" >> ${logfile} 
overviewer.py --config=${configfile} >> ${logfile}
overviewer.py --config=${configfile} --genpoi >> ${logfile}
et=$(date)
echo "run ended at ${et}" >> ${logfile}
echo "" >> ${logfile}
echo "==========================" >> ${logfile}
echo "" >> ${logfile}
