#!/bin/bash


tag=ori

if [ $# -eq 1 ]; then 
    tag=$1
fi


echo "image tag: $tag"

echo "Building image"
rm -f hotstuff.tar

docker build -t hotstuff:$tag .
docker save -o hotstuff.tar hotstuff:$tag

# stop running containers on all servers, must stop before deploy, or the old image cannot be deleted
./docker/kill_docker.sh

# deploy to all servers
./docker/copy_hotstuff_docker.sh $tag



