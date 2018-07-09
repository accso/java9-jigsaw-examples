. ../env.sh

echo "Running the application with JDK8, compiled with JDK9 for release 9... This will *not* work but produce a runtime error message similar to this:"
echo "java.lang.UnsupportedClassVersionError: pkgmain/Main has been compiled by a more recent version of the Java Runtime (class file version 53.0), this version of the Java Runtime only recognizes class file versions up to 52.0"

echo "$JAVA8_HOME/bin/java $JAVA_OPTIONS  -cp cplib/cpmain-jdk9.jar  pkgmain.Main"

$JAVA8_HOME/bin/java $JAVA_OPTIONS  -cp cplib/cpmain-jdk9.jar  pkgmain.Main 2>&1 | myecho

