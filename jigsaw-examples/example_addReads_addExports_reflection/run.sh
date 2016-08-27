. ../env.sh

# note: not done here (but via reflection in modmain): --add-reads modmain=modb 
# note: not done here (but via reflection in modb)   : --add-exports modb/pkgbinternal=modmain

$JAVA_HOME/bin/java --module-path mlib \
     --add-modules modb \
     --add-exports modb/pkgb=modmain \
     -m modmain/pkgmain.Main | myecho
