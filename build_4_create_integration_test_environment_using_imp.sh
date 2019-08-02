#!/usr/bin/env bash

figlet -f standard -w 180 "Create Oracle and"
figlet -f standard -w 180 "Tomcat Containers"

docker-compose -f docker-compose-incentives-integration-testing.yml up -d
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

figlet -f slant -w 160 "Load Incentives Schema"

#toally hackful - having trouble reliably running sqlplus on OSX
export ORACLE_BASE=/usr/local/Oracle
export ORACLE_HOME=$ORACLE_BASE/product/instantclient/11.2.0.4.0
export DYLD_LIBRARY_PATH=$ORACLE_HOME/lib
export TNS_ADMIN=$ORACLE_BASE/admin/network

sqlplus system/oracle@$(hostname):1521/EE.oracle.docker @src/main/db/ddl_users.sql > ./ddl_users.out

# copy the dumo and log files directly into the Oracle Docker container and execute IMP from that environnment
docker cp using_exp oracle:/
docker exec oracle imp system/oracle file=/using_exp/csid.dmp log=/using_exp/csid_exp.log FULL=Y >& ./imp_csid.out
docker exec oracle imp system/oracle file=/using_exp/ods.dmp log=/using_exp/ods_exp.log FULL=Y >& ./imp_ods.out
docker exec oracle imp system/oracle file=/using_exp/incv.dmp log=/using_exp/incv_exp.log FULL=Y >& ./imp_incv.out

date

# the way we should be doing this...
#echo "Build the liquibase.properties file for Liquibase to run against"
#echo "driver: oracle.jdbc.driver.OracleDriver" > liquibase.properties
#echo "classpath: lib/ojdbc8.jar" >> liquibase.properties
#echo "url: jdbc:oracle:thin:@"$(hostname)":1521:EE" >> liquibase.properties
#echo "username: system" >> liquibase.properties
#echo "password: oracle" >> liquibase.properties

#echo "Create database schema and load sample data"
#liquibase --changeLogFile=src/main/db/changelog.xml update

figlet -f slant -w 160 "Load Incentives Data"

sqlplus INCV/INCV@$(hostname):1521/EE.oracle.docker @src/test/db/ODS/dml_ods_setup.sql > ./dml_ods_setup.out
sqlplus INCV/INCV@$(hostname):1521/EE.oracle.docker @src/test/db/INCV/dml_incv_setup.sql > ./dml_incv_setup.out
sqlplus INCV/INCV@$(hostname):1521/EE.oracle.docker @src/test/db/ODS/dml_ods_member.sql > ./dml_ods_member.out
sqlplus INCV/INCV@$(hostname):1521/EE.oracle.docker @src/test/db/INCV/dml_incv_program_setup.sql > ./dml_incv_program_setup.out
date

rm -rf logs_tomcat
mkdir logs_tomcat

echo "Waiting for Tomcat to start"
while true ; do
  curl -s localhost:8080 > tmp.txt
  result=$(grep -c "Apache Tomcat/7.0.54" tmp.txt)
  if [ $result = 2 ] ; then
    echo "Tomcat has started"
    break
  fi
  sleep 5
done
rm tmp.txt
date
