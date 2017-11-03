. ../env.sh

$JAVA_HOME/bin/java --version
echo " "

echo "1."
echo "Running with root-module moda"
echo "   java --module-path mlib --module moda/pkga.AMain"
$JAVA_HOME/bin/java --module-path mlib --module moda/pkga.AMain 2>&1 | myecho

echo ------------------------------------------------------------------

echo "2."
echo "Running with root-module modb"
echo "   java --module-path mlib --module modb/pkgb.BMain"
$JAVA_HOME/bin/java --module-path mlib --module modb/pkgb.BMain 2>&1 | myecho

echo ------------------------------------------------------------------

echo "3."
echo "Running with root-module modc"
echo "   java --module-path mlib --module modc/pkgc.CMain"
$JAVA_HOME/bin/java --module-path mlib --module modc/pkgc.CMain 2>&1 | myecho

echo ------------------------------------------------------------------

echo "4."
echo "Running with root-module modb plus --add-modules modc"
echo "   java --module-path mlib --add-modules modc --module modb/pkgb.BMain"
$JAVA_HOME/bin/java --module-path mlib --add-modules modc --module modb/pkgb.BMain 2>&1 | myecho

echo ------------------------------------------------------------------

echo "5."
echo "Running with root-module modb plus automatic module javax.json"
echo "   java --module-path mlib${PATH_SEPARATOR}amlib --module modb/pkgb.BMain"
$JAVA_HOME/bin/java --module-path mlib${PATH_SEPARATOR}amlib --module modb/pkgb.BMain 2>&1 | myecho

echo ------------------------------------------------------------------

echo "6."
echo "Running with root-module modb plus limitmods"
echo "   java --module-path mlib --limit-modules modb --module modb/pkgb.BMain"
$JAVA_HOME/bin/java --module-path mlib --limit-modules modb --module modb/pkgb.BMain 2>&1 | myecho

echo ------------------------------------------------------------------

echo "7."
echo "Running with root-module modb plus limitmods on module java.logging and java.scripting (formerly java.compact1)"
echo "- Note that modb must be added to limitmods otherwise moda cannot be resolved"
echo "  (adding only moda would work too, but would be inconventient when modb has"
echo "   many requires)"
echo "   java --module-path mlib -limitmods java.logging,java.scripting,modb --module modb/pkgb.BMain"
$JAVA_HOME/bin/java --module-path mlib --limit-modules java.logging,java.scripting,modb --module modb/pkgb.BMain 2>&1 | myecho

echo ------------------------------------------------------------------

# TODO: this ugly script code might be replaced on cygwin with the command 'cygpath'

echo "8."
echo "Linking with root module modb ..."

# /x/ doesn't work on module path, replace with x:
JAVA_HOME_OS=$JAVA_HOME
# /x/ doesn't work on module path on windows, replace with x:
(echo $OSTYPE | grep -i win >/dev/null) && JAVA_HOME_OS=$(echo $JAVA_HOME | sed -r s/^\\\/\([a-z]\)/\\\1:/)
echo "   jlink --module-path mlib${PATH_SEPARATOR}$JAVA_HOME_OS/jmods --add-modules modb --output jimage/modb"
rm -rf ./jimage
$JAVA_HOME/bin/jlink --module-path mlib${PATH_SEPARATOR}$JAVA_HOME_OS/jmods --add-modules modb --output jimage/modb 2>&1 | myecho

echo "... and running the linked runtime image with root module modb"
echo "./jimage/modb/bin/java $JAVA_OPTIONS --module modb/pkgb.BMain"
./jimage/modb/bin/java $JAVA_OPTIONS --module modb/pkgb.BMain 2>&1 | myecho
