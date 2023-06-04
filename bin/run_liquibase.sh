#!/bin/bash
echo "#!/bin/bash" > ./bin/lb_prep.sh
for lbpf in ./conf/*/*/liquibase.properties
do
        echo "liquibase --defaults-file=.$lbpf --changeLogFile=.$lbpf/../changelog.xml --log-level=debug updateSQL" >> ./bin/lb_prep.sh
done
cat ./bin/lb_prep.sh
