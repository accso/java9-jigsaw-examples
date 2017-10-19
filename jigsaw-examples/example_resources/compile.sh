. ../env.sh

mkdir -p mods
mkdir -p mlib 

echo "javac $JAVAC_OPTIONS  -d mods --module-path mlib --module-source-path src \$(find src -name \"*.java\")"
$JAVA_HOME/bin/javac $JAVAC_OPTIONS  -d mods --module-path mlib --module-source-path src $(find src -name "*.java")

# copy properties to mods dir (so that they are found for the JAR creation)
#pushd src > /dev/null 2>&1
#for dir in */; 
#do
#  find ${dir} -name '*.properties' | grep -v '/target/' | xargs -i cp -v {} ../mods/${dir}
#done
#popd >/dev/null 2>&1

pushd src > /dev/null 2>&1
for dir in */; 
do
  pushd ${dir} > /dev/null 2>&1
  find . -name '*.properties' | grep -v '/target/' | xargs -i cp --parents -v {} ../../mods/${dir}
  popd > /dev/null 2>&1
done
popd >/dev/null 2>&1


pushd mods > /dev/null 2>&1
for dir in */; 
do
    MODDIR=${dir%*/}
    echo "jar $JAR_OPTIONS --create --file=../mlib/${MODDIR}.jar -C ${MODDIR} ."
    $JAVA_HOME/bin/jar $JAR_OPTIONS --create --file=../mlib/${MODDIR}.jar -C ${MODDIR} .
done
popd >/dev/null 2>&1
