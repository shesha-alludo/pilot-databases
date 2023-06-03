#!/bin/bash
echo "#!/bin/bash" > ./bin/exec_lbp.sh
for lbpf in ./conf/*/*/liquibase.properties
do
        echo $lbpf|awk  -F"/" '{print "./bin/populate_liquibase_properties.sh "$lbpf" "$3" "$4}' >> ./bin/exec_lbp.sh

done
