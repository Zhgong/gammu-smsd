import logging
import config
import requests
from src import smschecker

logging.basicConfig(
    format="%(asctime)-15s %(filename)s %(message)s", level=logging.INFO)
URL = f"https://api.telegram.org/bot{config.TOKEN}/sendMessage"


def send_message(text: str):
    data = {"chat_id": config.CHAT_ID, "text": text}
    requests.post(url=URL, data=data)


sms_checker = smschecker.SMS_CHECKER()
sent_sms = []
for s in sms_checker.get_sms():
    print(s.text)
    send_message(s.text)
    sent_sms.append(s)

sms_checker.archieve(sent_sms)
