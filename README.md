# HotStuff

# Run
1. Update host configuration in `docker/servers`.
2. Update user and password in `docker/config.sh`.
3. Build image and scp to other hosts: `cmake -DCMAKE_BUILD_TYPE=Release -DBUILD_SHARED=ON -DHOTSTUFF_PROTO_LOG=ON;  make -j; bash docker/deploy.sh`. (set `HOTSTUFF_CMD_REQSIZE` in `include/client.h`)
4. Run servers: `bash docker/run.sh`. 
5. Run clients: `bash scripts/run_demo_client.sh`


# Result

nodes = 4


|batchsize|payloadsize|clients|tput|
|---|---|---|---|
|400|1000|16|32k|
|400|128|16|27k|
|400|0|16|28k|