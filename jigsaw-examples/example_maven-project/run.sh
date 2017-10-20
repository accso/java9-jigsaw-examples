. ../env.sh

cd src/moda
mvn test
cd - >/dev/null 2>&1

cd src/modmain
mvn test
cd - >/dev/null 2>&1
