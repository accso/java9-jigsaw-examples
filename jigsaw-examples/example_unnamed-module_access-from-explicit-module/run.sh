. ../env.sh

$JAVA_HOME/bin/java $JAVA_OPTIONS \
      --module-path mlib \
      --class-path cplib/cpb.jar \
      --add-reads modmain=ALL-UNNAMED \
      --module modmain/pkgmain.Main \
      2>&1 | myecho
