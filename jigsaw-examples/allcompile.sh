compile() {
    MODDIR=${dir%*/}
    pushd ${MODDIR} > /dev/null 2>&1
    if [ -f ./compile.sh ] 
    then 
        echo "###################################################################################################################################"
        echo "Compiling ${MODDIR}"
        . ./compile.sh
    fi
    popd >/dev/null 2>&1 
    echo " "
}

for dir in example_*/; 
do
    compile
done
