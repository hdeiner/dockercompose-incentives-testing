#!/usr/bin/env bash

figlet -f standard -w 160 "Create Oracle Database Image"

docker-compose -f docker-compose-oracle-incentives-image-creation.yml up -d
date

echo "Waiting for Oracle to start"
while true ; do
  curl -s localhost:8081 > tmp.txt
  result=$(grep -c "DOCTYPE HTML PUBLIC" tmp.txt)
  if [ $result = 1 ] ; then
    echo "Oracle has started"
    break
  fi
  sleep 5
done
rm tmp.txt
date

figlet -f slant -w 180 "Commit Oracle Database Image"

docker rmi howarddeiner/incentives-oracle
docker commit oracle howarddeiner/incentives-oracle

docker-compose -f docker-compose-oracle-incentives-image-creation.yml down
date