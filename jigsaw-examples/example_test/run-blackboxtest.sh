. ../env.sh

$JAVA_HOME/bin/java --module-path mlib${PATH_SEPARATOR}amlib \
     --add-modules hamcrest.core,modtest.blackbox \
     -m junit/org.junit.runner.JUnitCore \
     pkgblacktest.BlackBoxTest
