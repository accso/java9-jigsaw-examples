clean() {
    MODDIR=${dir%*/}
    pushd ${MODDIR} > /dev/null 2>&1
    if [ -f ./clean.sh ] 
    then 
        echo "###################################################################################################################################"
        echo "Cleaning ${MODDIR}"
        sh ./clean.sh
    fi
    popd >/dev/null 2>&1 
    echo " "
}

for dir in example_*/; 
do
    clean
done
