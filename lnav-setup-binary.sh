#!/bin/bash
if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit
fi

VERSION="0.8.2"
wget -O lnav-${VERSION}.zip https://github.com/tstack/lnav/releases/download/v${VERSION}/lnav-${VERSION}-linux-64bit.zip
unzip lnav-${VERSION}.zip
rm lnav-${VERSION}.zip
rm -rf /opt/lnav
mv lnav-${VERSION} /opt/lnav
cd /usr/local/bin
rm -r lnav
ln -s /opt/lnav/lnav lnav

if [[ "$#" -eq 1 && "$1" == "-l" ]]; then
    cd /home/ec2-user
    if [[ ! -d logs ]]; then
        mkdir logs
        cd logs
        ln -s /var/log/tomcat8/application.log application.log
        ln -s /var/log/tomcat8/catalina.out catalina.out
        ln -s /var/log/tomcat8/localhost_access_log.txt
        cd ..
        chown -R ec2-user logs
    fi
fi
