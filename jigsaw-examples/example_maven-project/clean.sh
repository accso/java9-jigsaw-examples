. ../env.sh

mvn --version --fail-at-end
cd src/modmain
mvn clean --fail-at-end
cd - >/dev/null 2>&1

cd src/moda
mvn clean --fail-at-end
cd - >/dev/null 2>&1

rm -rf doc
