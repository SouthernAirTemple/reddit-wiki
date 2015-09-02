DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
sh -c "echo '# /etc/cloud/cloud.cfg.d/defaults.cfg
# cloud-config
# hostname reverts if not added 
hostname: storage-stage-nas-1a   
fqdn: storage-stage-nas-1a.internal.example.com' > /etc/cloud/cloud.cfg.d/defaults.cfg"

# remove initial config and rerun with new defaults
rm -fr /var/lib/cloud/instances

cloud-init init  
bash "$DIR"/../defaults.sh
