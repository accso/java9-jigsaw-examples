. ../env.sh

mkdir -p mods
mkdir -p patches
mkdir -p mlib
mkdir -p patchlib 

# Compile whitebox test (in the sourcepath, no module-info.java *MUST* be contained - otherwise compile error)
#
# These options are necessay: 
#   --patch-module modfib=src  Compile as if the source files were part of modfib
#   -d patches/modfib      Compile output to directory patches/modfib
#   --add-reads            is needed during compile time  because WhiteBoxTest is a junit test, and therefore a reads dependency is needed to junit.
#   --add-modules          is needed during compile time  because WhiteBoxTest is a junit test, and therefore junit is needed.

echo "javac -Xlint --patch-module modfib=src --add-reads modfib=junit --module-path amlib${PATH_SEPARATOR}mlib -d patches/modfib src/modtest.whitebox/pkgfib/WhiteBoxTest.java"
$JAVA_HOME/bin/javac -Xlint -d patches/modfib \
    --patch-module modfib=src \
    --add-reads modfib=junit \
    --add-modules junit \
    --module-path amlib${PATH_SEPARATOR}mlib \
    src/modtest.whitebox/pkgfib/WhiteBoxTest.java

pushd patches > /dev/null 2>&1 
for dir in */; 
do
    MODDIR=${dir%*/}
    echo "jar --create --file=../patchlib/${MODDIR}.jar -C ${MODDIR} ."
    $JAVA_HOME/bin/jar --create --file=../patchlib/${MODDIR}.jar -C ${MODDIR} .
done
popd >/dev/null 2>&1
