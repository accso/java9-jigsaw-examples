. ../env.sh

pushd src/mod.app/target > /dev/null 2>&1

echo "running application as fat jar: $JAVA_HOME/bin/java $JAVA_OPTIONS --add-modules java.xml.bind -jar mod.app-0.0.1-SNAPSHOT.jar "
$JAVA_HOME/bin/java $JAVA_OPTIONS --add-modules java.xml.bind -jar mod.app-0.0.1-SNAPSHOT.jar

popd >/dev/null 2>&1 


