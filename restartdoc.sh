#!/bin/bash
#docker ps -a --format "table {{.ID}}\t{{.Names}}\t{{.Image}}"

while getopts k:u:p:c: flag
do
    case "${flag}" in
        k) key=${OPTARG};;
        u) usrnm=${OPTARG};;
        p) ip=${OPTARG};;
        c) contnm=${OPTARG};;
    esac
done
echo "Key: $key";
echo "Username: $usrnm";
echo "IPAddress: $ip";
echo "ContainerName: $contnm";

var=$(ssh -i $key $usrnm@$ip  "sudo docker ps -a --format 'table {{.Names}}' | grep "$contnm"; exit 0")

if [ "$contnm" = "$var" ]; then
        ssh -i $key $usrnm@$ip  "sudo docker ps -a --format 'table {{.ID}}\t{{.Names}}\t{{.Image}}'; sudo docker restart $contnm"
        #ssh -i $key $usrnm@$ip "sudo docker restart $contnm"
else
        echo "$contnm container not found"
fi
<<<<<<< HEAD

=======
>>>>>>> e2df3130cb6bafe48c9a3e4a25255a23418bee59
