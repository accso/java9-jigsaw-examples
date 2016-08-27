. ../env.sh

$JAVA_HOME/bin/java --module-path mlib\;amlib \
     -addmods hamcrest.core,modtest.blackbox \
     -m junit/org.junit.runner.JUnitCore \
     pkgblacktest.BlackBoxTest
