. ../env.sh

mkdir -p mods
mkdir -p patches
mkdir -p mlib
mkdir -p patchlib 

# Compile whitebox test (in the sourcepath, no module-info.java *MUST* be contained - otherwise compile error)
#
# These options are necessay: 
#   -Xmodule:modfib        Compile as if the classes were part of modfib
#   -d patches/modfib      Compile output to directory patches/modfib
#   --add-reads            is needed during compile time  because WhiteBoxTest is a junit test, and therefore a reads dependeny is needed ti junit. 

echo "javac --add-reads modfib=junit -Xmodule:modfib --module-path amlib\;mlib -d patches/modfib src/modtest.whitebox/pkgfib/WhiteBoxTest.java"
$JAVA_HOME/bin/javac --add-reads modfib=junit -Xmodule:modfib --module-path amlib\;mlib -d patches/modfib src/modtest.whitebox/pkgfib/WhiteBoxTest.java

pushd patches > /dev/null 2>&1 
for dir in */; 
do
    MODDIR=${dir%*/}
    echo "jar --create --file=../patchlib/${MODDIR}.jar -C ${MODDIR} ."
    $JAVA_HOME/bin/jar --create --file=../patchlib/${MODDIR}.jar -C ${MODDIR} .
done
popd >/dev/null 2>&1
