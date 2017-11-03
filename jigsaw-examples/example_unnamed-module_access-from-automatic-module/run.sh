. ../env.sh

$JAVA_HOME/bin/java $JAVA_OPTIONS --module-path amlib -cp cplib/cpa.jar  -m modmain.auto/pkgmain.Main 2>&1 | myecho
