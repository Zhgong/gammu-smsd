#!/bin/bash

DIR=$(dirname $0)
$DIR/venv/bin/python -u $DIR/main.py >> /var/log/receive-sms.log 2>&1

