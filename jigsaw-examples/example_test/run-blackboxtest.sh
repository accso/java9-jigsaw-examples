. ../env.sh

$JAVA_HOME/bin/java $JAVA_OPTIONS --module-path mlib${PATH_SEPARATOR}amlib \
     --add-modules hamcrest.core,modtest.blackbox \
     --module junit/org.junit.runner.JUnitCore \
     pkgblacktest.BlackBoxTest \
      2>&1
