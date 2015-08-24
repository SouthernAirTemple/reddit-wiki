sh -c "echo '# /etc/cloud/cloud.cfg.d/defaults.cfg
# cloud-config
# hostname reverts if not added 
hostname: sshlb-stage-haproxy-1a   
fqdn: sshlb-stage-haproxy-1a.example.com' > /etc/cloud/cloud.cfg.d/defaults.cfg"
