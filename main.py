import logging

import requests
import sentry_sdk

import config

sentry_sdk.init(
    dsn=config.DSN,

    # Set traces_sample_rate to 1.0 to capture 100%
    # of transactions for performance monitoring.
    # We recommend adjusting this value in production.
    traces_sample_rate=1.0
)
from src import smschecker

logging.basicConfig(
    format="%(asctime)-15s %(filename)s %(message)s", level=logging.INFO)
URL = f"https://api.telegram.org/bot{config.TOKEN}/sendMessage"


def send_message(text: str):
    data = {"chat_id": config.CHAT_ID, "text": text}
    res = requests.post(url=URL, data=data)
    print(res.content)

sms_checker = smschecker.SMS_CHECKER()
sent_sms = []
for s in sms_checker.get_sms():
    print(s.text)
    send_message(s.text)
    sent_sms.append(s)

sms_checker.archieve(sent_sms)
