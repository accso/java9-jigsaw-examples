. ../env.sh

echo "Running the application with both modauto1 and modauto2 on the module path... "
echo "- When we run the application and have both amlib1 and amlib2 on the module path, we see a 'split package' problem"
echo "  as modauto1 and modauto2 both use the package pkgsplitted, which results in a java.lang.module.ResolutionException."
echo "- This error is caused as modauto1 is required and used by modmain. With that modauto1 automatically requires all other automatic modules on the module path,"
echo "  hence modauto2 which then causes the runtime error."
$JAVA_HOME/bin/java $JAVA_OPTIONS \
    --show-module-resolution \
    --module-path mlib${PATH_SEPARATOR}amlib1${PATH_SEPARATOR}amlib2 \
    --module modmain/pkgmain.Main .  2>&1 | myecho
