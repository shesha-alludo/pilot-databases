#!/bin/bash
echo "#!/bin/bash" > ./bin/lb_prep.sh
for lbpf in ./conf/*/*/liquibase.properties
do
       export db_conf_home=`echo $lbpf|awk  -F"/" '{print "./"$2"/"$3"/"$4}'`
       echo $db_conf_home
       echo "./liquibase/liquibase --defaults-file=$lbpf --changeLogFile=$db_conf_home/changelog.xml --log-level=info updateSQL" >> ./bin/lb_prep.sh

done
cat ./bin/lb_prep.sh
