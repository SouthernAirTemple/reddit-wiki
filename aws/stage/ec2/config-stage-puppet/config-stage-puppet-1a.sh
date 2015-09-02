sh -c "echo '# /etc/cloud/cloud.cfg.d/defaults.cfg
# cloud-config
# hostname reverts if not added 
hostname: config-stage-puppet-1a   
fqdn: config-stage-puppet-1a.internal.example.com' > /etc/cloud/cloud.cfg.d/defaults.cfg"

# remove initial config and rerun with new defaults
rm -fr /var/lib/cloud/instances

cloud-init init  

rpm -ivh https://yum.puppetlabs.com/puppetlabs-release-el-7.noarch.rpm

yum clean all

yum install puppet-server 3.8 -y

mv /reddit-wiki/aws/stage/ec2/config-stage-puppet/puppet.conf /etc/puppet/puppet.conf

screen -d -m puppet master --verbose --no-daemonize

