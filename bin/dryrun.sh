#!/bin/bash
set -euo pipefail

. bin/populate_liquibase_properties.sh $1 $2

liquibase --defaults-file=${LIQUIBASE_PROPERTIES} --changeLogFile=${CHANGELOG} --log-level=info updateSQL

if [ ${#} -eq 0 ]
then
	echo "Success: Liquibase Execution"
else
	echo "Failed: Liquibase Execution"
	echo "Release Liquibase Lock"
	./liquibase/liquibase --defaults-file=${LIQUIBASE_PROPERTIES} releaseLocks
	exit 1 # wrong args
fi
