run() {
    MODDIR=${dir%*/}
    pushd ${MODDIR} > /dev/null 2>&1
    # if any run*.sh script exists
    if  ls run*.sh > /dev/null 2>&1 ; then
        echo "###################################################################################################################################"
        for runscript in run*.sh 
        do
            echo "Running ${MODDIR}: ${runscript}"
            sh ${runscript}
        done
    fi
    popd >/dev/null 2>&1 
    echo " "
}

for dir in example_*/; 
do
    run
done
