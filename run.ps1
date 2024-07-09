Remove-Item "./results" -Recurse -Force -ErrorAction Ignore
New-Item "./results" -ItemType folder

# Default Net
$fileName = "1-default_network.txt"
New-Item "./results/$fileName" -ItemType File
docker run -v ${PWD}/$($fileName):/result.txt -v ${PWD}/curl_reach_test.sh:/reach_test.sh docker.io/alpine/curl:latest sh reach_test.sh

# New Bridge
docker network create -d bridge temp-bridge
$fileName = "2-new-bridge.txt"
New-Item "./results/$fileName" -ItemType File
docker run --network temp-bridge -v ${PWD}/$($fileName):/result.txt -v ${PWD}/curl_reach_test.sh:/reach_test.sh docker.io/alpine/curl:latest sh reach_test.sh
docker network remove temp-bridge

# Wings Network
$fileName = "3-wings-network.txt"
New-Item "./results/$fileName" -ItemType File
docker run --network pterodactyl_nw -v ${PWD}/$($fileName):/result.txt -v ${PWD}/curl_reach_test.sh:/reach_test.sh docker.io/alpine/curl:latest sh reach_test.sh