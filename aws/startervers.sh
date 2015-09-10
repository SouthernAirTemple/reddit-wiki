lssrv="$(aws ec2 describe-instances 2>&1|grep access -B30|egrep -i "instances|tags" |awk '{print $7}'|awk '{print $1}'|egrep "[a-z]|[0-9]")"

startsrv="$(aws ec2 start-instances --instance-ids)"

for i in $lssrv
do 
echo "$(aws ec2 start-instances --instance-ids $i)";
done
