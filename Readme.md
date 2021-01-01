# gammu-smsd configuration

gammu-smsd will receive sms and forward the content of sms via telegram

## Hardware:
supported hardware Huawei E173


## Run with docker

### .env

```bash
TOKEN=<your-telegram-bot-token>
CHAT_ID=<your-chat-token>
```

### Simple running

```bash
docker run -it -d --env-file .env \
--device=/dev/ttyUSB0 \
--name gammu-smsd gammu-smsd:latest
```

### Running with binding log data
The following command will run docker and bind:

- gammu-data:
    - inbox
    - outbox
    - archieve
    - error

    folders for storing sms

- gammu-smsd.log
- receive-sms.log

```bash
docker run -it -d --env-file .env \
--device=/dev/ttyUSB0 \
--mount type=bind,source=$DIR/gammu-data,target=/var/spool/gammu \
--mount type=bind,source=$DIR/gammu-smsd.log,target=/var/log/gammu-smsd.log \
--mount type=bind,source=$DIR/receive-sms.log,target=/var/log/receive-sms.log \
--name gammu-smsd gammu-smsd:latest
```


## [How to from scrath](How_to.md)