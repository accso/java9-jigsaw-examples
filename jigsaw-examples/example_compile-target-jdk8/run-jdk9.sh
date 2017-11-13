. ../env.sh

echo "$JAVA_HOME/bin/java $JAVA_OPTIONS  -cp cplib/cpmain-jdk9.jar  pkgmain.Main"
echo "Compiled for 9, runs wih jdk 9"

$JAVA_HOME/bin/java $JAVA_OPTIONS  -cp cplib/cpmain-jdk9.jar  pkgmain.Main 2>&1 | myecho
