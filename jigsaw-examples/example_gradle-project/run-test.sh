. ../env.sh

chmod a+x ./gradlew
./gradlew --info --stacktrace --no-daemon test 2>&1
