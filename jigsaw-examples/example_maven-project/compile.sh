. ../env.sh

mvn --version

cd src/moda
mvn install -DskipTests
cd - >/dev/null 2>&1

cd src/modmain
mvn install -DskipTests
cd - >/dev/null 2>&1


