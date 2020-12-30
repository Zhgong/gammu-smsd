from dotenv import load_dotenv
import os
load_dotenv()


TOKEN = os.getenv("TOKEN")  # sms bot
CHAT_ID = os.getenv("CHAT_ID")

FOLDERS = {
    # 'inbox':'/home/pi/smsutil/data/inbox',
    # 'archieve':'/home/pi/smsutil/data/archieve',
    'inbox': '/var/spool/gammu/inbox/',
    'archieve': '/var/spool/gammu/archieve'
    # 'inbox':'/home/zhou/Projects/smsutil/data/inbox',
    # 'archieve':'/home/zhou/Projects/smsutil/data/archieve',
}
