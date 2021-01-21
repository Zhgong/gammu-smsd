#!/bin/bash

# if the file size is too large
# back up the file and
# clear the content of file

function check_logfile(){
    LOGFILE=/var/spool/gammu/gammu-smsd.log


    # MAXSIZE is 10 MB
    MAXSIZE=10000000

    # Get file size
    FILESIZE=$(stat -c%s "$LOGFILE")
    # Checkpoint
    echo "Size of $LOGFILE = $FILESIZE bytes."

    
    if (( FILESIZE > MAXSIZE)) ; then
        echo "Size of $LOGFILE is over $MAXSIZE bytes. Backup and clean"
        cp $LOGFILE $LOGFILE.bak
        echo "" > $LOGFILE
    fi
}


while true; do 
    date
	check_logfile
    sleep 600
done