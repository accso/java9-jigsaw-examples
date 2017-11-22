. ../env.sh

function compileandjar() { 

pushd src > /dev/null 2>&1
  
  # compile as automatic module, i.e create an ordinary JAR file
  rm -rf ../classes
  mkdir -p ../classes
  
  echo "javac $JAVAC_OPTIONS   -d ../classes/${1}   \$(find ${1} -name \"*.java\")"
  $JAVA_HOME/bin/javac $JAVAC_OPTIONS -d ../classes/${1}   $(find ${1} -name "*.java") 2>&1
  
  echo "jar $JAR_OPTIONS --create --file=../${2}/${1}.jar -C ../classes/${1} ."
  $JAVA_HOME/bin/jar $JAR_OPTIONS --create --file=../${2}/${1}.jar -C ../classes/${1} . 2>&1
  
popd > /dev/null 2>&1

}

compileandjar modauto1 amlib1
compileandjar modauto2 amlib2
