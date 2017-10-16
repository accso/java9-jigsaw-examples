. ../env.sh

$JAVA_HOME/bin/java --module-path mlib --add-modules modb,modc -m modmain/pkgmain.Main | myecho
