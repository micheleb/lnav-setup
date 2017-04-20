#!/bin/bash
if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit
fi

VERSION="0.8.2"
wget -O lnav-${VERSION}.zip https://github.com/tstack/lnav/releases/download/v${VERSION}/lnav-${VERSION}-linux-64bit.zip
unzip lnav-${VERSION}.zip
rm lnav.zip
mv lnav-${VERSION} /opt/lnav
cd /usr/local/bin
ln -s /opt/lnav/lnav lnav

