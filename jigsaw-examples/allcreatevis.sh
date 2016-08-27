createvis() {
    MODDIR=${dir%*/}
    pushd ${MODDIR} > /dev/null 2>&1
    if [ -f ./createvis.sh ] 
    then 
        echo "###################################################################################################################################"
        echo "Creating graph visualization for ${MODDIR}"
        sh ./createvis.sh
    fi
    popd >/dev/null 2>&1 
    echo " "
}

for dir in example_*/; 
do
    createvis
done
