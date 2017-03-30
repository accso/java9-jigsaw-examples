. ../env.sh

echo $JAVA_HOME/bin/java --module-path target/lib${PATH_SEPARATOR}target/*.jar -m modmain/pkgmain.Main | myecho
$JAVA_HOME/bin/java --module-path target/lib${PATH_SEPARATOR}target/classes -m modmain/pkgmain.Main | myecho
