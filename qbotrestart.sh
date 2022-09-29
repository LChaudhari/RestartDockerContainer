#!/bin/bash

IP_add=("172.31.96.27" "172.31.105.164")
for ips in $IP_add;
  do
    ssh -o "StrictHostKeyChecking no" ec2-user@$ips -tt 'sudo docker ps -a --format "table {{.ID}}\t{{.Names}}\t{{.Image}}"; sudo docker restart $(sudo docker ps -a -q); exit'
    echo "Container Restart Successfully"
done

# ${IP_add[@]};
