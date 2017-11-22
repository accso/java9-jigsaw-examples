. ../env.sh

MODNAME=modauto1
TARGET=amlib1

pushd src > /dev/null 2>&1
  
# compile as automatic module, i.e build an "ordinary", non-modular JAR file

echo "javac $JAVAC_OPTIONS   -d ../classes/${MODNAME}   \$(find ${MODNAME} -name \"*.java\")"
$JAVA_HOME/bin/javac $JAVAC_OPTIONS -d ../classes/${MODNAME}   $(find ${MODNAME} -name "*.java") 2>&1

echo "jar $JAR_OPTIONS --create --file=../${TARGET}/${MODNAME}.jar -C ../classes/${MODNAME} ."
$JAVA_HOME/bin/jar $JAR_OPTIONS --create --file=../${TARGET}/${MODNAME}.jar -C ../classes/${MODNAME} . 2>&1
  
popd > /dev/null 2>&1
