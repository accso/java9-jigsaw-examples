. ../env.sh

# The following java call uses quite some options:
# VM Arguments
#  --patch-module  Use the patched version of modfib 
#                  (the delta jar is in patchlib/modfib.jar)
#  --module-path   Use the mlib/*.jar for our modules 
#                  and also amlib (the latter for Junit and Hamcrest)
#  --add-reads     Need to allow that modfib can read junit 
#                  (which is necessary as the patched modfib now has a JUnit testcase)
#  --add-modules   Need to add hamcrest and also modfib (which would otherwise not be found). 
#                  For simplicity: add ALL-MODULE-PATH
#  -m              Start the main class org.junit.runner.JUnitCore in module junit
# Program arguments:
#  pkgfib.WhiteBoxTest  Test class pkgfib.WhiteBoxTest which is then started by JUnitCore

$JAVA_HOME/bin/java \
     --patch-module modfib=patches/modfib \
     --module-path mlib${PATH_SEPARATOR}amlib \
     --add-reads modfib=junit \
     --add-modules ALL-MODULE-PATH \
     -m junit/org.junit.runner.JUnitCore  \
     pkgfib.WhiteBoxTest
