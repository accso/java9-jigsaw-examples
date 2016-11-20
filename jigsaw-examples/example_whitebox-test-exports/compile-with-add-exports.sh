. ../env.sh

# An example for compiling with --add-exports argument.
# Mind that the arguments do not work in arbitrary order! The --add-exports option did not work when put behind -d Option!
echo "javac --add-exports modfib/pkgfib.internal=modtest.whitebox -d mods --module-path amlib\;mlib --module-source-path src \$(find src -name \"*.java\")"
$JAVA_HOME/bin/javac \
    --add-exports modfib/pkgfib.internal=modtest.whitebox \
    -d mods \
    --module-path amlib\;mlib \
    --module-source-path src \
    $(find src -name "*.java")

pushd mods > /dev/null 2>&1
for dir in */; 
do
    MODDIR=${dir%*/}
    echo "jar --create --file=../mlib/${MODDIR}.jar -C ${MODDIR} ."
    $JAVA_HOME/bin/jar --create --file=../mlib/${MODDIR}.jar -C ${MODDIR} .
done
popd >/dev/null 2>&1
