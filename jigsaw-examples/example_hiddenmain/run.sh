. ../env.sh

$JAVA_HOME/bin/java $JAVA_OPTIONS --module-path mlib --module modmain/pkgmain.Main  2>&1 | myecho
$JAVA_HOME/bin/java $JAVA_OPTIONS --module-path mlib --module modmain/pkgmainhidden.HiddenMain 2>&1 | myecho
