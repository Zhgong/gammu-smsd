#!/bin/bash

DIR=$(dirname $0)
$DIR/venv/bin/python -u $DIR/main.py >> /var/log/recieve-sms.log

