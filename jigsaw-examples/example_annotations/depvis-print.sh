. ../env.sh

# Config properties file
PROPS_FILENAME=depvis.properties

$JAVA_HOME/bin/java --module-path ${DEPVIS_HOME}/mlib${PATH_SEPARATOR}${DEPVIS_HOME}/amlib --module depvis/depvis.JigsawDepPrinter ${PROPS_FILENAME}  2>&1
