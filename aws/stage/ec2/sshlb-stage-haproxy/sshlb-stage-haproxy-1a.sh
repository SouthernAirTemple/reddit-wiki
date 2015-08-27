sh -c "echo '# /etc/cloud/cloud.cfg.d/defaults.cfg
# cloud-config
# hostname reverts if not added 
hostname: sshlb-stage-haproxy-1a   
fqdn: sshlb-stage-haproxy-1a.internal.example.com' > /etc/cloud/cloud.cfg.d/defaults.cfg"

# remove initial config and rerun with new defaults
rm -fr /var/lib/cloud/instances

cloud-init init  

sudo yum install haproxy-1.5.4-4.el7_1 -y

sudo yum install vim