#!/usr/bin/env bash

docker-compose -f docker-compose-incentives-integration-testing.yml down

rm -rf logs_tomcat *.out* *.properties