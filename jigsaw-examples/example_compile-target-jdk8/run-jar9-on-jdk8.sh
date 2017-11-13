. ../env.sh

echo "export JAVA_HOME=/u/Common_Env/jdk/jdk1.8.0_121-x64"
export JAVA_HOME=/u/Common_Env/jdk/jdk1.8.0_121-x64

echo "Compiled for 9, does not run wih jdk 8"
echo "$JAVA_HOME/bin/java $JAVA_OPTIONS  -cp cplib/cpmain-jdk9.jar  pkgmain.Main"

$JAVA_HOME/bin/java $JAVA_OPTIONS  -cp cplib/cpmain-jdk9.jar  pkgmain.Main 2>&1 | myecho
