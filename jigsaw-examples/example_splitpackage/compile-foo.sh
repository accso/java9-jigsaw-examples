. ../env.sh

mkdir -p mods
mkdir -p mlib 

# does not compile
echo "javac $JAVAC_OPTIONS  -d mods --module-path mlib --module-source-path src \$(find src/*foo* -name \"*.java\")"
$JAVA_HOME/bin/javac $JAVAC_OPTIONS  -d mods --module-path mlib --module-source-path src $(find src/*foo* -name "*.java") 2>&1

# as it does not compile anyway, the creation of the JAR file will not work
#pushd mods > /dev/null 2>&1
#for dir in *foo*/; 
#do
#    MODDIR=${dir%*/}
#    echo "jar $JAR_OPTIONS --create --file=../mlib/${MODDIR}.jar -C ${MODDIR} ."
#    $JAVA_HOME/bin/jar $JAR_OPTIONS --create --file=../mlib/${MODDIR}.jar -C ${MODDIR} . 2>&1
#done
#popd >/dev/null 2>&1
