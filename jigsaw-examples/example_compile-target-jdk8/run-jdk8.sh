. ../env.sh

echo "export JAVA_HOME=/u/Common_Env/jdk/jdk1.8.0_121-x64"
export JAVA_HOME=/u/Common_Env/jdk/jdk1.8.0_121-x64

echo "$JAVA_HOME/bin/java $JAVA_OPTIONS  -cp cplib/cpmain-jdk8.jar  pkgmain.Main"

$JAVA_HOME/bin/java $JAVA_OPTIONS  -cp cplib/cpmain-jdk8.jar  pkgmain.Main 2>&1 | myecho
