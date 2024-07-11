#!/usr/bin/env sh

TRIES=20

set -o pipefail
echo "Testing Started"

for i in $(seq 1 $TRIES)
do
    echo " ${i} - Curl"
    curl -f -v -o/dev/null speedtest.tele2.net/3MB.zip 2>&1 | tee ./output${i}.txt
    echo "${i} - Result: $?" >> ./result.txt
done

printf "\n \n" >> result.txt

for i in $(seq 1 $TRIES)
do
    echo "${i} - ##################" >> ./result.txt
    cat ./output${i}.txt >> result.txt
    rm ./output${i}.txt
    printf "\n \n" >> result.txt
done

set +o pipefail