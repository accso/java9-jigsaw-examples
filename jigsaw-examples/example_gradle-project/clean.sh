. ../env.sh

chmod a+x ./gradlew
./gradlew --no-daemon clean 2>&1

rm -rf mlib/*.jar
mkdir -p mlib
