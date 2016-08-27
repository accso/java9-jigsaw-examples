. ../env.sh

# does not compile
echo "javac -d mods --module-path mlib -modulesourcepath src \$(find src/*foo* -name \"*.java\")"
$JAVA_HOME/bin/javac -d mods --module-path mlib -modulesourcepath src $(find src/*foo* -name "*.java")

# as it does not compile anyway, the creation of the JAR file will not work
#pushd mods > /dev/null 2>&1
#for dir in *foo*/; 
#do
#    MODDIR=${dir%*/}
#    echo "jar --create --file=../mlib/${MODDIR}.jar -C ${MODDIR} ."
#    $JAVA_HOME/bin/jar --create --file=../mlib/${MODDIR}.jar -C ${MODDIR} .
#done
#popd >/dev/null 2>&1
