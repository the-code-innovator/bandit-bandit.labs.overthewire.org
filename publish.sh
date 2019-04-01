#!/bin/bash
current=`pwd`
logs=$current/logs
package=$current/package
if [ ! -d $package ]; then
    mkdir $package
else
    rm -rf $package
    mkdir $package
fi
logscount=`expr 0`
for i in `ls $logs`; do
    logscount=`expr $logscount + 1`
done
logsfill=$(echo "l($logscount)/l(10)" | bc -l | cut -d '.' -f 1 | ( read log; logval=`expr $log + 0`; logval=`expr $logval + 1`; echo $logval;))
for ((iter=0;iter<$logscount;iter++)); do
    fillname=`printf %0$logsfill\\d $iter`
    cp $logs/bandit$iter $package/bandit$fillname.txt
done
echo "$logscount files published from $logs to $package"
