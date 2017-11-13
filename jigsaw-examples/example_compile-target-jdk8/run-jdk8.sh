. ../env.sh

echo "$JAVA_HOME_JDK8/bin/java $JAVA_OPTIONS  -cp cplib/cpmain-jdk8.jar  pkgmain.Main"

$JAVA_HOME_JDK8/bin/java $JAVA_OPTIONS  -cp cplib/cpmain-jdk8.jar  pkgmain.Main 2>&1 | myecho
