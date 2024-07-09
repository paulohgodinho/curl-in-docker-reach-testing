#!/usr/bin/env sh

echo "Testing Started"

echo "First Curl"
curl -f -v -o/dev/null speedtest.tele2.net/3MB.zip 2>&1 | tee ./output1.txt
echo "1 - Result: $?" >> ./result.txt

echo "Second Curl"
curl -f -v -o/dev/null speedtest.tele2.net/3MB.zip 2>&1 | tee ./output2.txt
echo "2 - Result: $?" >> ./result.txt

echo "Third Curl"
curl -f -v -o/dev/null speedtest.tele2.net/3MB.zip 2>&1 | tee ./output3.txt
echo "3 - Result: $?" >> ./result.txt

echo "Fourth Curl"
curl -f -v -o/dev/null speedtest.tele2.net/3MB.zip 2>&1 | tee ./output4.txt
echo "4 - Result: $?" >> ./result.txt

echo "Fifth Curl"
curl -f -v -o/dev/null speedtest.tele2.net/3MB.zip 2>&1 | tee ./output5.txt
echo "5 - Result: $?" >> ./result.txt

printf "\n \n" >> result.txt

echo "1 - ##################" >> ./result.txt
cat ./output1.txt >> result.txt
rm ./output1.txt
printf "\n \n" >> result.txt

echo "2 - ##################" >> ./result.txt
cat ./output2.txt >> result.txt
rm ./output2.txt
printf "\n \n" >> result.txt

echo "3 - ##################" >> ./result.txt
cat ./output3.txt >> result.txt
rm ./output3.txt
printf "\n \n" >> result.txt

echo "4 - ##################" >> ./result.txt
cat ./output4.txt >> result.txt
rm ./output4.txt
printf "\n \n" >> result.txt

echo "5 - ##################" >> ./result.txt
cat ./output5.txt >> result.txt
rm ./output5.txt
