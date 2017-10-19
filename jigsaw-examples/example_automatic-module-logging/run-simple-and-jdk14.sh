. ../env.sh

# Logger using both implementations for simple and jdk14 logging -> run time error ("split package") as both modules do export org.slf4j.impl

echo "Exception expected: java.lang.module.ResolutionException: Modules slf4j.jdk14 and slf4j.simple export package org.slf4j.impl to module slf4j.api"
echo "$JAVA_HOME/bin/java $JAVA_OPTIONS --module-path mlib${PATH_SEPARATOR}amlib-api${PATH_SEPARATOR}amlib-simple${PATH_SEPARATOR}amlib-jdk14 --add-modules slf4j.simple\,slf4j.jdk14  -m modmain/pkgmain.Main  | myecho"
$JAVA_HOME/bin/java $JAVA_OPTIONS --module-path mlib${PATH_SEPARATOR}amlib-api${PATH_SEPARATOR}amlib-simple${PATH_SEPARATOR}amlib-jdk14 --add-modules slf4j.simple\,slf4j.jdk14  -m modmain/pkgmain.Main  | myecho
