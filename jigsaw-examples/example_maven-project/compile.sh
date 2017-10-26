. ../env.sh

mvn --version --fail-at-end

cd src/moda
mvn install -DskipTests --fail-at-end
cd - >/dev/null 2>&1

cd src/modmain
mvn install -DskipTests --fail-at-end
cd - >/dev/null 2>&1


