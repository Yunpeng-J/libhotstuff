#!/bin/bash
# Try to run the replicas as in run_demo.sh first and then run_demo_client.sh.
# Use Ctrl-C to terminate the proposing replica (e.g. replica 0). Leader
# rotation will be scheduled. Try to kill and run run_demo_client.sh again, new
# commands should still get through (be replicated) once the new leader becomes
# stable.

./examples/hotstuff-client --idx 1 --iter -1 --max-async 200 > log_1 2>&1 &
./examples/hotstuff-client --idx 2 --iter -1 --max-async 200 > log_2 2>&1 &
./examples/hotstuff-client --idx 3 --iter -1 --max-async 200 > log_3 2>&1 &
./examples/hotstuff-client --idx 0 --iter -1 --max-async 200 > log_4 2>&1 &
./examples/hotstuff-client --idx 1 --iter -1 --max-async 200 > log_5 2>&1 &
./examples/hotstuff-client --idx 2 --iter -1 --max-async 200 > log_6 2>&1 &
./examples/hotstuff-client --idx 3 --iter -1 --max-async 200 > log_7 2>&1 &
./examples/hotstuff-client --idx 0 --iter -1 --max-async 200 > log_8 2>&1 &

./examples/hotstuff-client --idx 1 --iter -1 --max-async 200 > log_51 2>&1 &
./examples/hotstuff-client --idx 2 --iter -1 --max-async 200 > log_62 2>&1 &
./examples/hotstuff-client --idx 3 --iter -1 --max-async 200 > log_73 2>&1 &
./examples/hotstuff-client --idx 0 --iter -1 --max-async 200 > log_84 2>&1 &

./examples/hotstuff-client --idx 1 --iter -1 --max-async 200 > log_11 2>&1 &
./examples/hotstuff-client --idx 2 --iter -1 --max-async 200 > log_21 2>&1 &
./examples/hotstuff-client --idx 3 --iter -1 --max-async 200 > log_31 2>&1 &
./examples/hotstuff-client --idx 0 --iter -1 --max-async 200 > log_41 2>&1 &