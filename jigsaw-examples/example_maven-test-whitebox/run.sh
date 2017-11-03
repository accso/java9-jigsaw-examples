. ../env.sh

echo $JAVA_HOME/bin/java $JAVA_OPTIONS --module-path target/lib${PATH_SEPARATOR}target/*.jar --module modmain/pkgmain.Main | myecho
$JAVA_HOME/bin/java $JAVA_OPTIONS --module-path target/lib${PATH_SEPARATOR}target/classes --module modmain/pkgmain.Main | myecho
