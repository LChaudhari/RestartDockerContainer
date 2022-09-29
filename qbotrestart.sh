#!/bin/bash


for ips in {172.31.96.27}:
  do
    ssh -o "StrictHostKeyChecking no" ec2-user@172.31.96.27 -t 'sudo docker ps -a --format "table {{.ID}}\t{{.Names}}\t{{.Image}}"; sudo docker restart $(sudo docker ps -a -q)'
    echo "Container Restart Successfully"
done
