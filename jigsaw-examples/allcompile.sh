compile() {
    MODDIR=${dir%*/}
    pushd ${MODDIR} > /dev/null 2>&1
    if [ -f ./compile.sh ] 
    then 
        echo "###################################################################################################################################"
        echo "Compiling ${MODDIR}"
        . ./compile.sh
        echo " "
    fi
    popd >/dev/null 2>&1 
}

. ./env.sh
$JAVA_HOME/bin/java --version

for dir in example_*/; 
do
    compile
done
