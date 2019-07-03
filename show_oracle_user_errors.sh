#!/usr/bin/env bash

#toally hackful - having trouble reliably running sqlplus on OSX
export ORACLE_BASE=/usr/local/Oracle
export ORACLE_HOME=$ORACLE_BASE/product/instantclient/11.2.0.4.0
export DYLD_LIBRARY_PATH=$ORACLE_HOME/lib
export TNS_ADMIN=$ORACLE_BASE/admin/network

sqlplus INCV/INCV@$(hostname):1521/EE.oracle.docker < show_oracle_user_errors.sql
