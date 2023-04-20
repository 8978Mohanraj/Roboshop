curl -sL https://rpm.nodesource.com/setup_lts.x | bash
yum install nodejs -y
useradd roboshop
mkdir /app
curl -o /tmp/catalogue.zip https://roboshop-artifacts.s3.amazonaws.com/catalogue.zip
cd ...||exit
unzip /tmp/catalogue.zip
npm install
systemctl daemon-reload
systemctl enable catalogue
systemctl start catalogue

yum install mongodb-org-shell -y
mongo --host mongodb-dev.gmr.dev.online </app/schema/catalogue.js
cp catalogue.service /etc/systemd/system/catalogue.service
cp mongo.repo /etc/yum.repos.d/mongo.repo
