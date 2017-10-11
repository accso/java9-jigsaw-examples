. ../env.sh

# Logger using both implementations for simple and jdk14 logging -> run time error ("split package") as both modules do export org.slf4j.impl

echo "$JAVA_HOME/bin/java --module-path mlib${PATH_SEPARATOR}amlib-api${PATH_SEPARATOR}amlib-simple${PATH_SEPARATOR}amlib-jdk14 --add-modules slf4j.simple\,slf4j.jdk14  -m modmain/pkgmain.Main  | myecho"
$JAVA_HOME/bin/java --module-path mlib${PATH_SEPARATOR}amlib-api${PATH_SEPARATOR}amlib-simple${PATH_SEPARATOR}amlib-jdk14 --add-modules slf4j.simple\,slf4j.jdk14  -m modmain/pkgmain.Main  | myecho
