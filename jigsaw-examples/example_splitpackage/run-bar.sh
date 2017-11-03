. ../env.sh

# this works fine (no problem if modsplitbar1 and modsplitbar2 are both on the module path)
$JAVA_HOME/bin/java $JAVA_OPTIONS --module-path mlib                            --module modmainbar/pkgmainbar.Main 2>&1 | myecho

# but this does not work, throws RuntimeException: 
#    java.lang.reflect.LayerInstantiationException: Package pkgbar in both module modbar2 and module modbar1
# reason: modsplitbar1 and modsplitbar2 are both in the same Configuration
$JAVA_HOME/bin/java $JAVA_OPTIONS --module-path mlib --add-modules modsplitbar2 --module modmainbar/pkgmainbar.Main 2>&1 | myecho
