. ../env.sh

#      --add-reads modmain=ALL-UNNAMED \

$JAVA_HOME/bin/java $JAVA_OPTIONS \
      --module-path mlib \
      --class-path cplib/cpb.jar \
      --module modmain/pkgmain.Main \
      2>&1 | myecho
