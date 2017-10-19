. ../env.sh

$JAVA_HOME/bin/java $JAVA_OPTIONS --module-path mlib  \
     --add-modules modb,modc            \
     --add-reads   modmain=modb         \
     --add-reads   modb=modc            \
     --add-exports modb/pkgb=modmain    \
     --add-exports modc/pkgc=modb       \
     -m modmain/pkgmain.Main | myecho
