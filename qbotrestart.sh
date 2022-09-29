#!/bin/bash

# IP_add="172.31.96.27 172.31.105.164"
for ips in 172.31.96.27 172.31.105.164:
  do
    ssh -o "StrictHostKeyChecking no" ec2-user@$ips -t 'sudo docker ps -a --format "table {{.ID}}\t{{.Names}}\t{{.Image}}"; sudo docker restart $(sudo docker ps -a -q)'
    echo "Container Restart Successfully"
done
