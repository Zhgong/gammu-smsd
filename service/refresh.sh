# 更改huobi-trade-service.serive文件之后执行此脚本

#!/bin/bash
sudo systemctl daemon-reload
sudo systemctl restart check-sms-data-receive-service
sleep 3
sudo systemctl status check-sms-data-receive-service