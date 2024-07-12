#!/usr/bin/env bash

rm -rf "./results"
mkdir "./results"

# Default Net
fileName="1-default_network.txt"
touch "./results/$fileName"
docker run -v ${PWD}/results/$fileName:/result.txt -v ${PWD}/curl_reach_test.sh:/reach_test.sh docker.io/paulohgodinho/debianwithcurl:latest bash reach_test.sh

# New Bridge
docker network create -d bridge temp-bridge
fileName="2-new-bridge.txt"
touch "./results/$fileName"
docker run --network temp-bridge -v ${PWD}/results/$fileName:/result.txt -v ${PWD}/curl_reach_test.sh:/reach_test.sh docker.io/paulohgodinho/debianwithcurl:latest bash reach_test.sh
docker network remove temp-bridge

# Wings Network
fileName="3-wings-network.txt"
touch "./results/$fileName"
docker run --network pterodactyl_nw -v ${PWD}/results/$fileName:/result.txt -v ${PWD}/curl_reach_test.sh:/reach_test.sh docker.io/paulohgodinho/debianwithcurl:latest bash reach_test.sh