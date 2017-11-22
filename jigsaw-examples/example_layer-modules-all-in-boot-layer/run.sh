. ../env.sh

$JAVA_HOME/bin/java $JAVA_OPTIONS \
    --module-path mlib${PATH_SEPARATOR}amlib1 \
    --add-modules modbar,modfoo \
    --module modmain/pkgmain.Main .  2>&1 | myecho

