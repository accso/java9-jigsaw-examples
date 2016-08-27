. ../env.sh

mkdir -p mods
mkdir -p patches
mkdir -p mlib
mkdir -p patchlib 

echo "javac -d mods --module-path amlib\;mlib -modulesourcepath src \$(find src -name \"*.java\" | grep -v modtest.whitebox)"
$JAVA_HOME/bin/javac -d mods --module-path amlib\;mlib -modulesourcepath src $(find src -name "*.java" | grep -v modtest.whitebox)

pushd mods > /dev/null 2>&1
for dir in */; 
do
    MODDIR=${dir%*/}
    echo "jar --create --file=../mlib/${MODDIR}.jar -C ${MODDIR} ."
    $JAVA_HOME/bin/jar --create --file=../mlib/${MODDIR}.jar -C ${MODDIR} .
done
popd >/dev/null 2>&1
