. ../env.sh

# Aufruf des App-Servers
echo ""
$JAVA_HOME/bin/java $JAVA_OPTIONS --module-path "mlib${PATH_SEPARATOR}amlib" -m modstarter/pkgstarter.Starter . | myecho

