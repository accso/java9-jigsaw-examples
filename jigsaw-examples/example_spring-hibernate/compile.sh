. ../env.sh

pushd src > /dev/null 2>&1

chmod a+x ../mvnw
../mvnw -e compile install package 2>&1

popd >/dev/null 2>&1 
