. ../env.sh

echo "javac -d mods --module-path mlib -modulesourcepath src \$(find src -name \"*.java\")"
$JAVA_HOME/bin/javac -d mods --module-path mlib -modulesourcepath src $(find src -name "*.java")

# copy properties to mods dir (so that they are found for the JAR creation)
pushd src > /dev/null 2>&1
for dir in */; 
do
  find ${dir} -name '*.properties' | grep -v '/bin/' | xargs -i cp -v {} ../mods/${dir}
done
popd >/dev/null 2>&1

pushd mods > /dev/null 2>&1
for dir in */; 
do
    MODDIR=${dir%*/}
    echo "jar --create --file=../mlib/${MODDIR}.jar -C ${MODDIR} ."
    $JAVA_HOME/bin/jar --create --file=../mlib/${MODDIR}.jar -C ${MODDIR} .
done
popd >/dev/null 2>&1
