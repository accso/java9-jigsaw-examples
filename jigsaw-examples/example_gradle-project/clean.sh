. ../env.sh

chmod a+x ./gradlew
./gradlew --info --stacktrace --no-daemon clean 2>&1

rm -rf mlib/*.jar
mkdir -p mlib
