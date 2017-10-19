. ../env.sh

# note: not done here (but via api in modmain, see Main.java#26) as a replacement for --add-reads modmain=modb 
# note: not done here (but via api in modmain, see Main.java#30) as a replacement for --add-exports modb/pkgbinternal=modmain

$JAVA_HOME/bin/java $JAVA_OPTIONS --module-path mlib \
     --add-modules modb \
     --add-exports modb/pkgb=modmain \
     -m modmain/pkgmain.Main | myecho
