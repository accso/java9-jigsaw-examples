. ../env.sh

$JAVA_HOME/bin/java $JAVA_OPTIONS --module-path mlib -cp cplib/cpmain.jar${PATH_SEPARATOR}cplib/cpb.jar --module modmain/pkgmain.Main 2>&1 | myecho
