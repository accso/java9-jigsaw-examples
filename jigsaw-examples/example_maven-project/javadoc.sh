. ../env.sh

export JAVA_HOME

cd src/moda
mvn javadoc:javadoc --fail-at-end
cd - >/dev/null 2>&1

cd src/modmain
mvn javadoc:javadoc --fail-at-end
cd - >/dev/null 2>&1
