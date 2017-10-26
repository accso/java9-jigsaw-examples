. ../env.sh

rm -rf doc
mkdir -p doc

# generate JavaDoc for mod.x*
for modx in mod.x_bottom mod.x_middle mod.x_top
do
   mkdir -p doc/${modx}
   echo "javadoc $JAVADOC_OPTIONS -d doc/${modx} --module-path mlib --module-source-path src \$(find src/${modx} -name \"*.java\")"
   $JAVA_HOME/bin/javadoc $JAVADOC_OPTIONS  -d doc/${modx} \
      --module-path "mlib${PATH_SEPARATOR}amlib" \
      --module-source-path src $(find src/${modx} -name "*.java")
done

# generate JavaDoc
mkdir -p doc/rest
echo "javadoc $JAVADOC_OPTIONS -d doc/rest --module-path mlib --module-source-path src $(find src -name \"*.java\" | grep -v mod.x)"
$JAVA_HOME/bin/javadoc $JAVADOC_OPTIONS  -d doc/rest \
    --module-path "mlib${PATH_SEPARATOR}amlib" \
    --module-source-path src $(find src -name "*.java" | grep -v mod.x)
