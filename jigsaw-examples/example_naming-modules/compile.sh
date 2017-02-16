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

pushd src > /dev/null 2>&1
for dir in automatic*;
do
    echo "javac -Xlint -d ../classes/${dir} \$(find ${dir} -name \"*.java\")"
    $JAVA_HOME/bin/javac -Xlint -d ../classes/${dir} $(find ${dir} -name "*.java")

    # has version?
    hasversion=$(echo ${dir} | grep version)
    if [ "${hasversion}"=="" ] 
    then
       echo "jar --create --file=../mlib/${dir}.jar -C ../classes/${dir} ."
       $JAVA_HOME/bin/jar --create --file=../mlib/${dir}.jar -C ../classes/${dir} .
    else
       version=`echo ${dir} | sed s/'automatic.'//g | sed s/'version'//g`
       echo "jar --create --file=../mlib/${dir}-${version}.jar -C ../classes/${dir} ."
       $JAVA_HOME/bin/jar --create --file=../mlib/${dir}-${version}.jar -C ../classes/${dir} . 
    fi
done
popd >/dev/null 2>&1 
