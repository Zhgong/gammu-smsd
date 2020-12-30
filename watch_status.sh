#!/bin/bash
watch "lsusb;echo;tail -n 20 /var/log/gammu-smsd.log; echo ;ls /dev/ttyUSB*; echo; ls /var/spool/gammu/*"
