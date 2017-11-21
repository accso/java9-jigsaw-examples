. ../env.sh

echo "Running the application with only modauto1 on the module path... "

# when we run the application and only have amlib1/modauto1 on the module path, 
#   we do not see an error, all is fine
$JAVA_HOME/bin/java $JAVA_OPTIONS \
    --show-module-resolution \
    --module-path mlib${PATH_SEPARATOR}amlib1 \
    --module modmain/pkgmain.Main .  2>&1 | myecho
