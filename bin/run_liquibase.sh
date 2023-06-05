#!/bin/bash
echo "#!/bin/bash" > ./bin/lb_prep.sh
for lbpf in ./conf/*/*/liquibase.properties
do
        export db_conf_home=echo $lbpf|awk  -F"/" '{"1/$2/$3"}'
        echo $db_conf_home
        echo "./liquibase/liquibase --defaults-file=$lbpf --changeLogFile=$db_conf_home/changelog.xml --log-level=debug updateSQL" >> ./bin/lb_prep.sh
done
cat ./bin/lb_prep.sh
