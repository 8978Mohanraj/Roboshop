cp mongo.repo /etc/yum.repos.d/mongo.repo
yum install mongoDB-4.x -y
systemctl enable mongod
systemctl start mongod
