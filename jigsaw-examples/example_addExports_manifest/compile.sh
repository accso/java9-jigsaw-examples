. ../env.sh

mkdir -p mods
mkdir -p mlib

# compile moda
echo "javac -Xlint -d mods --module-path mlib --module-source-path src $(find src/moda -name \"*.java\")"
$JAVA_HOME/bin/javac -Xlint -d mods \
    --module-path mlib \
    --module-source-path src $(find src/moda -name "*.java")

# create JAR file moda.jar
pushd mods > /dev/null 2>&1
MODDIR=moda
if [ -f "../src/${MODDIR}/META-INF/MANIFEST.MF" ]; then
  echo "jar --create --manifest=../src/${MODDIR}/META-INF/MANIFEST.MF --file=../mlib/${MODDIR}.jar -C ${MODDIR} ."
  $JAVA_HOME/bin/jar --create --manifest=../src/${MODDIR}/META-INF/MANIFEST.MF --file=../mlib/${MODDIR}.jar -C ${MODDIR} .
else
  echo "jar --create --file=../mlib/${MODDIR}.jar -C ${MODDIR} ."
  $JAVA_HOME/bin/jar --create --file=../mlib/${MODDIR}.jar -C ${MODDIR} .
fi
popd >/dev/null 2>&1

# compile modmain
echo "javac -Xlint -d mods --module-path mlib --module-source-path src $(find src/modmain -name \"*.java\")"
$JAVA_HOME/bin/javac -Xlint -d mods \
    --module-path mlib \
    --add-exports java.base/jdk.internal.misc=modmain \
    --add-exports moda/pkgainternal=modmain \
    --module-source-path src $(find src/modmain -name "*.java")

# create JAR file modmain.jar
pushd mods > /dev/null 2>&1
MODDIR=modmain
if [ -f "../src/${MODDIR}/META-INF/MANIFEST.MF" ]; then
  echo "jar --create --manifest=../src/${MODDIR}/META-INF/MANIFEST.MF --file=../mlib/${MODDIR}.jar -C ${MODDIR} ."
  $JAVA_HOME/bin/jar --create --manifest=../src/${MODDIR}/META-INF/MANIFEST.MF --file=../mlib/${MODDIR}.jar -C ${MODDIR} .
else
  echo "jar --create --file=../mlib/${MODDIR}.jar -C ${MODDIR} ."
  $JAVA_HOME/bin/jar --create --file=../mlib/${MODDIR}.jar -C ${MODDIR} .
fi
popd >/dev/null 2>&1
