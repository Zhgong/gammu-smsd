#!/bin/bash
echo Starting ...
REL_DIR=$(dirname $(dirname $0))
echo $REL_DIR
DIR=$(realpath $REL_DIR)
docker run -d --env-file .env \
--device=/dev/ttyUSB0 \
--mount type=bind,source=$DIR/gammu-data,target=/var/spool/gammu \
--mount type=bind,source=$DIR/gammu-smsd.log,target=/var/log/gammu-smsd.log \
--mount type=bind,source=$DIR/receive-sms.log,target=/var/log/receive-sms.log \
--restart=always \
--name gammu-smsd gammu-smsd:latest
