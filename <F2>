#!/bin/bash
if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit
fi

wget -O lnav.deb https://github.com/tstack/lnav/releases/download/v0.8.2/lnav_0.8.2_amd64.deb
dpkg -i lnav.deb
rm lnav.deb
