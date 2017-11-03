. ../env.sh

mkdir -p mods
mkdir -p mlib
mkdir -p classes
mkdir -p cplib

#  create non-modular jars to be put onto the classpath
pushd src > /dev/null 2>&1

echo "javac $JAVAC_OPTIONS  -cp ../mlib/*${PATH_SEPARATOR}  -d ../classes/cpmain  \$(find cpmain -name \"*.java\")"
$JAVA_HOME/bin/javac $JAVAC_OPTIONS  \
      -cp ../mlib/*${PATH_SEPARATOR} \
      -d ../classes/cpmain  $(find cpmain -name "*.java") \
       2>&1

echo "jar $JAR_OPTIONS --create --file=../cplib/cpmain.jar -C ../classes/cpmain ."
$JAVA_HOME/bin/jar $JAR_OPTIONS --create --file=../cplib/cpmain.jar -C ../classes/cpmain .  2>&1

popd >/dev/null 2>&1

