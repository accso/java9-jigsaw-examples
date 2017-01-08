. ../env.sh

mkdir -p mods
mkdir -p mlib 

mkdir -p amlib 
cp -f src/mod.main/lib/javax.json-1.0.4.jar amlib/

# Compile the mod.x* modules first (separate as they do not compile together with mod.main because of their split package problem,
#    which is caused by the mod.main using the automatic module amlib/javax.json -> has an automatic reads relationship to all modules
#    hence causing this stupid compile problem)
for modx in mod.x_bottom mod.x_middle mod.x_top
do
   echo "javac -d mods --module-path mlib${PATH_SEPARATOR}amlib --module-source-path src \$(find src/${modx} -name \"*.java\")"
   $JAVA_HOME/bin/javac -d mods --module-path mlib${PATH_SEPARATOR}amlib --module-source-path src $(find src/${modx} -name "*.java")
done

# Compile the rest
echo "javac -d mods --module-path mlib${PATH_SEPARATOR}amlib --module-source-path src \$(find src -name \"*.java\" | grep -v mod.x)"
$JAVA_HOME/bin/javac -d mods --module-path mlib${PATH_SEPARATOR}amlib --module-source-path src $(find src -name "*.java" | grep -v mod.x)

pushd mods > /dev/null 2>&1
for dir in */; 
do
    MODDIR=${dir%*/}
    echo "jar --create --file=../mlib/${MODDIR}.jar -C ${MODDIR} ."
    $JAVA_HOME/bin/jar --create --file=../mlib/${MODDIR}.jar -C ${MODDIR} .
done
popd >/dev/null 2>&1
