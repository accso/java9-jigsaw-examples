. ../env.sh

# Patch modb with classes
echo ">> Start modmain/pkgmain.Main with patch classes from patches/modb"
$JAVA_HOME/bin/java --patch-module modb=patches/modb --module-path mlib -m modmain/pkgmain.Main | myecho

# Patch modb with a modular jar
echo ">> Start modmain/pkgmain.Main with patch classes from patchlib/modb.jar"
$JAVA_HOME/bin/java --patch-module modb=patchlib/modb.jar --module-path mlib -m modmain/pkgmain.Main | myecho
