#!/bin/bash

set -a
. .env
set +a

VENV=$(dirname $0)
$VENV/venv/bin/python main.py

# URL="https://api.telegram.org/bot$TOKEN/sendMessage"
# for i in `seq $SMS_MESSAGES` ; do
#   eval "curl -s -X POST $URL -d chat_id=$CHAT_ID -d text=\"\${SMS_${i}_TEXT}\"" >> /var/log/recieve-sms.log 2>&1
# done

# eval "curl -s -X POST $URL -d chat_id=$CHAT_ID -d text=\"new message\""

