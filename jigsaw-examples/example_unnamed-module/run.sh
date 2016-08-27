. ../env.sh

# use main from classpath-jar
# classpath using -cp cplib does not seem to work ?!
echo ">> Calling main from unnamed Module"
$JAVA_HOME/bin/java --module-path mlib -cp cplib/cpmain.jar\;cplib/cpb.jar -addmods modb pkgcpmain.Main | myecho

# use main from module
echo ">> Calling Main from module"
$JAVA_HOME/bin/java --module-path mlib -m modmain/pkgmain.Main | myecho
