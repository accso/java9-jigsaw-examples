. ../env.sh

# Logger-Implementierung simple logging
echo "Aufruf mit slf4j.simple"
$JAVA_HOME/bin/java --module-path mlib\;amlib -addmods slf4j.simple -m modmain/pkgmain.Main | myecho

# Logger-Implementierung jdk-Logging
echo " "
echo "Aufruf mit slf4j.jdk14"
$JAVA_HOME/bin/java --module-path mlib\;amlib -addmods slf4j.jdk14 -m modmain/pkgmain.Main | myecho

# --------------------------------------------------------------------------
# Add both implementations -> Error as both modules do export org.slf4j.impl
# $JAVA_HOME/bin/java --module-path mlib\;amlib -addmods slf4j.simple\,slf4j.jdk14  -m modmain/pkgmain.Main  | myecho
