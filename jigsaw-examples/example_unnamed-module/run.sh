. ../env.sh

echo ">> Calling class Main on the classpath, i.e. on the unnamed module"
$JAVA_HOME/bin/java --module-path mlib -cp cplib/cpmain.jar${PATH_SEPARATOR}cplib/cpb.jar --add-modules modb pkgcpmain.Main | myecho
