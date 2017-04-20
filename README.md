# lnav-setup
A simple script that pulls the latest version of lnav as a .deb and installs it

# Usage (install from .deb)
Clone the repo and run `./lnav-setup.sh` as root

# Usage (install from binary)
Clone the repo and run `./lnav-setup-binary.sh` as root

# Extra option
If you pass `-l` as an argument to the script, it will create a folder named
`logs` inside `/home/ec2-user` (which should be there on an EC2 instance), and
it will soft-link `application.log`, `catalina.out`, and
`localhost_access_log.txt` from `/var/log/tomcat8`, changing the owner of the
folder to `ec2-user`.
