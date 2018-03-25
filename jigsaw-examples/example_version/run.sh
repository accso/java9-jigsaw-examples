. ../env.sh

$JAVA_HOME/bin/java --module-path mlib --module modmain/pkgmain.Main 2>&1 | myecho
