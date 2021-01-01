# SMS; Huawei E173; gammu

参考连接: [Raspberry Pi 树莓派收短信，转发至Telegram](http://wenbinwu.com/%E7%82%B9%E7%82%B9%E6%BB%B4%E6%BB%B4/2018/04/25/raspberry-pi-sms.html)

不需要~~usbmodeswtich~~
## 1. 通过命令行lsusb查看

```bash
pi@ubuntu:~/gammu-sms $ lsusb
Bus 001 Device 003: ID 12d1:1436 Huawei Technologies Co., Ltd. Broadband stick # 华为网卡
Bus 001 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub

```
## 2. ls /dev/ttyUSB*
```bash
pi@ubuntu: ls /dev/ttyUSB*
/dev/ttyUSB0  /dev/ttyUSB1 /dev/ttyUSB2 # 有的时候 1 2 3
```
## 3. sudo apt-get install gammu

## 4. gammu-config
设备号填```/dev/ttyUSB1``` 

port: ```at19200```

还可以通过```gammu identify```再次确认设备号。

## 5. sudo apt-get install gammu-smsd

## 6. sudo vim /etc/gammu-smsdrc
```
# 如果需要存储短信，详见官方文档
# RunOnReceive定义收到短信后执行的脚本
# Configuration file for Gammu SMS Daemon

# Gammu library configuration, see gammurc(5)
[gammu]
# Please configure this!
port = /dev/ttyUSB0
connection = at19200
# Debugging
#logformat = textall

# SMSD configuration, see gammu-smsdrc(5)
[smsd]
RunOnReceive = /root/receive-sms.sh
service = files
logfile = /var/log/gammu-smsd.log
# Increase for debugging information
debuglevel = 255

# Paths where messages are stored
inboxpath = /var/spool/gammu/inbox/
outboxpath = /var/spool/gammu/outbox/
sentsmspath = /var/spool/gammu/sent/
errorsmspath = /var/spool/gammu/error/

# Format, 否则inbox/下面的中文短信为乱码
InboxFormat = unicode
```

```/home/pi/gammu-sms/receive-sms.sh```内容：

```
#!/bin/bash

DIR=$(dirname $0)
$DIR/venv/bin/python -u $DIR/main.py >> /var/log/recieve-sms.log
```

## usefull command
**gammu detect** 

**gammu identify**  


## LED blink of Huawei E173
- Green (blinking twice every 3s): The USB Stick is powered on
- Green ( blinking once every 3s): The USB Stick is registering with a 2G - network.
- Blue (blinking once every 3s): The USB Stick is registering with a 3G/3G+ - network.
- Green (solid): The USB Stick is connected to a 2G network
- Blue (solid): The USB Stick is connected to a 3G network
- Cyan (solid): The USB Stick is connected to a 3G+ network
- Off: The USB Stick is removed