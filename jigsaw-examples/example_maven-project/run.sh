. ../env.sh

mvn --version --fail-at-end 2>&1

cd src/moda
mvn -s ../../mvn_settings.xml test 2>&1
cd - >/dev/null 2>&1

cd src/modmain
mvn -s ../../mvn_settings.xml test 2>&1
cd - >/dev/null 2>&1
