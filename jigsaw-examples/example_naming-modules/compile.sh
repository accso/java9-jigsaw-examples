. ../env.sh

mkdir -p mods
mkdir -p mlib
mkdir -p classes

# compile all directories which have a module-info.java (any but automatic*)

pushd src > /dev/null 2>&1
for dir in `ls . | grep -v automatic`
do
    echo "javac -Xlint -d ../mods --module-path ../mlib --module-source-path . \$(find ${dir} -name \"*.java\")"
    $JAVA_HOME/bin/javac -Xlint -d ../mods --module-path ../mlib --module-source-path . $(find ${dir} -name "*.java")
done
popd >/dev/null 2>&1

pushd mods > /dev/null 2>&1
for dir in `ls . | grep -v automatic` 
do
    MODDIR=${dir%*/}
    echo "jar --create --file=../mlib/${MODDIR}.jar -C ${MODDIR} ."
    $JAVA_HOME/bin/jar --create --file=../mlib/${MODDIR}.jar --module-version 0.1 -C ${MODDIR} .
done
popd >/dev/null 2>&1

# ---------------------------------------------------

# compile automatic* to non-modular JAR-file

counter=0
for dir in automatic-whatever automatic-whateverX-47.11 automatic-whateverX48.12 automatic-whateverX49-13
do
    pushd src > /dev/null 2>&1
    echo "javac -Xlint -d ../classes/${dir} \$(find ${dir} -name \"*.java\")"
    $JAVA_HOME/bin/javac -Xlint -d ../classes/${dir} $(find ${dir} -name "*.java")

    echo "jar --create --file=../mlib/${dir}.jar -C ../classes/${dir} ."
    counter=$((counter+1))
    $JAVA_HOME/bin/jar --create --file=../amlib${counter}/${dir}.jar -C ../classes/${dir} .
    
    popd >/dev/null 2>&1 
done
