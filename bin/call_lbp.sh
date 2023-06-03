#!/bin/bash
echo "#!/bin/bash" > exec_lbp.sh
for lbpf in ./conf/*/*/liquibase.properties
do
        echo $lbpf|awk  -F"/" '{print "./bin/populate_liquibase_properties.sh " $3" "$4}' >> exec_lbp.sh

done
