. ../env.sh

rm -rf doc
mkdir -p doc

# generate JavaDoc
echo "javadoc $JAVADOC_OPTIONS -d doc --module-path mlib --module-source-path src $(find src/*bar* -name \"*.java\")"
$JAVA_HOME/bin/javadoc $JAVADOC_OPTIONS  -d doc \
    --module-path mlib \
    --add-modules modmainbar --add-modules modsplitbar1 --add-modules modsplitbar2 \
    --module-source-path src $(find src/*bar* -name "*.java") \
     2>&1
