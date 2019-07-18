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

rm -rf sqlplus-out
mkdir sqlplus-out

docker cp ./src/main/db/ddl_users.sql oracle:/tmp/ddl_users.sql
docker exec oracle /bin/bash -c "/u01/app/oracle-product/11.2.0/EE/bin/sqlplus system/oracle @/tmp/ddl_users.sql > /tmp/ddl_users.out"
docker cp oracle:/tmp/ddl_users.out ./sqlplus-out/ddl_users.out

mkdir sqlplus-out/CSID

docker cp ./src/main/db/CSID/ddl_csid_tables.sql oracle:/tmp/ddl_csid_tables.sql
docker exec oracle /bin/bash -c "/u01/app/oracle-product/11.2.0/EE/bin/sqlplus CSID/CSID @/tmp/ddl_csid_tables.sql > /tmp/ddl_csid_tables.out"
docker cp oracle:/tmp/ddl_csid_tables.out ./sqlplus-out/CSID/ddl_csid_tables.out

docker cp ./src/main/db/CSID/ddl_csid_grants.sql oracle:/tmp/ddl_csid_grants.sql
docker exec oracle /bin/bash -c "/u01/app/oracle-product/11.2.0/EE/bin/sqlplus CSID/CSID @/tmp/ddl_csid_grants.sql > /tmp/ddl_csid_grants.out"
docker cp oracle:/tmp/ddl_csid_grants.out ./sqlplus-out/CSID/ddl_csid_grants.out

mkdir sqlplus-out/ODS

docker cp ./src/main/db/ODS/ddl_ods_types.sql oracle:/tmp/ddl_ods_types.sql
docker exec oracle /bin/bash -c "/u01/app/oracle-product/11.2.0/EE/bin/sqlplus ODS/ODS @/tmp/ddl_ods_types.sql > /tmp/ddl_ods_types.out1"
docker cp oracle:/tmp/ddl_ods_types.out1 ./sqlplus-out/ODS/ddl_ods_types.out1

docker cp ./src/main/db/ODS/ddl_ods_tables.sql oracle:/tmp/ddl_ods_tables.sql
docker exec oracle /bin/bash -c "/u01/app/oracle-product/11.2.0/EE/bin/sqlplus ODS/ODS @/tmp/ddl_ods_tables.sql > /tmp/ddl_ods_tables.out1"
docker cp oracle:/tmp/ddl_ods_tables.out1 ./sqlplus-out/ODS/ddl_ods_tables.out1

docker cp ./src/main/db/ODS/ddl_ods_seq.sql oracle:/tmp/ddl_ods_seq.sql
docker exec oracle /bin/bash -c "/u01/app/oracle-product/11.2.0/EE/bin/sqlplus ODS/ODS @/tmp/ddl_ods_seq.sql > /tmp/ddl_ods_seq.out1"
docker cp oracle:/tmp/ddl_ods_seq.out1 ./sqlplus-out/ODS/ddl_ods_seq.out1

docker cp ./src/main/db/ODS/ddl_ods_procs.sql oracle:/tmp/ddl_ods_procs.sql
docker exec oracle /bin/bash -c "/u01/app/oracle-product/11.2.0/EE/bin/sqlplus ODS/ODS @/tmp/ddl_ods_procs.sql > /tmp/ddl_ods_procs.out1"
docker cp oracle:/tmp/ddl_ods_procs.out1 ./sqlplus-out/ODS/ddl_ods_procs.out1

docker cp ./src/main/db/ODS/ddl_ods_functions.sql oracle:/tmp/ddl_ods_functions.sql
docker exec oracle /bin/bash -c "/u01/app/oracle-product/11.2.0/EE/bin/sqlplus ODS/ODS @/tmp/ddl_ods_functions.sql > /tmp/ddl_ods_functions.out1"
docker cp oracle:/tmp/ddl_ods_functions.out1 ./sqlplus-out/ODS/ddl_ods_functions.out1

docker cp ./src/main/db/ODS/ddl_ods_packages.sql oracle:/tmp/ddl_ods_packages.sql
docker exec oracle /bin/bash -c "/u01/app/oracle-product/11.2.0/EE/bin/sqlplus ODS/ODS @/tmp/ddl_ods_packages.sql > /tmp/ddl_ods_packages.out1"
docker cp oracle:/tmp/ddl_ods_packages.out1 ./sqlplus-out/ODS/ddl_ods_packages.out1

docker exec oracle /bin/bash -c "/u01/app/oracle-product/11.2.0/EE/bin/sqlplus ODS/ODS @/tmp/ddl_ods_types.sql > /tmp/ddl_ods_types.out2"
docker cp oracle:/tmp/ddl_ods_types.out2 ./sqlplus-out/ODS/ddl_ods_types.out2

docker exec oracle /bin/bash -c "/u01/app/oracle-product/11.2.0/EE/bin/sqlplus ODS/ODS @/tmp/ddl_ods_tables.sql > /tmp/ddl_ods_tables.out2"
docker cp oracle:/tmp/ddl_ods_tables.out2 ./sqlplus-out/ODS/ddl_ods_tables.out2

docker exec oracle /bin/bash -c "/u01/app/oracle-product/11.2.0/EE/bin/sqlplus ODS/ODS @/tmp/ddl_ods_seq.sql > /tmp/ddl_ods_seq.out2"
docker cp oracle:/tmp/ddl_ods_seq.out2 ./sqlplus-out/ODS/ddl_ods_seq.out2

docker exec oracle /bin/bash -c "/u01/app/oracle-product/11.2.0/EE/bin/sqlplus ODS/ODS @/tmp/ddl_ods_procs.sql > /tmp/ddl_ods_procs.out2"
docker cp oracle:/tmp/ddl_ods_procs.out2 ./sqlplus-out/ODS/ddl_ods_procs.out2

docker exec oracle /bin/bash -c "/u01/app/oracle-product/11.2.0/EE/bin/sqlplus ODS/ODS @/tmp/ddl_ods_functions.sql > /tmp/ddl_ods_functions.out2"
docker cp oracle:/tmp/ddl_ods_functions.out2 ./sqlplus-out/ODS/ddl_ods_functions.out2

docker exec oracle /bin/bash -c "/u01/app/oracle-product/11.2.0/EE/bin/sqlplus ODS/ODS @/tmp/ddl_ods_packages.sql > /tmp/ddl_ods_packages.out2"
docker cp oracle:/tmp/ddl_ods_packages.out2 ./sqlplus-out/ODS/ddl_ods_packages.out2

docker cp ./src/main/db/ODS/ddl_ods_types.sql oracle:/tmp/ddl_ods_grants.sql
docker exec oracle /bin/bash -c "/u01/app/oracle-product/11.2.0/EE/bin/sqlplus ODS/ODS @/tmp/ddl_ods_grants.sql > /tmp/ddl_ods_grants.out
docker cp oracle:/tmp/ddl_ods_grants.out ./sqlplus-out/ODS/ddl_ods_grants.out

mkdir sqlplus-out/INCV

docker cp ./src/main/db/INCV/ddl_incv_types.sql oracle:/tmp/ddl_incv_types.sql
docker exec oracle /bin/bash -c "/u01/app/oracle-product/11.2.0/EE/bin/sqlplus INCV/INCV @/tmp/ddl_incv_types.sql > /tmp/ddl_incv_types.out1"
docker cp oracle:/tmp/ddl_incv_types.out1 ./sqlplus-out/INCV/ddl_incv_types.out1

docker cp ./src/main/db/INCV/ddl_incv_tables.sql oracle:/tmp/ddl_incv_tables.sql
docker exec oracle /bin/bash -c "/u01/app/oracle-product/11.2.0/EE/bin/sqlplus INCV/INCV @/tmp/ddl_incv_tables.sql > /tmp/ddl_incv_tables.out1"
docker cp oracle:/tmp/ddl_incv_tables.out1 ./sqlplus-out/INCV/ddl_incv_tables.out1

docker cp ./src/main/db/INCV/ddl_incv_seq.sql oracle:/tmp/ddl_incv_seq.sql
docker exec oracle /bin/bash -c "/u01/app/oracle-product/11.2.0/EE/bin/sqlplus INCV/INCV @/tmp/ddl_incv_seq.sql > /tmp/ddl_incv_seq.out1"
docker cp oracle:/tmp/ddl_incv_seq.out1 ./sqlplus-out/INCV/ddl_incv_seq.out1

docker cp ./src/main/db/INCV/ddl_incv_packages.sql oracle:/tmp/ddl_incv_packages.sql
docker exec oracle /bin/bash -c "/u01/app/oracle-product/11.2.0/EE/bin/sqlplus INCV/INCV @/tmp/ddl_incv_packages.sql > /tmp/ddl_incv_packages.out1"
docker cp oracle:/tmp/ddl_incv_packages.out1 ./sqlplus-out/INCV/ddl_incv_packages.out1

docker cp ./src/main/db/INCV/ddl_incv_procedures.sql oracle:/tmp/ddl_incv_procedures.sql
docker exec oracle /bin/bash -c "/u01/app/oracle-product/11.2.0/EE/bin/sqlplus INCV/INCV @/tmp/ddl_incv_procedures.sql > /tmp/ddl_incv_procedures.out1"
docker cp oracle:/tmp/ddl_incv_procedures.out1 ./sqlplus-out/INCV/ddl_incv_procedures.out1

docker cp ./src/main/db/INCV/ddl_incv_views.sql oracle:/tmp/ddl_incv_views.sql
docker exec oracle /bin/bash -c "/u01/app/oracle-product/11.2.0/EE/bin/sqlplus INCV/INCV @/tmp/ddl_incv_views.sql > /tmp/ddl_incv_views.out1"
docker cp oracle:/tmp/ddl_incv_views.out1 ./sqlplus-out/INCV/ddl_incv_views.out1

docker exec oracle /bin/bash -c "/u01/app/oracle-product/11.2.0/EE/bin/sqlplus INCV/INCV @/tmp/ddl_incv_types.sql > /tmp/ddl_incv_types.out2"
docker cp oracle:/tmp/ddl_incv_types.out2 ./sqlplus-out/INCV/ddl_incv_types.out2

docker exec oracle /bin/bash -c "/u01/app/oracle-product/11.2.0/EE/bin/sqlplus INCV/INCV @/tmp/ddl_incv_tables.sql > /tmp/ddl_incv_tables.out2"
docker cp oracle:/tmp/ddl_incv_tables.out2 ./sqlplus-out/INCV/ddl_incv_tables.out2

docker exec oracle /bin/bash -c "/u01/app/oracle-product/11.2.0/EE/bin/sqlplus INCV/INCV @/tmp/ddl_incv_seq.sql > /tmp/ddl_incv_seq.out2"
docker cp oracle:/tmp/ddl_incv_seq.out2 ./sqlplus-out/INCV/ddl_incv_seq.out2

docker exec oracle /bin/bash -c "/u01/app/oracle-product/11.2.0/EE/bin/sqlplus INCV/INCV @/tmp/ddl_incv_packages.sql > /tmp/ddl_incv_packages.out2"
docker cp oracle:/tmp/ddl_incv_packages.out2 ./sqlplus-out/INCV/ddl_incv_packages.out2

docker exec oracle /bin/bash -c "/u01/app/oracle-product/11.2.0/EE/bin/sqlplus INCV/INCV @/tmp/ddl_incv_procedures.sql > /tmp/ddl_incv_procedures.out2"
docker cp oracle:/tmp/ddl_incv_procedures.out2 ./sqlplus-out/INCV/ddl_incv_procedures.out2

docker exec oracle /bin/bash -c "/u01/app/oracle-product/11.2.0/EE/bin/sqlplus INCV/INCV @/tmp/ddl_incv_views.sql > /tmp/ddl_incv_views.out2"
docker cp oracle:/tmp/ddl_incv_views.out2 ./sqlplus-out/INCV/ddl_incv_views.out2

date
#
## the way we should be doing this...
##echo "Build the liquibase.properties file for Liquibase to run against"
##echo "driver: oracle.jdbc.driver.OracleDriver" > liquibase.properties
##echo "classpath: lib/ojdbc8.jar" >> liquibase.properties
##echo "url: jdbc:oracle:thin:@"$(hostname)":1521:EE" >> liquibase.properties
##echo "username: system" >> liquibase.properties
##echo "password: oracle" >> liquibase.properties
#
##echo "Create database schema and load sample data"
##liquibase --changeLogFile=src/main/db/changelog.xml update

figlet -f slant -w 160 "Load Incentives Data"

docker cp ./src/test/db/ODS/dml_ods_setup.sql oracle:/tmp/dml_ods_setup.sql
docker exec oracle /bin/bash -c "/u01/app/oracle-product/11.2.0/EE/bin/sqlplus INCV/INCV @/tmp/dml_ods_setup.sql > /tmp/dml_ods_setup.out"
docker cp oracle:/tmp/dml_ods_setup.out ./sqlplus-out/ODS/dml_ods_setup.out

docker cp ./src/test/db/INCV/dml_incv_setup.sql oracle:/tmp/dml_incv_setup.sql
docker exec oracle /bin/bash -c "/u01/app/oracle-product/11.2.0/EE/bin/sqlplus INCV/INCV @/tmp/dml_incv_setup.sql > /tmp/dml_incv_setup.out"
docker cp oracle:/tmp/dml_incv_setup.out ./sqlplus-out/INCV/dml_incv_setup.out

docker cp ./src/test/db/ODS/dml_ods_member.sql oracle:/tmp/dml_ods_member.sql
docker exec oracle /bin/bash -c "/u01/app/oracle-product/11.2.0/EE/bin/sqlplus INCV/INCV @/tmp/dml_ods_member.sql > /tmp/dml_ods_member.out"
docker cp oracle:/tmp/dml_ods_member.out ./sqlplus-out/ODS/dml_ods_member.out

docker cp ./src/test/db/INCV/dml_incv_program_setup.sql oracle:/tmp/dml_incv_program_setup.sql
docker exec oracle /bin/bash -c "/u01/app/oracle-product/11.2.0/EE/bin/sqlplus INCV/INCV @/tmp/dml_incv_program_setup.sql > /tmp/dml_incv_program_setup.out"
docker cp oracle:/tmp/dml_incv_program_setup.out ./sqlplus-out/INCV/dml_incv_program_setup.out
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