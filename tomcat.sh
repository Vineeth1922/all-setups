#!/bin/bash
set -e

# ===============================
# Apache Tomcat Installation Script
# ===============================

# Fixed Tomcat version
TOMCAT_VERSION=9.0.109
TOMCAT_DIR=apache-tomcat-${TOMCAT_VERSION}
TOMCAT_TAR=${TOMCAT_DIR}.tar.gz
DOWNLOAD_URL=https://dlcdn.apache.org/tomcat/tomcat-9/v${TOMCAT_VERSION}/bin/${TOMCAT_TAR}

echo "=== Installing Java 17 (Amazon Corretto) ==="
yum install java-17-amazon-corretto -y

echo "=== Downloading Apache Tomcat ${TOMCAT_VERSION} ==="
wget ${DOWNLOAD_URL}

echo "=== Extracting Tomcat ==="
tar -zxvf ${TOMCAT_TAR}

echo "=== Configuring Tomcat users ==="
# Add manager roles and user
sed -i '56  a\<role rolename="manager-gui"/>' ${TOMCAT_DIR}/conf/tomcat-users.xml
sed -i '57  a\<role rolename="manager-script"/>' ${TOMCAT_DIR}/conf/tomcat-users.xml
sed -i '58  a\<user username="tomcat" password="admin@123" roles="manager-gui, manager-script"/>' ${TOMCAT_DIR}/conf/tomcat-users.xml
sed -i '59  a\</tomcat-users>' ${TOMCAT_DIR}/conf/tomcat-users.xml
sed -i '56d' ${TOMCAT_DIR}/conf/tomcat-users.xml

echo "=== Updating context.xml to allow remote access ==="
sed -i '21d' ${TOMCAT_DIR}/webapps/manager/META-INF/context.xml
sed -i '22d' ${TOMCAT_DIR}/webapps/manager/META-INF/context.xml

echo "=== Starting Tomcat ==="
sh ${TOMCAT_DIR}/bin/startup.sh

echo "✅ Tomcat ${TOMCAT_VERSION} installed and started successfully!"
