#!/usr/bin/bash
# this will install packages and software as well as run commands required by every instance before puppet is available. 

# turn off selinux as is active with ami
sed 's/SELINUX=enabled/SELINUX=disabled/g' -i /etc/selinux/config

# ensure SSH is listening on port 2222 rather than 22 for forwarding
sed 's/#Port 22/Port 2222/g' -i /etc/ssh/sshd_config

systemctl restart sshd

setenforce 0

yum clean all

yum install vim -y

yum install screen -y

curl -O https://bootstrap.pypa.io/get-pip.py

python get-pip.py

pip install awscli

yum install ntp -y

sh -c "echo '#!/bin/sh
/usr/sbin/ntpdate pool.ntp.org' > /etc/cron.daily/ntpdate"
