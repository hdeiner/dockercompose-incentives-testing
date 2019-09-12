This project puts a stake in the ground to demonstrate that Incentives can develop Java code, and test it in Tomcat against a real Oracle database, all by using Docker containers.

In terms of what you need to run this project, here's my best guesses:
1. There are no platform dependencies other than a Linux like environment that can execute bash scripts.  I did this development on macOS Mojave, but I'm sure that Ubuntu would work just as well.  I always develop within a virtual machine so I can destroy and recreate my environment when needed should development installs "muck stuff up".  I happen to use the IntelliJ IDE, but that is a personal preference.
2. Docker CE must be installed.
3. Oracle SQL*Plus must be installed.  I am using SQL*Plus: Release 11.2.0.4.0.
4. Oracle SQLDeveloper is useful for debugging.  I am using version 19.1.0.094.
5. The bash scripts make use of figlet to pretty things up. 

#### Prerequisites
* figlet
* java 8 (used AdaptOpenJDK)
* maven (used 3.6.1)
* docker desktop for mac (or based on the platform)
* IDE - Visual Studio Code or Intellij (optional, for development/debugging)
* SQLPlus (optional)
* Oracel SQL Developer (optional, for development/debugging)

Basic theory of operation.  Bash scripts used to implement the workflow of a developer doing incentives development.
1. build_1_run_unit_tests.sh is what is used when unit tests and theire code is being put together.  Since unit tests are, by definition, independent of dependencies such as databases, they can be run and checked quickly many times.
2. build_2_create_oracle_incentives_database_image.sh is used to create an Oracle 11g EE Oracle database image.  The DDL for the database schema is also based in here, but a case could be made that this is better done in the run_integration_tests script.  The idea of baking an image is that there is extraordinary work done by Oracle on first time startup.  By saving this image, we save around 8 minutes when we take the image and create a container from it, which will be done MUCH more often.
3. build_3_create_tomcat_incentives_image is actually not being used right now for much.  The reason for its existence is political.  There is concern that if we were to use the Apache supplied and supported image and create containers from it, deploy wars in it, and save this container as an image, that it would not be viewed as "containerizing" the application.  In the future, this script will probably not be used starting from a Dockerfile, but done by docker commit, saving the container (with its deployed application) as an image.
4. build_4_create_integration_test_environment_using_sqlplus.sh dockercomposes the images for the database and applicaiton server into containers that can talk to one another.  It starts by tearing down any dockercompose currently running, as it is anticipated that developers will use the build_4_create_integration_test_environment anytime a database change is made and build_5_run_integration_tests even more frequently, as code changes are made.  The script creates the dockercompose environment (with a fresh Oracle), inserts the schema and inserts the data.  
5. build_5_run_integration_tests creates the final deployment war, deploys the tomcat application, runs a smoke test, and will then run the integration test suite.
6. build_6_destroy_integration_test_environment destroys the containers used, as well as cleans up debris files left around.

```bash
./build_1_run_unit_tests.sh
```
1. NOT FUNCTIONAL YET.  We are starting with a war created elsewhere for now, not building the war from scratch (as we should).

```bash
./build_2_create_integration_test_environment.sh
```
1. Docker-compose containers for Oracle and Tomcat to life.
2. Wait appropriately for the containers to start and be ready for operations.
3. NOTE: this project used a Docker imaage for Oracle 11g EE called howarddeiner/oracle-11g-ee, which is built in another project.
4. This script took 8.5 minutes to run on my laptop inside a MacOS Mojave virtual machine running inside my MacOS Mojave host.  Based on the logs, the vast najority of the time was spent on Oracle specific and opaque "Creating and starting Oracle instance" and "Completing Database Creation" tasks.

```bash
./build_3_create_tomcat_incentives_image.sh
```
1. This will eventually be where we Dockerfile create Docker images with appropriate wars baked into them.
2. For now, we build a tomcat:7.0.94-jre7 image with custom tomcat-users baked in, so we can use the Tomcat Manager. 

```bash
./build_4_provision_database.sh
```
1. We have some misshapen DDL/DML scipts in src/main/db/ODS which must be run through SQL*Plus to work as of now.
2. We should review the ".out" files that get created to ensure that things go well.
3. It was necessary to run the scripts twice to get around circular dependencies in the creation process.  We must learn how to create a database from first principles!
4. THIS IS NOT ACCEPTABLE, BUT IT IS A START.  

```bash
./build_5_run_integration_tests.sh
```
1. We are starting with a pre-compiled war and preset properties (incentivesweb-2019.04-SNAPSHOT.war, datasource.properties, incentives.properties, infrastructure.properties)
2. The following: https://incentives.azqa2.ahmcert.com/incentivesweb/incentives/en/memberPlan/121938900?processingDate=2019-04-19
3. Becomes: curl localhost:8080/incentivesweb-2019.04-SNAPSHOT/incentives/en/memberPlan/121938900?processingDate=2019-04-19

```bash
./build_6_destroy_integration_test_environment.sh
```
1. Docker-compose away the containers we built.
2. Delete the temporary files we created during the run that facilitated the integration of components.
