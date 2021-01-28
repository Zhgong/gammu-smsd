# 首次运行执行次脚本
# Install the service with systemctl
sudo ln -s /home/ubuntu/gammu-smsd/service/check-sms-data-receive-service.service /etc/systemd/system

sudo systemctl enable  check-sms-data-receive-service

sudo systemctl start  check-sms-data-receive-service