. ../env.sh

for dir in mlib amlib1 amlib2 amlib3 amlib4
do
    pushd ${dir} > /dev/null 2>&1
    for JAR in `ls *.jar`
    do
        echo "JAR-file: ${JAR}"
        
        # get name of JAR-file
        MOD=`basename ${JAR} | sed s/'.jar'//g | sed s/'-'/'.'/g | cut -d '.' -f 1-2`
    
        echo "java --module-path . -m ${MOD}/pkgmain.Main"
        $JAVA_HOME/bin/java --module-path . -m ${MOD}/pkgmain.Main | myecho
    
        echo " "
    done
popd > /dev/null 2>&1
done