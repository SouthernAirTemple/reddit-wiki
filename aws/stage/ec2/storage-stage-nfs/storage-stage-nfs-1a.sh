DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
sh -c "echo '# /etc/cloud/cloud.cfg.d/defaults.cfg
# cloud-config
# hostname reverts if not added 
hostname: storage-stage-nfs-1a   
fqdn: storage-stage-nfs-1a.internal.example.com' > /etc/cloud/cloud.cfg.d/defaults.cfg"

# remove initial config and rerun with new defaults
rm -fr /var/lib/cloud/instances

cloud-init init  
bash "$DIR"/../defaults.sh
yum install nfs-utils portmap -y
useradd data

mv $DIR/exports /etc/exports 
mv $DIR/data.autofs /etc/auto.master.d/data.autofs
mv $DIR/data.misc /etc/data.misc 
chmod g+s /home/data
mkdir /home/data/files
mkdir /home/data/configs
mkdir /home/data/dbs

systemctl start rpcbind
systemctl enable rpcbind
systemctl enable nfs-server
systemctl start nfs
exportfs -a
systemctl start autofs
