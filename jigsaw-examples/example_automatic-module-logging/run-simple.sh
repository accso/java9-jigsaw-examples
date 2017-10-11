. ../env.sh

# Logger using simple implementation
echo " "
echo "Using slf4j.simple as implementation for slf4j"

echo "$JAVA_HOME/bin/java --module-path mlib${PATH_SEPARATOR}amlib-api${PATH_SEPARATOR}amlib-simple --add-modules slf4j.simple -m modmain/pkgmain.Main | myecho"
$JAVA_HOME/bin/java --module-path mlib${PATH_SEPARATOR}amlib-api${PATH_SEPARATOR}amlib-simple --add-modules slf4j.simple -m modmain/pkgmain.Main | myecho

