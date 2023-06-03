#!/bin/bash

echo driver: ${DB_DRIVER}	 	    > ./conf/$1/$2/liquibase.properties
echo url: ${DB_JDBC_URL} 		    > ./conf/$1/$2/liquibase.properties
echo username: ${DB_USERNAME} 	> ./conf/$1/$2/liquibase.properties
echo password: ${DB_PASSWORD} 	> ./conf/$1/$2/liquibase.properties
echo liquibaseSchemaName=public 		    > ./conf/$1/$2/liquibase.properties
