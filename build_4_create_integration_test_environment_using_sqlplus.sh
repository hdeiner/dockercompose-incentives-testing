#!/usr/bin/env bash

figlet -f standard -w 180 "Create Oracle and"
figlet -f standard -w 180 "Tomcat Containers"

./build_6_destroy_integration_test_environment.sh

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

sqlplus system/oracle@$(hostname):1521/EE.oracle.docker @src/main/db/ddl_users.sql > ./sqlplus-out/ddl_users.out

sqlplus CSID/CSID@$(hostname):1521/EE.oracle.docker @src/main/db/CSID/ddl_csid_tables.sql > ./sqlplus-out/CSID/ddl_csid_tables.out
sqlplus CSID/CSID@$(hostname):1521/EE.oracle.docker @src/main/db/CSID/ddl_csid_grants.sql > ./sqlplus-out/CSID/dl_csid_grants.out

sqlplus ODS/ODS@$(hostname):1521/EE.oracle.docker @src/main/db/ODS/ddl_ods_types.sql > ./sqlplus-out/ODS/ddl_ods_types.out1
sqlplus ODS/ODS@$(hostname):1521/EE.oracle.docker @src/main/db/ODS/ddl_ods_tables.sql > ./sqlplus-out/ODS/ddl_ods_tables.out1
sqlplus ODS/ODS@$(hostname):1521/EE.oracle.docker @src/main/db/ODS/ddl_ods_seq.sql > ./sqlplus-out/ODS/ddl_ods_seq.out1
sqlplus ODS/ODS@$(hostname):1521/EE.oracle.docker @src/main/db/ODS/ddl_ods_procs.sql > ./sqlplus-out/ODS/ddl_ods_procs.out1
sqlplus ODS/ODS@$(hostname):1521/EE.oracle.docker @src/main/db/ODS/ddl_ods_functions.sql > ./sqlplus-out/ODS/ddl_ods_functions.out1
sqlplus ODS/ODS@$(hostname):1521/EE.oracle.docker @src/main/db/ODS/ddl_ods_packages.sql > ./sqlplus-out/ODS/ddl_ods_packages.out1

sqlplus ODS/ODS@$(hostname):1521/EE.oracle.docker @src/main/db/ODS/ddl_ods_types.sql > ./sqlplus-out/ODS/ddl_ods_types.out2
sqlplus ODS/ODS@$(hostname):1521/EE.oracle.docker @src/main/db/ODS/ddl_ods_tables.sql > ./sqlplus-out/ODS/ddl_ods_tables.out2
sqlplus ODS/ODS@$(hostname):1521/EE.oracle.docker @src/main/db/ODS/ddl_ods_seq.sql > ./sqlplus-out/ODS/ddl_ods_seq.out2
sqlplus ODS/ODS@$(hostname):1521/EE.oracle.docker @src/main/db/ODS/ddl_ods_procs.sql > ./sqlplus-out/ODS/ddl_ods_procs.out2
sqlplus ODS/ODS@$(hostname):1521/EE.oracle.docker @src/main/db/ODS/ddl_ods_functions.sql > ./sqlplus-out/ODS/ddl_ods_functions.out2
sqlplus ODS/ODS@$(hostname):1521/EE.oracle.docker @src/main/db/ODS/ddl_ods_packages.sql > ./sqlplus-out/ODS/ddl_ods_packages.out2

sqlplus ODS/ODS@$(hostname):1521/EE.oracle.docker @src/main/db/ODS/ddl_ods_grants.sql > ./sqlplus-out/ODS/ddl_ods_grants.out

sqlplus INCV/INCV@$(hostname):1521/EE.oracle.docker @src/main/db/INCV/ddl_incv_types.sql > ./sqlplus-out/INCV/ddl_incv_types.out1
sqlplus INCV/INCV@$(hostname):1521/EE.oracle.docker @src/main/db/INCV/ddl_incv_tables.sql > ./sqlplus-out/INCV/ddl_incv_tables.out1
sqlplus INCV/INCV@$(hostname):1521/EE.oracle.docker @src/main/db/INCV/ddl_incv_seq.sql > ./sqlplus-out/INCV/ddl_incv_seq.out1
sqlplus INCV/INCV@$(hostname):1521/EE.oracle.docker @src/main/db/INCV/ddl_incv_packages.sql > ./sqlplus-out/INCV/ddl_incv_packages.out1
sqlplus INCV/INCV@$(hostname):1521/EE.oracle.docker @src/main/db/INCV/ddl_incv_procedures.sql > ./sqlplus-out/INCV/ddl_incv_procedures.out1
sqlplus INCV/INCV@$(hostname):1521/EE.oracle.docker @src/main/db/INCV/ddl_incv_views.sql > ./sqlplus-out/INCV/ddl_incv_views.out1

sqlplus INCV/INCV@$(hostname):1521/EE.oracle.docker @src/main/db/INCV/ddl_incv_types.sql > ./sqlplus-out/INCV/ddl_incv_types.out2
sqlplus INCV/INCV@$(hostname):1521/EE.oracle.docker @src/main/db/INCV/ddl_incv_tables.sql > ./sqlplus-out/INCV/ddl_incv_tables.out2
sqlplus INCV/INCV@$(hostname):1521/EE.oracle.docker @src/main/db/INCV/ddl_incv_seq.sql > ./sqlplus-out/INCV/ddl_incv_seq.out2
sqlplus INCV/INCV@$(hostname):1521/EE.oracle.docker @src/main/db/INCV/ddl_incv_packages.sql > ./sqlplus-out/INCV/ddl_incv_packages.out2
sqlplus INCV/INCV@$(hostname):1521/EE.oracle.docker @src/main/db/INCV/ddl_incv_procedures.sql > ./sqlplus-out/INCV/ddl_incv_procedures.out2
sqlplus INCV/INCV@$(hostname):1521/EE.oracle.docker @src/main/db/INCV/ddl_incv_views.sql > ./sqlplus-out/INCV/ddl_incv_views.out2

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

sqlplus INCV/INCV@$(hostname):1521/EE.oracle.docker @src/test/db/ODS/dml_ods_setup.sql > ./sqlplus-out/ODS/dml_ods_setup.out
sqlplus INCV/INCV@$(hostname):1521/EE.oracle.docker @src/test/db/INCV/dml_incv_setup.sql > ./sqlplus-out/INCV/dml_incv_setup.out
sqlplus INCV/INCV@$(hostname):1521/EE.oracle.docker @src/test/db/ODS/dml_ods_member.sql > ./sqlplus-out/ODS/dml_ods_member.out
sqlplus INCV/INCV@$(hostname):1521/EE.oracle.docker @src/test/db/INCV/dml_incv_program_setup.sql > ./sqlplus-out/INCV/dml_incv_program_setup.out
date

rm -rf logs_tomcat
mkdir logs_tomcat

echo "Waiting for Tomcat to start"
while true ; do
  curl -s localhost:8080 > tmp.txt
  result=$(grep -c "Apache Tomcat/7.0.94" tmp.txt)
  if [ $result = 2 ] ; then
    echo "Tomcat has started"
    break
  fi
  sleep 5
done
rm tmp.txt
date
