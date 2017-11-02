. ../env.sh

mvn --version --fail-at-end

cd src/moda
mvn -s ../../mvn_settings.xml test
cd - >/dev/null 2>&1

cd src/modmain
mvn -s ../../mvn_settings.xml test
cd - >/dev/null 2>&1
