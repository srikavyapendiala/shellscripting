#!/bin/bash

source components/common.sh
OS_PREREQ

Head "Installing npm"
apt install npm -y &>>$LOG
STAT $?

DOWNLOAD_COMPONENT


Head "Update Redis IP in service File"
sed -i -e "s/DNSREDIS/redis.kavya.website/" /root/todoshell/todo/todo/systemd.service


Head  "Create service file"
mv /root/todoshell/todo/todo/systemd.service /etc/systemd/system/todo.service

Head "Start Todo Service"
systemctl daemon-reload && systemctl start todo && systemctl status todo
STAT $?
