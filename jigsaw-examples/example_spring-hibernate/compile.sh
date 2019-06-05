. ../env.sh

mvn --version 

pushd src > /dev/null 2>&1

mvn -s ../mvn_settings.xml install -e -DskipTests --fail-at-end 2>&1

popd >/dev/null 2>&1 
