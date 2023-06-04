#!/bin/bash

echo "Preparing Liquibase Properties for DB Engine - $2 and DB Name - $3 in path $1"

export secret_id="dev/aurora-pg/pg1/postgres"

python ./bin/get_secrets.py $1 $secret_id

cat $1
