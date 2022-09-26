#!/bin/bash

ssh -o "StrictHostKeyChecking no" ec2-user@172.31.96.27 -t "sudo docker ps -a --format 'table {{.ID}}\t{{.Names}}\t{{.Image}}'; sudo docker restart Nginx"
echo "Container Restart Successfully"
