. ../env.sh

# --add-modules for both modb and modc is needed as otherwise a java.lang.ClassNotFoundException is thrown because classes from modb/pkgb and modc/pkgc are not found
# $JAVA_HOME/bin/java $JAVA_OPTIONS --module-path mlib --module modmain/pkgmain.Main  2>&1 | myecho

# because of the 'requires static' dependencies from modb->modc and modmain->modb, we need to add modb and modc explicitely to the runtime Configuration
$JAVA_HOME/bin/java $JAVA_OPTIONS --module-path mlib --add-modules modb,modc --module modmain/pkgmain.Main  2>&1 | myecho
