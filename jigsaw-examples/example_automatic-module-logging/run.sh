. ../env.sh

# Logger-Implementierung simple logging
echo "Using slf4j.simple as implementation for slf4j"
$JAVA_HOME/bin/java --module-path mlib\;ifamlib\;amlib -addmods slf4j.simple -m modmain/pkgmain.Main | myecho

# Logger-Implementierung jdk-Logging
echo " "
echo "Using slf4j.jdk14 as implementation for slf4j"
$JAVA_HOME/bin/java --module-path mlib\;ifamlib\;amlib -addmods slf4j.jdk14 -m modmain/pkgmain.Main | myecho

# --------------------------------------------------------------------------
# Add both implementations -> run time error ("split package") as both modules do export org.slf4j.impl
# $JAVA_HOME/bin/java --module-path mlib\;amlib -addmods slf4j.simple\,slf4j.jdk14  -m modmain/pkgmain.Main  | myecho
