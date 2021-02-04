#!/bin/bash

# !/bin/bash
echo "Stoping running containers"

user=$(cat docker/config.sh | awk -F '#' '{print $1}' | grep "user"  | awk -F '=' '{print $2}' | awk '$1=$1')

hosts=($(cat ./docker/servers))
len=${#hosts[*]}

tag=ori

bash docker/kill_docker.sh

# generate hotstuff.conf
# TODO

# run

for host in ${hosts[*]}; do
    scp hotstuff.conf ${user}@${host}:~/logs_hot/hotstuff.conf 
done

node=-1
for host in ${hosts[*]}; do
    let node=$node+1
    echo $host $node
    ssh ${user}@${host} " cd; rm -rf logs_hot/log_${node}.log ; mkdir -p logs_hot; docker run --name hotstuff${node} -v /home/${user}/logs_hot/hotstuff.conf:/home/libhotstuff/hotstuff.conf --net=host --cap-add NET_ADMIN hotstuff:$tag ./examples/hotstuff-app --conf ./hotstuff-sec${node}.conf > logs_hot/log_${node} 2>&1 & "

done

