. ../env.sh

#  create "old" jars to use on the class path
pushd src > /dev/null 2>&1

# Compile in correct order
for dir in cpb cpmain;
do
   echo "javac -cp ../mlib/*\;../classes/cpb  -d ../classes/${dir}  \$(find ${dir} -name \"*.java\")"
   $JAVA_HOME/bin/javac -cp ../mlib/*\;../classes/cpb  -d ../classes/${dir}  $(find ${dir} -name "*.java")

   echo "jar --create --file=../cplib/${dir}.jar -C ../classes/${dir} ."
   $JAVA_HOME/bin/jar --create --file=../cplib/${dir}.jar -C ../classes/${dir} .
done
popd >/dev/null 2>&1

