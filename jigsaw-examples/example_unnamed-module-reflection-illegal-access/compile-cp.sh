. ../env.sh

mkdir -p mods
mkdir -p mlib
mkdir -p classes
mkdir -p cplib

#  create non-modular jars to be put onto the classpath
pushd src > /dev/null 2>&1

echo "javac -Xlint -cp ../mlib/*${PATH_SEPARATOR}  -d ../classes/cpmain  \$(find cpmain -name \"*.java\")"
$JAVA_HOME/bin/javac -Xlint \
      -cp ../mlib/*${PATH_SEPARATOR} \
      -d ../classes/cpmain  $(find cpmain -name "*.java")

echo "jar --create --file=../cplib/cpmain.jar -C ../classes/cpmain ."
$JAVA_HOME/bin/jar --create --file=../cplib/cpmain.jar -C ../classes/cpmain .

popd >/dev/null 2>&1

