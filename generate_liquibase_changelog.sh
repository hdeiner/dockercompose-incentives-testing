#!/usr/bin/env bash

echo "Build the liquibase.properties file for Liquibase to run against"
echo "driver: oracle.jdbc.driver.OracleDriver" > liquibase.properties
echo "classpath: lib/ojdbc8.jar" >> liquibase.properties
echo "url: jdbc:oracle:thin:@"$(hostname)":1521:EE" >> liquibase.properties
echo "username: system" >> liquibase.properties
echo "password: oracle" >> liquibase.properties

echo "Create database schema and load sample data"
liquibase --changeLogFile=./generatedChangelog.xml generateChangeLog