. ../env.sh

$JAVA_HOME/bin/java --version

for dir in mlib amlib1 amlib2 amlib3 amlib4
do
    pushd ${dir} > /dev/null 2>&1
    for JAR in `ls *.jar`
    do
        echo "JAR-file: ${JAR} in ${dir}"
        
        # get name of JAR-file
        MOD=`basename ${JAR} | sed s/'.jar'//g | sed s/'-'/'.'/g | cut -d '.' -f 1-2`
    
        echo "java --module-path . --module ${MOD}/pkgmain.Main"
        $JAVA_HOME/bin/java --module-path . --module ${MOD}/pkgmain.Main  2>&1 | myecho
    
        echo " "
    done
popd > /dev/null 2>&1
done