. ../env.sh

pushd src > /dev/null 2>&1

../mvnw -e compile

popd >/dev/null 2>&1 
