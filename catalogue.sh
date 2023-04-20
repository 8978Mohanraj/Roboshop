curl -sL https://rpm.nodesource.com/setup_lts.x | bash
yum install nodejs -y
useradd roboshop
mkdir /app
curl -o /tmp/catalogue.zip https://roboshop-artifacts.s3.amazonaws.com/catalogue.zip
cd app
unzip /tmp/catalogue.zip
npm install
systemctl daemon-reload
systemctl enable catalogue.Service
systemctl start catalogue.Service

yum install mongodb-org-shell -y
mongo --host mongodb-dev.gmr.dev.online </app/schema/catalogue.js
cp catalogue.Service /etc/systemd/system/catalogue.Service
cp mongo.repo /etc/yum.repos.d/mongo.repo
