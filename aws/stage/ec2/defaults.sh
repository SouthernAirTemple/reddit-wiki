#!/usr/bin/bash
# this will install packages and software as well as run commands required by every instance before puppet is available. 
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# turn off selinux as is active with ami
sed 's/SELINUX=enabled/SELINUX=disabled/g' -i /etc/selinux/config

setenforce 0

yum clean all

yum install vim -y

yum install screen -y

curl -O https://bootstrap.pypa.io/get-pip.py

python get-pip.py

pip install awscli

yum install ntp -y

yum install telnet -y
sh -c "echo '#!/bin/sh
/usr/sbin/ntpdate pool.ntp.org' > /etc/cron.daily/ntpdate"

# install autofs for creds access
yum install autofs -y

mv $DIR/hosts /etc/hosts
