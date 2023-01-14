#!/bin/bash
# check "SMS status received"
# if the "SMS status received" does not appear in the logfile
# for a long time
# restart the container
function sms_status(){
    KEY_WORDS="SMS status received"
    FILE=/home/pi/gammu-smsd/gammu-data/gammu-smsd.log

    # find in the last 200 lines, how many times "SMS status recieved" appeared
    COUNT=$(tail -n 200 $FILE | grep -c "$KEY_WORDS")
    echo $COUNT

    if (( COUNT < 1)) ; then
        echo "$KEY_WORDS" not found in the last 200 lines of $FILE.
        echo restarting docker
        docker restart gammu-smsd
        echo docker restarted
    fi

}

sleep 3

while true; do 
    date
	sms_status
    sleep 60
done