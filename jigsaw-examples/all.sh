all() {
    MODDIR=${dir%*/}
    pushd ${MODDIR} > /dev/null 2>&1
    if [ -f ./all.sh ] 
    then 
        echo "###################################################################################################################################"
        echo "All in ${MODDIR}"
        . ./all.sh
    fi
    popd >/dev/null 2>&1 
    echo " "
}

for dir in example_*/; 
do
    all
done
