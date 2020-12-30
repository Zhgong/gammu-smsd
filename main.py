import logging
import config
import requests

logging.basicConfig(
    format="%(asctime)-15s %(filename)s %(message)s", level=logging.INFO)
URL = f"https://api.telegram.org/bot{config.TOKEN}/sendMessage"

data = {"chat_id": config.CHAT_ID, "text": "post from python"}
requests.post(url=URL, data=data)
