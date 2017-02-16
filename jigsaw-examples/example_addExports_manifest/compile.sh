. ../env.sh

mkdir -p mods
mkdir -p mlib

# compile modmain: (add-read from modb -> modc , and add-export of modb/pkgb -> modmain)
echo "javac -Xlint -d mods --module-path mlib --module-source-path src $(find src/modmain -name \"*.java\")"
$JAVA_HOME/bin/javac -Xlint -d mods \
    --module-path mlib \
    --add-exports java.base/jdk.internal.misc=modmain \
    --module-source-path src $(find src/modmain -name "*.java")

pushd mods > /dev/null 2>&1
for dir in */; 
do
    MODDIR=${dir%*/}
    if [ -f "../src/${MODDIR}/META-INF/MANIFEST.MF" ]; then
      echo "jar --create --manifest=../src/${MODDIR}/META-INF/MANIFEST.MF --file=../mlib/${MODDIR}.jar -C ${MODDIR} ."
      $JAVA_HOME/bin/jar --create --manifest=../src/${MODDIR}/META-INF/MANIFEST.MF --file=../mlib/${MODDIR}.jar -C ${MODDIR} .
    else
      echo "jar --create --file=../mlib/${MODDIR}.jar -C ${MODDIR} ."
      $JAVA_HOME/bin/jar --create --file=../mlib/${MODDIR}.jar -C ${MODDIR} .
    fi
done
popd >/dev/null 2>&1
