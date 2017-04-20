#!/bin/bash
if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit
fi

wget -O lnav.deb https://github.com/tstack/lnav/releases/download/v0.8.2/lnav_0.8.2_amd64.deb
dpkg -i lnav.deb
rm lnav.deb

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
