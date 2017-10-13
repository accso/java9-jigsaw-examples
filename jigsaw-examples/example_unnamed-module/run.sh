. ../env.sh

$JAVA_HOME/bin/java --module-path mlib -cp cplib/cpmain.jar${PATH_SEPARATOR}cplib/cpb.jar --add-modules modb pkgcpmain.Main | myecho
