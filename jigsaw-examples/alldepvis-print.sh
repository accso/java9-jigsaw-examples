depvisprint() {
    MODDIR=${dir%*/}
    pushd ${MODDIR} > /dev/null 2>&1
    if [ -f ./depvis-print.sh ] 
    then 
        echo "###################################################################################################################################"
        echo "Creating DepVis print output for ${MODDIR}"
        . ./depvis-print.sh
    fi
    popd >/dev/null 2>&1 
    echo " "
}

for dir in example_*/; 
do
    depvisprint
done
