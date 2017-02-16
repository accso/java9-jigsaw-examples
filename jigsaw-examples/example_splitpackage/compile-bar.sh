. ../env.sh

mkdir -p mods
mkdir -p mlib 

echo "javac -Xlint -d mods --module-path mlib --module-source-path src \$(find src/*bar* -name \"*.java\")"
$JAVA_HOME/bin/javac -Xlint -d mods --module-path mlib --module-source-path src $(find src/*bar* -name "*.java")

pushd mods > /dev/null 2>&1
for dir in *bar*/; 
do
    MODDIR=${dir%*/}
    echo "jar --create --file=../mlib/${MODDIR}.jar -C ${MODDIR} ."
    $JAVA_HOME/bin/jar --create --file=../mlib/${MODDIR}.jar -C ${MODDIR} .
done
popd >/dev/null 2>&1
