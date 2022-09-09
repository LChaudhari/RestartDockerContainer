#!/bin/bash


while getopts u:p:c:s: flag
do
    case "${flag}" in
        # k) key=${OPTARG};;
        u) usrnm=${OPTARG};;
        p) ip=${OPTARG};;
        c) contnm=${OPTARG};;
        s) slackvar=${OPTARG};;
    esac
done
#echo "Key: $key";
echo "Username: $usrnm";
echo "IPAddress: $ip";
echo "ContainerName: $contnm";
echo "Slackvar: $slackvar";

#slack_notification (){
 #  SLACK_WEBHOOK_URL= $slackvar
  # notify_string="Test String" 
   #curl -sk -d "payload={\"channel\": \"#low-high-priority\", \"username\": \"Docker Container Restart Successful\", \"text\":  \"${notify_string}\"}" ${SLACK_WEBHOOK_URL}
#}

var=$(ssh -o "StrictHostKeyChecking no" $usrnm@$ip -t "sudo docker ps -a --format 'table {{.Names}}' | grep "$contnm"; exit 0")

if [ "$contnm" = "$var" ]; then
        ssh -o "StrictHostKeyChecking no" $usrnm@$ip -t "sudo docker ps -a --format 'table {{.ID}}\t{{.Names}}\t{{.Image}}'; sudo docker restart $contnm"
        echo "Container Restart Successfully"
        return 1
else
        echo "$contnm container not found"
        exit 0
fi
