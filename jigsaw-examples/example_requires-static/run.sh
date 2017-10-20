. ../env.sh

$JAVA_HOME/bin/java $JAVA_OPTIONS --module-path mlib --add-modules modb,modc --module modmain/pkgmain.Main | myecho
