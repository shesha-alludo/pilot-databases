#!/bin/bash

echo "Preparing Liquibase Properties for DB Engine - $2 and DB Name - $3 in path $1"

echo driver: ${DB_DRIVER}	 	    > $1
echo url: ${DB_JDBC_URL} 		    > $1
echo username: ${DB_USERNAME} 	> $1
echo password: ${DB_PASSWORD} 	> $1
echo liquibaseSchemaName=public > $1
