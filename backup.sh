#!/bin/bash
SRC=/var/www/mysite
DEST=$HOME/backup
mkdir -p $DEST
tar -czf $DEST/site-$(date +%F).tar.gz $SRC
find $DEST -name "site-*.tar.gz" -mtime +7 -delete
echo "$(date) backup done" >> $HOME/backup.log

