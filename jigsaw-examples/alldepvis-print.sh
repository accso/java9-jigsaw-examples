depvisprint() {
    MODDIR=${dir%*/}
    pushd ${MODDIR} > /dev/null 2>&1
    if [ -f ./depvis-print.sh ] 
    then 
        echo "###################################################################################################################################"
        echo "Creating DepVis print output for ${MODDIR}"
        . ./depvis-print.sh
        echo " "
    fi
    popd >/dev/null 2>&1 
}

for dir in example_*/; 
do
    depvisprint
done
