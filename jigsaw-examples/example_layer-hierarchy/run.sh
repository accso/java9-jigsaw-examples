. ../env.sh

echo ""
$JAVA_HOME/bin/java $JAVA_OPTIONS --module-path "mlib${PATH_SEPARATOR}amlib" -m mod.main/pkgmain.Main . | myecho

