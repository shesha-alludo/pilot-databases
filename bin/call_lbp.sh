#!/bin/bash
for lbpf in ./conf/*/*/liquibase.properties
do
        echo $lbpf|awk  -F"/" '{print "./bin/populate_liquibase_properties.sh " $3" "$4}'

done
