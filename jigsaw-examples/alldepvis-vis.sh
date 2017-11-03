depvisvis() {
    MODDIR=${dir%*/}
    pushd ${MODDIR} > /dev/null 2>&1
    if [ -f ./depvis-vis.sh ] 
    then 
        echo "###################################################################################################################################"
        echo "Creating DepVis visualization output for ${MODDIR}"
        . ./depvis-vis.sh
        echo " "
    fi
    popd >/dev/null 2>&1 
}

for dir in example_*/; 
do
    depvisvis
done
