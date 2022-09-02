#!/bin/bash

while getopts k:u:p:c: flag
do
    case "${flag}" in
        # k) key=${OPTARG};;
        u) usrnm=${OPTARG};;
        p) ip=${OPTARG};;
        c) contnm=${OPTARG};;
    esac
done
#echo "Key: $key";
echo "Username: $usrnm";
echo "IPAddress: $ip";
echo "ContainerName: $contnm";

var=$(ssh -i $key $usrnm@$ip -tt "sudo docker ps -a --format 'table {{.Names}}' | grep "$contnm"; exit 0")

if [ "$contnm" = "$var" ]; then
        ssh -i $key $usrnm@$ip -tt "sudo docker ps -a --format 'table {{.ID}}\t{{.Names}}\t{{.Image}}'; sudo docker restart $contnm"
        #ssh -i $key $usrnm@$ip "sudo docker restart $contnm"
else
        echo "$contnm container not found"
fi


