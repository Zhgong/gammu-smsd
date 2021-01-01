FROM python:3.8-slim

WORKDIR /root

COPY requirements.txt requirements.txt
RUN python -m venv venv \
    && venv/bin/pip install --upgrade pip \
    && venv/bin/pip install -r requirements.txt \
    && apt-get update \
    && apt-get install -y cron rsyslog gammu gammu-smsd\
    && apt-get clean

COPY gammu-smsdrc /etc/gammu-smsdrc

COPY src ./src
COPY main.py watch_status.sh receive-sms.sh boot.sh .env config.py ./
RUN chmod +x watch_status.sh receive-sms.sh boot.sh
ENTRYPOINT ["./boot.sh"]