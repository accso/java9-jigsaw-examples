. ../env.sh

pushd src > /dev/null 2>&1

../mvnw test

popd >/dev/null 2>&1 
