. ../env.sh

# Aufruf des App-Servers
echo ""
$JAVA_HOME/bin/java --module-path "mlib${PATH_SEPARATOR}amlib" -m modstarter/pkgstarter.Starter . | myecho

