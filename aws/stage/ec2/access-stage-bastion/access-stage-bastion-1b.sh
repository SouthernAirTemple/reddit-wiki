sh -c "echo '# /etc/cloud/cloud.cfg.d/defaults.cfg
# cloud-config
# hostname reverts if not added 
hostname: access-stage-bastion-1b   
fqdn: access-stage-bastion-1b.internal.example.com' > /etc/cloud/cloud.cfg.d/defaults.cfg"

# remove initial config and rerun with new defaults
rm -fr /var/lib/cloud/instances

cloud-init init  

yum install vim -y

yum install screen -y

yum clean all

yum install vim -y

yum install screen -y

curl -O https://bootstrap.pypa.io/get-pip.py

python get-pip.py

pip install awscli

