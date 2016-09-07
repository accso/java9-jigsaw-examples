. ../env.sh

echo ""
$JAVA_HOME/bin/java --module-path "mlib\;amlib" -m mod.main/pkgmain.Main . | myecho

