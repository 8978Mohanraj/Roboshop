cp catalogue.repo /etc/yum.repos.d/catalouge.repo
  echo -e "\e[36m>>>>>>>>> Copy MongoDB repo <<<<<<<<\e[0m"
curl -sL https://rpm.nodesource.com/setup_lts.x | bash
  echo -e "\e[36m>>>>>>>>> Install nodejs <<<<<<<<\e[0m"
yum install nodejs -y
  echo -e "\e[36m>>>>>>>>> add application user <<<<<<<<\e[0m"
useradd roboshop
  echo -e "\e[36m>>>>>>>>> create a new directory app <<<<<<<<\e[0m"
mkdir /app
  echo -e "\e[36m>>>>>>>>> zip the catalouge file <<<<<<<<\e[0m"
curl -o /tmp/catalogue.zip https://roboshop-artifacts.s3.amazonaws.com/catalogue.zip
cd /app
unzip /tmp/catalogue.zip
cd /app
npm install
systemctl daemon-reload
systemctl enable catalogue
systemctl start catalogue
yum install mongodb-org-shell -y
mongo --host MONGODB-SERVER-IPADDRESS </app/schema/catalogue.js