. ../env.sh

$JAVA_HOME/bin/java $JAVA_OPTIONS --module-path mlib --module modmain/pkgmain.Main | myecho
$JAVA_HOME/bin/java $JAVA_OPTIONS --module-path mlib --module modmainbehindfacade/pkgmainbehindfacade.MainBehindFacade | myecho
