## echo -e "\e[36m>>>>>>>>> Copy MongoDB repo <<<<<<<<\e[0m"
curl -sL https://rpm.nodesource.com/setup_lts.x | bash
echo -e "\e[36m>>>>>>>>> Install nodejs <<<<<<<<\e[0m"
yum install nodejs -y
echo -e "\e[36m>>>>>>>>> add application user <<<<<<<<\e[0m"
useradd roboshop
echo -e "\e[36m>>>>>>>>> create a new directory app <<<<<<<<\e[0m"
rm -rf /app
mkdir /app
echo -e "\e[36m>>>>>>>>> zip the catalouge file <<<<<<<<\e[0m"
curl -o /tmp/catalogue.zip https://roboshop-artifacts.s3.amazonaws.com/catalogue.zip
cd /app
unzip /tmp/catalogue.zip
npm install
cp /home/centos/Roboshop/catalouge.service /etc/systemd/system/catalogue.service
systemctl daemon-reload
systemctl enable catalogue
systemctl start catalogue
yum install mongodb-org-shell -y
mongo --host MONGODB-SERVER-IPADDRESS </app/schema/catalogue.js