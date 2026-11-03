#!/bin/bash
LOG=$HOME/monitor.log
DISK=$(df / | awk 'NR==2 {print $5}' | tr -d '%')
MEM=$(free | awk '/Mem/ {printf "%d", $3/$2*100}')
echo "$(date) disk=$DISK% mem=$MEM%" >> $LOG
[ $DISK -gt 80 ] && echo "$(date) ALERT disk high" >> $LOG
[ $MEM -gt 80 ] && echo "$(date) ALERT memory high" >> $LOG
pgrep nginx > /dev/null || echo "$(date) ALERT nginx down" >> $LOG
