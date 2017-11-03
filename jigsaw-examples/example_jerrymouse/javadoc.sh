. ../env.sh

rm -rf doc
mkdir -p doc

# generate JavaDoc
echo "javadoc $JAVADOC_OPTIONS -d doc --module-path mlib --module-source-path src $(find src -name \"*.java\")"
$JAVA_HOME/bin/javadoc $JAVADOC_OPTIONS  -d doc \
    --module-path "mlib${PATH_SEPARATOR}amlib" \
    --module-source-path src $(find src -name "*.java") \
     2>&1
