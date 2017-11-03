. ../env.sh

mkdir -p mods
mkdir -p mlib
 
# compile modc
echo "javac $JAVAC_OPTIONS  -d mods --module-path mlib --module-source-path src \$(find src/modc -name \"*.java\")"
$JAVA_HOME/bin/javac $JAVAC_OPTIONS  -d mods \
    --module-path mlib --module-source-path src $(find src/modc -name "*.java") \
    2>&1 
      
# compile modb (add-read from modb -> modc)
# Note that the --add-reads options are not necessary for compile (but they *are* necessary for running): --add-modules implicitely enforces --add-reads
echo "javac $JAVAC_OPTIONS  -d mods --add-modules modc --add-reads modb=modc --add-exports modc/pkgc=modb --module-path mlib --module-source-path src $(find src/modb -name \"*.java\")"
$JAVA_HOME/bin/javac $JAVAC_OPTIONS  -d mods \
    --add-modules modc \
    --add-reads modb=modc \
    --add-exports modc/pkgc=modb \
    --module-path mlib \
    --module-source-path src $(find src/modb -name "*.java") \
    2>&1 

# compile modmain: (add-read from modb -> modc , and add-export of modb/pkgb -> modmain)
# Note that the --add-reads options are not necessary for compile (but they *are* necessary for running): --add-modules implicitely enforces --add-reads
echo "javac $JAVAC_OPTIONS  -d mods --add-modules modb,modc --add-reads modb=modc --add-exports modb/pkgb=modmain --add-exports modc/pkgc=modb --module-path mlib --module-source-path src $(find src/modmain -name \"*.java\")"
$JAVA_HOME/bin/javac $JAVAC_OPTIONS  -d mods \
    --add-modules modb,modc \
    --add-reads modmain=modb \
    --add-reads modb=modc \
    --add-exports modb/pkgb=modmain \
    --add-exports modc/pkgc=modb \
    --module-path mlib \
    --module-source-path src $(find src/modmain -name "*.java") \
    2>&1 

pushd mods > /dev/null 2>&1
for dir in */; 
do
    MODDIR=${dir%*/}
    echo "jar $JAR_OPTIONS --create --file=../mlib/${MODDIR}.jar -C ${MODDIR} ."
    $JAVA_HOME/bin/jar $JAR_OPTIONS --create --file=../mlib/${MODDIR}.jar -C ${MODDIR} . 2>&1 
done
popd >/dev/null 2>&1
