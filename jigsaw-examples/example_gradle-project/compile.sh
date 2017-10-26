. ../env.sh

./gradlew build

# copy JAR files from Gradle build to one single folder
rm -rf ./mlib
mkdir -p ./mlib
for dir in mod*
do
  find $dir -type f -name "mod*.jar" | xargs -i cp {} ./mlib
done
