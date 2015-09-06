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
yum install nfs-utils portmap -y
yum install autofs -y

useradd data

mv $DIR/exports /etc/exports 
mv $DIR/data.autofs /etc/auto.master.d/data.autofs
mv $DIR/data.misc /etc/data.misc 

systemctl start rpcbind
systemctl enable rpcbind
systemctl enable nfs
systemctl start nfs
exportfs -a
systemctl start autofs
