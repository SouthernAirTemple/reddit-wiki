sh -c "echo '# /etc/cloud/cloud.cfg.d/defaults.cfg
# cloud-config
# hostname reverts if not added 
hostname: config-stage-puppet-1a   
fqdn: config-stage-puppet-1a.internal.example.com' > /etc/cloud/cloud.cfg.d/defaults.cfg"

# remove initial config and rerun with new defaults
rm -fr /var/lib/cloud/instances

cloud-init init  

yum install ntp-4.2.6p5-19.el7_1.1

yum install vim -y

yum install screen -y

sh -c "echo '#!/bin/sh
/usr/sbin/ntpdate pool.ntp.org' > /etc/cron.daily/ntpdate"

rpm -ivh https://yum.puppetlabs.com/puppetlabs-release-el-7.noarch.rpm

yum clean all

yum install puppet-server 3.8.2-1.el7 -y

screen -d -m puppet master --verbose --no-daemonize
