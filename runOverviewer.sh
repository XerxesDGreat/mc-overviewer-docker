#!/bin/bash
st=$(date)

logfile=/minecraft/overviewer.log
configfile=/minecraft/overviewer.cfg

echo "run starting at ${st}" >> ${logfile}
cd /tmp/overviewer
python overviewer.py --config=/minecraft/overviewer.cfg | tee /minecraft/overviewer.log
#python overviewer.py --config=/minecraft/overviewer.cfg --genpoi | tee /minecraft/overviewer.log
et=$(date)
echo "run ended at ${et}" >> ${logfile}
echo "" >> ${logfile}
echo "==========================" >> ${logfile}
echo "" >> ${logfile}
