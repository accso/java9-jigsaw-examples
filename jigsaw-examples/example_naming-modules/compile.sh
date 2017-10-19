. ../env.sh

mkdir -p mods
mkdir -p mlib
mkdir -p classes

# compile all directories which have a module-info.java (any but automatic*)

pushd src > /dev/null 2>&1
for dir in `ls . | grep -v automatic`
do
    echo "javac $JAVAC_OPTIONS  -d ../mods --module-path ../mlib --module-source-path . \$(find ${dir} -name \"*.java\")"
    $JAVA_HOME/bin/javac $JAVAC_OPTIONS  -d ../mods --module-path ../mlib --module-source-path . $(find ${dir} -name "*.java")
done
popd >/dev/null 2>&1

pushd mods > /dev/null 2>&1
for dir in `ls . | grep -v automatic` 
do
    MODDIR=${dir%*/}
    echo "jar $JAR_OPTIONS --create --file=../mlib/${MODDIR}.jar -C ${MODDIR} ."
    $JAVA_HOME/bin/jar $JAR_OPTIONS --create --file=../mlib/${MODDIR}.jar $JAR_OPTIONS --module-version 0.1 -C ${MODDIR} .
done
popd >/dev/null 2>&1

# ---------------------------------------------------

# compile automatic* to non-modular JAR-file (into separate amlib* directories)

counter=0
for dir in automatic-whatever automatic-whateverX-47.11 automatic-whateverX48.12 automatic-whateverX49-13
do
    pushd src > /dev/null 2>&1
    echo "javac $JAVAC_OPTIONS  -d ../classes/${dir} \$(find ${dir} -name \"*.java\")"
    $JAVA_HOME/bin/javac $JAVAC_OPTIONS  -d ../classes/${dir} $(find ${dir} -name "*.java")

    echo "jar $JAR_OPTIONS --create --file=../amlib${counter}/${dir}.jar -C ../classes/${dir} ."
    counter=$((counter+1))
    $JAVA_HOME/bin/jar $JAR_OPTIONS --create --file=../amlib${counter}/${dir}.jar -C ../classes/${dir} .
    
    popd >/dev/null 2>&1 
done
