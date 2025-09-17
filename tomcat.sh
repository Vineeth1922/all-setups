
cd /opt
wget https://dlcdn.apache.org/tomcat/tomcat-9/v9.0.109/bin/apache-tomcat-9.0.109.tar.gz
tar -xvzf apache-tomcat-9.0.109.tar.gz
mv apache-tomcat-9.0.109 tomcat9
chmod +x tomcat9/bin/*.sh
./tomcat9/bin/startup.sh


