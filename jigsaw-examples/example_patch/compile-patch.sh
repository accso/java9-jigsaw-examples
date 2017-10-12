. ../env.sh

# Compile the patch as classes, create (non-modular) jar.
#
# --patch-module modb=src: Compile as if the source files were part of modb.
# -d patches/modb: Compile output to directory patches/modb

echo $JAVA_HOME/bin/javac -Xlint --patch-module modb=src --module-path mods -d patches/modb src/modb-patch/pkgb/B.java 
$JAVA_HOME/bin/javac -Xlint --patch-module modb=src --module-path mods -d patches/modb src/modb-patch/pkgb/B.java 

pushd patches > /dev/null 2>&1 
for dir in */; 
do
    MODDIR=${dir%*/}
    echo "jar --create --file=../patchlib/${MODDIR}.jar -C ${MODDIR} ."
    $JAVA_HOME/bin/jar --create --file=../patchlib/${MODDIR}.jar -C ${MODDIR} .
done
popd >/dev/null 2>&1
