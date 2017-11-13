. ../env.sh

mkdir -p classes-jdk9
mkdir -p cplib

pushd src > /dev/null 2>&1

# create non-modular JAR cpmain.jar to be put onto the classpath
export dir=cpmain
echo "javac $JAVAC_OPTIONS   -d ../classes-jdk9/${dir}   \$(find ${dir} -name \"*.java\")"
$JAVA_HOME/bin/javac $JAVAC_OPTIONS   -d ../classes-jdk9/${dir}   $(find ${dir} -name "*.java") 2>&1

echo "jar $JAR_OPTIONS --create --file=../cplib/${dir}-jdk9.jar -C ../classes-jdk9/${dir} ."
$JAVA_HOME/bin/jar $JAR_OPTIONS --create --file=../cplib/${dir}-jdk9.jar -C ../classes-jdk9/${dir} . 2>&1

popd >/dev/null 2>&1
