. ../env.sh

chmod a+x ./gradlew
./gradlew  --no-daemon clean

rm -rf mlib/*.jar
mkdir -p mlib
