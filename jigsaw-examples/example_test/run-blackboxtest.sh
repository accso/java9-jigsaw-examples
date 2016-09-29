. ../env.sh

$JAVA_HOME/bin/java --module-path mlib\;amlib \
     --add-modules hamcrest.core,modtest.blackbox \
     -m junit/org.junit.runner.JUnitCore \
     pkgblacktest.BlackBoxTest
