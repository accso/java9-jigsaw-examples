. ../env.sh

echo ""
$JAVA_HOME/bin/java --module-path "mlib${PATH_SEPARATOR}amlib" -m mod.main/pkgmain.Main . | myecho

