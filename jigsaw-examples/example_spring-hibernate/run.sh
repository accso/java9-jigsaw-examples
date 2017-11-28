. ../env.sh

pushd src > /dev/null 2>&1

chmod a+x ../mvnw
../mvnw -s ../mvn_settings.xml --version --fail-at-end 2>&1
../mvnw -s ../mvn_settings.xml -e spring-boot:run 2>&1

popd >/dev/null 2>&1 


