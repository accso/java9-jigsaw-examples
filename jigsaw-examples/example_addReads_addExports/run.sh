. ../env.sh

$JAVA_HOME/bin/java --module-path mlib  \
     --add-modules modb,modc            \
     --add-reads   modb=modc            \
     --add-exports modc/pkgc=modb       \
     --add-reads   modmain=modb         \
     --add-exports modb/pkgb=modmain    \
     -m modmain/pkgmain.Main | myecho
