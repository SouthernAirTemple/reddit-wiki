sh -c "echo '# /etc/cloud/cloud.cfg.d/defaults.cfg
# cloud-config
# hostname reverts if not added 
hostname: storage-stage-nas-1a   
fqdn: storage-stage-nas-1a.internal.example.com' > /etc/cloud/cloud.cfg.d/defaults.cfg"

# remove initial config and rerun with new defaults
rm -fr /var/lib/cloud/instances

cloud-init init  

yum install ntp -y

yum install vim -y

yum install screen -y

sh -c "echo '#!/bin/sh
/usr/sbin/ntpdate pool.ntp.org' > /etc/cron.daily/ntpdate"

rpm -ivh https://yum.puppetlabs.com/puppetlabs-release-el-7.noarch.rpm

yum clean all

curl -O https://bootstrap.pypa.io/get-pip.py

python get-pip.py

pip install awscli

