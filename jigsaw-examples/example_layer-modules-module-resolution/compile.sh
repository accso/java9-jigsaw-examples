. ../env.sh

mkdir -p mods
mkdir -p mods2
mkdir -p mlib 
mkdir -p foomlib 
mkdir -p barmlib 

# compile modules in src folder
for mod in modcommon modmain modversion1 modversion2 modfoo modbar;
do
    echo "javac $JAVAC_OPTIONS -d mods --module-version=1.0 --module-path mlib --module-source-path src \$(find src/${mod} -name \"*.java\")"
    $JAVA_HOME/bin/javac $JAVAC_OPTIONS -d mods --module-version=1.0 --module-path mlib --module-source-path src $(find src/${mod} -name "*.java") 2>&1
done

# compile new version of modcommon (same module name, must therefore be in separate src folder)
echo "javac $JAVAC_OPTIONS  -d mods2 --module-version=2.0 --module-path mlib --module-source-path src2 \$(find src2/modcommon -name \"*.java\")"
$JAVA_HOME/bin/javac $JAVAC_OPTIONS  -d mods2 --module-version=2.0 --module-path mlib --module-source-path src2 $(find src2/modcommon -name "*.java") 2>&1


# --------------------------------------

pushd mods > /dev/null 2>&1
# package boot layer modules as jars in mlib
for mod in modcommon modmain; 
do
    echo "jar $JAR_OPTIONS --create --file=../mlib/${mod}.jar -C ${mod} ."
    $JAVA_HOME/bin/jar $JAR_OPTIONS --create --file=../mlib/${mod}.jar -C ${mod} . 2>&1
done
# package foo layer modules as jars in foomlib
for mod in modversion1 modfoo; 
do
    echo "jar $JAR_OPTIONS --create --file=../foomlib/${mod}.jar -C ${mod} ."
    $JAVA_HOME/bin/jar $JAR_OPTIONS --create --file=../foomlib/${mod}.jar -C ${mod} . 2>&1
done
# package bar layer modules as jars in barmlib
for mod in modversion2 modbar; 
do
    echo "jar $JAR_OPTIONS --create --file=../barmlib/${mod}.jar -C ${mod} ."
    $JAVA_HOME/bin/jar $JAR_OPTIONS --create --file=../barmlib/${mod}.jar -C ${mod} . 2>&1
done
popd >/dev/null 2>&1

pushd mods2 > /dev/null 2>&1
# package new modcommon as jar in barmlib
for mod in modcommon; 
do
    echo "jar $JAR_OPTIONS --create --file=../barmlib/${mod}.jar -C ${mod} ."
    $JAVA_HOME/bin/jar $JAR_OPTIONS --create --file=../barmlib/${mod}.jar -C ${mod} . 2>&1
done
popd >/dev/null 2>&1
