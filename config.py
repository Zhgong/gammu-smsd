import os

from dotenv import load_dotenv

load_dotenv()


TOKEN = os.getenv("TOKEN")  # sms bot
CHAT_ID = os.getenv("CHAT_ID")
DSN = os.getenv("DSN")

FOLDERS = {
    'inbox': '/var/spool/gammu/inbox/',
    'archieve': '/var/spool/gammu/archieve'
}
