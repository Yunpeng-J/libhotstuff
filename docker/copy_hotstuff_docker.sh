#!/bin/bash
echo "Deploy docker image to all servers..."

user=$(cat docker/config.sh | awk -F '#' '{print $1}' | grep "user"  | awk -F '=' '{print $2}' | awk '$1=$1')
password=$(cat docker/config.sh | awk -F '#' '{print $1}' | grep "password"  | awk -F '=' '{print $2}' | awk '$1=$1')
tag=$1

for host in `cat ./docker/servers`; do
    echo $host
    scp hotstuff.tar ${user}@${host}:~/
    ssh ${user}@${host} 'docker rm $(docker ps -aq --filter name="hotstuff"); docker rmi hotstuff:'${tag}'; docker load --input hotstuff.tar'
done