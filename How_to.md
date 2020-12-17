# SMS; Huawei E173; gammu

## 1. usb-modeswitch

### install usb-modeswitch usb-modeswitch-data
```sh
pi@ubuntu:~/gammu-sms $ sudo apt-get install usb-modeswitch usb-modeswitch-data
```

before
```bash
pi@ubuntu:~/gammu-sms $ lsusb
Bus 001 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub
```
after
```sh
pi@ubuntu:~/gammu-sms $ lsusb
Bus 001 Device 003: ID 12d1:1436 Huawei Technologies Co., Ltd. Broadband stick
Bus 001 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub
```



### 配置到Modem模式，否则没有/dev/ttyUSB*,此种情况说明3G网卡没有被配置成功
```sh
pi@ubuntu:~/gammu-sms $ sudo vim /etc/usb_modeswitch.d/E173.conf

DefaultVendor=0x12d1
DefaultProduct=0x1446
TargetVendor=0x12d1
TargetProduct= 0x1436 #  有的时候要改成1426
CheckSuccess=20
MessageContent="55534243123456780000000000000011062000000100000000000000000000"
```

## 可能错误

### 有的时候不会出现/dev/ttyUSB0等，lsusb显示：
```sh
pi@ubuntu:~$ lsusb
Bus 001 Device 010: ID 12d1:1446 Huawei Technologies Co., Ltd. E1552/E1800/E173 (HSPA modem)
```

重新运行usb_modeswitch命令，
```sh
pi@ubuntu:~$ sudo usb_modeswitch -I -W -c /etc/usb_modeswitch.d/E173.conf
```

/dev/ttyUSB0出现，lsusb结果显示
```sh
pi@ubuntu:~$ lsusb
Bus 001 Device 011: ID 12d1:1436 Huawei Technologies Co., Ltd. E173 3G Modem (modem-mode)
```

## 2. Gammu-smsd
```sh
pi@ubuntu:~/gammu-sms $ sudo apt-get install gammu-smsd gammu
```
```sh
start-stop-daemon --start --quiet --pidfile --nicelevel 10 /var/run/$NAME.pid \
                --exec $DAEMON -- $DAEMON_OPTS --daemon --user $USER \
        --pid /var/run/$NAME.pid
```


error
```sh
 Wed 2020/12/16 16:00:32 gammu-smsd[3493]: gammu: [Gammu            - 1.40.0]
[ ok ] Stopping gammu-smsd (via systemctl): gammu-smsd.service.                                       Wed 2020/12/16 16:00:32 gammu-smsd[3493]: gammu: [Connection       - "at"]
pi@ubuntu:~ $ sudo /etc/init.d/gammu-smsd start                                                     Wed 2020/12/16 16:00:32 gammu-smsd[3493]: gammu: [Connection index - 0]
[ ok ] Starting gammu-smsd (via systemctl): gammu-smsd.service.                                       Wed 2020/12/16 16:00:32 gammu-smsd[3493]: gammu: [Model type       - ""]
pi@ubuntu:~ $ lsusb                                                                                 Wed 2020/12/16 16:00:32 gammu-smsd[3493]: gammu: [Device           - "/dev/ttyUSB0"]
Bus 001 Device 008: ID 12d1:1446 Huawei Technologies Co., Ltd. HSPA modem                             Wed 2020/12/16 16:00:32 gammu-smsd[3493]: gammu: [Running on       - Linux, kernel 5.4.51+ (#1333 Mon
Bus 001 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub                                         Aug 10 16:38:02 BST 2020)]
pi@ubuntu:~ $ ls /etc/                                                                              Wed 2020/12/16 16:00:32 gammu-smsd[3493]: gammu: [System error     - open in serial_open, 2, "No such
Display all 173 possibilities? (y or n)                                                                file or directory"]
pi@ubuntu:~ $ ls /etc/t                                                                             Wed 2020/12/16 16:00:32 gammu-smsd[3493]: gammu: Init:GSM_TryGetModel failed with error DEVICENOTEXIS
terminfo/     timezone      tmpfiles.d/   triggerhappy/                                               T[4]: Error opening device, it doesn't exist.
pi@ubuntu:~ $ ls /dev/                                                                              Wed 2020/12/16 16:00:32 gammu-smsd[3493]: Error at init connection: Error opening device, it doesn't
Display all 183 possibilities? (y or n)                                                               exist. 
```
### config /etc/gammu-smsdc
```sh
# Configuration file for Gammu SMS Daemon

# Gammu library configuration, see gammurc(5)
[gammu]
# Please configure this!
#port = /dev/ttyUSB0
port = /dev/ttyUSB1
connection = at
# Debugging
#logformat = textall

# SMSD configuration, see gammu-smsdrc(5)
[smsd]
service = files
#logfile = syslog
logfile = /var/log/gammu-smsd
# Increase for debugging information
debuglevel = 4
ReceiveFrequency = 5
PIN = 1234

# Paths where messages are stored
inboxpath = /var/spool/gammu/inbox/
outboxpath = /var/spool/gammu/outbox/
sentsmspath = /var/spool/gammu/sent/
errorsmspath = /var/spool/gammu/error/

# Format, 否则inbox/下面的中文短信为乱码
InboxFormat = unicode
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