#!/bin/bash

echo "Preparing Liquibase Properties for DB Engine - $1 and DB Name - $2"

echo driver: ${DB_DRIVER}	 	    > ./conf/$1/$2/liquibase.properties
echo url: ${DB_JDBC_URL} 		    > ./conf/$1/$2/liquibase.properties
echo username: ${DB_USERNAME} 	> ./conf/$1/$2/liquibase.properties
echo password: ${DB_PASSWORD} 	> ./conf/$1/$2/liquibase.properties
echo liquibaseSchemaName=public 		    > ./conf/$1/$2/liquibase.properties
