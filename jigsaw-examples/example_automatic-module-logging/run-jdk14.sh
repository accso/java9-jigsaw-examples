. ../env.sh

# Logger using jdk14 implementation
echo " "
echo "Using slf4j.jdk14 as implementation for slf4j, see also #VersionsInModuleNames!"

echo "$JAVA_HOME/bin/java $JAVA_OPTIONS --module-path mlib${PATH_SEPARATOR}amlib-api${PATH_SEPARATOR}amlib-jdk14 --add-modules slf4j.jdk14 --module modmain/pkgmain.Main | myecho"
$JAVA_HOME/bin/java $JAVA_OPTIONS --module-path mlib${PATH_SEPARATOR}amlib-api${PATH_SEPARATOR}amlib-jdk14 --add-modules slf4j.jdk14 --module modmain/pkgmain.Main | myecho
