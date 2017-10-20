. ../env.sh

echo ""
$JAVA_HOME/bin/java $JAVA_OPTIONS --module-path "mlib${PATH_SEPARATOR}amlib" --module mod.main/pkgmain.Main . | myecho

