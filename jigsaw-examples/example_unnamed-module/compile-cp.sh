. ../env.sh

mkdir -p mods
mkdir -p mlib
mkdir -p classes/cpb
mkdir -p cplib

#  create non-modular jars to be put onto the classpath
pushd src > /dev/null 2>&1

# Attention: compile needs to be done in correct order
for dir in cpb cpmain;
do
   echo "javac $JAVAC_OPTIONS  -cp ../mlib/*${PATH_SEPARATOR}../classes/cpb  -d ../classes/${dir}  \$(find ${dir} -name \"*.java\")"
   $JAVA_HOME/bin/javac $JAVAC_OPTIONS  -cp ../mlib/*${PATH_SEPARATOR}../classes/cpb  -d ../classes/${dir}  $(find ${dir} -name "*.java") 2>&1

   echo "jar $JAR_OPTIONS --create --file=../cplib/${dir}.jar -C ../classes/${dir} ."
   $JAVA_HOME/bin/jar $JAR_OPTIONS --create --file=../cplib/${dir}.jar -C ../classes/${dir} . 2>&1
done
popd >/dev/null 2>&1

