FROM python:3.9-slim

WORKDIR /root

COPY requirements.txt requirements.txt
RUN python -m venv venv \
    && venv/bin/pip install --upgrade pip \
    && venv/bin/pip install -r requirements.txt \
    && echo "deb http://deb.debian.org/debian bullseye-backports main contrib non-free" >> /etc/apt/sources.list \
    && apt-get update \
    && apt-get install -y cron rsyslog gammu gammu-smsd\
    && apt-get clean

COPY gammu-smsdrc /etc/gammu-smsdrc

COPY src ./src
COPY main.py watch_status.sh receive-sms.sh boot.sh backup-log.sh config.py ./
RUN chmod +x watch_status.sh receive-sms.sh boot.sh backup-log.sh 
ENTRYPOINT ["./boot.sh"]