. ../env.sh

# Allow access to moda without using the "Add-Exports" entry from MANIFEST.MF
$JAVA_HOME/bin/java $JAVA_OPTIONS \
   --add-exports java.base/jdk.internal.misc=modmain \
   --add-exports moda/pkgainternal=modmain \
   --module-path mlib --module modmain/pkgmain.Main | myecho

# Allow access to moda with using the "Add-Exports" entry from MANIFEST.MF
$JAVA_HOME/bin/java $JAVA_OPTIONS \
   --add-modules moda \
   --module-path mlib \
   -jar mlib/modmain.jar | myecho


