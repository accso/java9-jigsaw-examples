. ../env.sh

echo "Running the application with JDK8, compiled with JDK9 for release 8"
echo "$JAVA8_HOME/bin/java $JAVA_OPTIONS  -cp cplib/cpmain-jdk8.jar  pkgmain.Main"

$JAVA8_HOME/bin/java $JAVA_OPTIONS  -cp cplib/cpmain-jdk8.jar  pkgmain.Main 2>&1 | myecho
