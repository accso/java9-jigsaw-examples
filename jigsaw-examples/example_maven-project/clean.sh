. ../env.sh

mvn --version
cd src/modmain
mvn clean
cd - >/dev/null 2>&1

cd src/moda
mvn clean
cd - >/dev/null 2>&1
