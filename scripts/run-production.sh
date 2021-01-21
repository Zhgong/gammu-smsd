#!/bin/bash
echo Starting ...
REL_DIR=$(dirname "$(dirname $0)")
echo "$REL_DIR"
DIR=$(realpath "$REL_DIR")
docker run -d --env-file .env \
--device=/dev/ttyUSB0 \
--mount type=bind,source="$DIR"/gammu-data,target=/var/spool/gammu \
--restart=always \
--name gammu-smsd gammu-smsd:latest
