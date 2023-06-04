#!/bin/bash

echo "Preparing Liquibase Properties for DB Engine - $2 and DB Name - $3 in path $1"

export secret_id="dev/aurora-pg/pg1/postgres"

function sk {
PYTHON_ARG="$1" python - <<END
import os
import boto3
import json

client = boto3.client('secretsmanager')
response = client.get_secret_value(SecretId=os.getenv('secret_id'))
secret_value = response['SecretString']
secrets = json.loads(secret_value)
skv = os.environ['PYTHON_ARG']
return secrets['skv']
END
}

engine = sk "engine"
dbInstanceIdentifier = sk "dbInstanceIdentifier"
dbname = sk "dbname"
host = "jdbc:postgresql://"+sk "host"+":5432/postgres"
username = sk "username"
password = sk "password"

temp_fn = secrets['engine']+"_"+secrets['dbInstanceIdentifier']+"_"+secrets['dbname']+".tmp"
file = open(temp_fn,"w")

L = ["driver: org.postgresql.Driver\n","url: "+ host +"\n","username: "+ username  +"\n","password: "+ password +"\n"]
file.writelines(L)
file.close()

os.environ['DB_DRIVER'] = 'org.postgresql.Driver'
os.environ['DB_JDBC_URL'] = secrets['host']
os.environ['DB_USERNAME'] = secrets['username']
os.environ['DB_PASSWORD'] = secrets['password']
EOF
ls *.tmp
pwd
cat postgres_pg-instance-1_pg1_dev.tmp

echo driver: ${DB_DRIVER}	 	    > $1
echo url: ${DB_JDBC_URL} 		    >> $1
echo username: ${DB_USERNAME} 	>> $1
echo password: ${DB_PASSWORD} 	>> $1
echo liquibaseSchemaName=public >> $1
cat $1
