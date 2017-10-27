. ../env.sh

pushd src > /dev/null 2>&1

../mvnw -e test

popd >/dev/null 2>&1 
