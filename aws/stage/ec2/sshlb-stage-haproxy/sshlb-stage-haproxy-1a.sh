DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
sh -c "echo '# /etc/cloud/cloud.cfg.d/defaults.cfg
# cloud-config
# hostname reverts if not added 
hostname: sshlb-stage-haproxy-1a   
fqdn: sshlb-stage-haproxy-1a.internal.example.com' > /etc/cloud/cloud.cfg.d/defaults.cfg"

# remove initial config and rerun with new defaults
rm -fr /var/lib/cloud/instances

cloud-init init  

# ensure SSH is listening on port 2222 rather than 22 for forwarding
# sed 's/#Port 22/Port 2222/g' -i /etc/ssh/sshd_config

# yum install haproxy-1.5.4-4.el7_1 -y

bash "$DIR"/../defaults.sh

systemctl restart sshd 

systemctl start haproxy

