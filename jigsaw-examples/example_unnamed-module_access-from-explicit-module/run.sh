. ../env.sh

$JAVA_HOME/bin/java $JAVA_OPTIONS --add-reads modmain=ALL-UNNAMED --module-path mlib --class-path cplib/cpmain.jar${PATH_SEPARATOR}cplib/cpb.jar --module modmain/pkgmain.Main 2>&1 | myecho
