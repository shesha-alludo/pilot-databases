#!/bin/bash
set -euo pipefail

#. bin/populate-snowflake-properties

JAVA_CMD=""
if [ -z ${JAVA_HOME+""} ];
then
    echo "Using JAVA_HOME: $JAVA_HOME"
    JAVA_CMD=$JAVA_HOME/bin/java
else
    echo "Using default java"
    JAVA_CMD=java
fi

liquibase --defaults-file=./conf/postgres/postgres/liquibase.properties --changeLogFile=./conf/postgres/postgres/changelog.xml --log-level=debug updateSQL

if [ ${#} -eq 0 ]
then
	echo "Success: Liquibase Execution"
else
	echo "Failed: Liquibase Execution"
	echo "Release Liquibase Lock"
	./liquibase/liquibase --defaults-file=./conf/postgress/liquibase.properties releaseLocks
	exit 1 # wrong args
fi
