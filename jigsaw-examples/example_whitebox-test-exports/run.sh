. ../env.sh

# Starting JUnit:
#  -m            Start the main class org.junit.runner.JUnitCore in module junit
# Program arguments:
#  pkgfib.WhiteBoxTest  Test class pkgfib.WhiteBoxTest which is then started by JUnitCore

$JAVA_HOME/bin/java \
     --module-path mlib${PATH_SEPARATOR}amlib \
     --add-modules ALL-MODULE-PATH \
     -m junit/org.junit.runner.JUnitCore  \
     pkgfibtest.WhiteBoxTest
