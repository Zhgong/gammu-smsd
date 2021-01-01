from dotenv import load_dotenv
import os
load_dotenv()


TOKEN = os.getenv("TOKEN")  # sms bot
CHAT_ID = os.getenv("CHAT_ID")

FOLDERS = {
    'inbox': '/var/spool/gammu/inbox/',
    'archieve': '/var/spool/gammu/archieve'
}
