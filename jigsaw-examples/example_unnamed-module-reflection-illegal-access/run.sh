. ../env.sh

# -------------------------------------------------------------------------------------------------------------------------------------------------------------------------

#
# Run main class, which does reflective access to a class from module java.base, package jdk.internal (a package which is new in Java9)
# Only variant #5 will work, while variants #1,#2,#3,#4 will show this exception:
#     java.lang.reflect.InaccessibleObjectException: Unable to make private jdk.internal.math.DoubleConsts() accessible: module java.base does not "opens jdk.internal.math" to unnamed module

echo "Checking variants of reflective access to java.base/jdk.internal.math.DoubleConsts. Its package is new in Java9!"

echo " "
echo "1 - reflective call without any options"
$JAVA_HOME/bin/java $JAVA_OPTIONS                         --module-path mlib -cp cplib/cpmain.jar pkgcpmain.MainCallingJavaBaseJDKInternal | myecho
echo " "
echo "2 - reflective call with --illegal-access=permit"
$JAVA_HOME/bin/java $JAVA_OPTIONS --illegal-access=permit --module-path mlib -cp cplib/cpmain.jar pkgcpmain.MainCallingJavaBaseJDKInternal | myecho
echo " "
echo "3 - reflective call with --illegal-access=warn"
$JAVA_HOME/bin/java $JAVA_OPTIONS --illegal-access=warn   --module-path mlib -cp cplib/cpmain.jar pkgcpmain.MainCallingJavaBaseJDKInternal | myecho
echo " "
echo "4 - reflective call with --illegal-access=deny"
$JAVA_HOME/bin/java $JAVA_OPTIONS --illegal-access=deny   --module-path mlib -cp cplib/cpmain.jar pkgcpmain.MainCallingJavaBaseJDKInternal | myecho
echo " "
echo "5 - reflective call with explicit --add-opens"
$JAVA_HOME/bin/java $JAVA_OPTIONS --add-opens=java.base/jdk.internal.math=ALL-UNNAMED --module-path mlib -cp cplib/cpmain.jar pkgcpmain.MainCallingJavaBaseJDKInternal | myecho

echo " "

# -------------------------------------------------------------------------------------------------------------------------------------------------------------------------

#
# Run main class, which does reflective access to a class from module java.base, package sun.io (a package which has existed before, in Java8)
# Variants #5,#6, #7 and #8 will work, while variant #9 will show this exception:
#     java.lang.reflect.InaccessibleObjectException: Unable to make private sun.io.Win32ErrorMode() accessible: module java.base does not "opens sun.io" to unnamed module

echo "Checking variants of reflective access to java.base/sun.io.Win32ErrorMode. Its package is not new in Java9, but had existed before in Java8!"

echo " "
echo "6 - reflective call without any options"
$JAVA_HOME/bin/java $JAVA_OPTIONS                         --module-path mlib -cp cplib/cpmain.jar pkgcpmain.MainCallingJavaBaseSunIO | myecho
echo " "
echo "7 - reflective call with --illegal-access=permit"
$JAVA_HOME/bin/java $JAVA_OPTIONS --illegal-access=permit --module-path mlib -cp cplib/cpmain.jar pkgcpmain.MainCallingJavaBaseSunIO | myecho
echo " "
echo "8 - reflective call with --illegal-access=warn"
$JAVA_HOME/bin/java $JAVA_OPTIONS --illegal-access=warn   --module-path mlib -cp cplib/cpmain.jar pkgcpmain.MainCallingJavaBaseSunIO | myecho
echo " "
echo "9 - reflective call with --illegal-access=deny"
$JAVA_HOME/bin/java $JAVA_OPTIONS --illegal-access=deny   --module-path mlib -cp cplib/cpmain.jar pkgcpmain.MainCallingJavaBaseSunIO | myecho
echo " "
echo "10 - with explicit --add-opens"
$JAVA_HOME/bin/java $JAVA_OPTIONS --add-opens=java.base/jdk.internal.math=ALL-UNNAMED --module-path mlib -cp cplib/cpmain.jar pkgcpmain.MainCallingJavaBaseSunIO | myecho

echo " "

# -------------------------------------------------------------------------------------------------------------------------------------------------------------------------

#
# Run main class, which does reflective access to a class from module java.desktop (a package which has existed before, in Java8)
# Variants #11,#12,#13 and #15 will work, while variant #14 will show this exception:
#     java.lang.reflect.InaccessibleObjectException: Unable to make public com.sun.java.swing.plaf.nimbus.NimbusLookAndFeel() accessible: module java.desktop does not "exports com.sun.java.swing.plaf.nimbus" to unnamed modul
#

echo "Checking variants of reflective access to java.desktop/com.sun.java.swing.plaf.nimbus.NimbusLookAndFeel. Its package is not new in Java9, but had existed before in Java8!"

echo " "
echo "11 - reflective call without any options"
$JAVA_HOME/bin/java $JAVA_OPTIONS                         --module-path mlib -cp cplib/cpmain.jar pkgcpmain.MainCallingJavaDesktop | myecho
echo " "
echo "12 - reflective call with --illegal-access=permit"
$JAVA_HOME/bin/java $JAVA_OPTIONS --illegal-access=permit --module-path mlib -cp cplib/cpmain.jar pkgcpmain.MainCallingJavaDesktop | myecho
echo " "
echo "13 - reflective call with --illegal-access=warn"
$JAVA_HOME/bin/java $JAVA_OPTIONS --illegal-access=warn   --module-path mlib -cp cplib/cpmain.jar pkgcpmain.MainCallingJavaDesktop | myecho
echo " "
echo "14 - reflective call with --illegal-access=deny"
$JAVA_HOME/bin/java $JAVA_OPTIONS --illegal-access=deny   --module-path mlib -cp cplib/cpmain.jar pkgcpmain.MainCallingJavaDesktop | myecho
echo " "
echo "15 - with explicit --add-opens"
$JAVA_HOME/bin/java $JAVA_OPTIONS --add-opens=java.desktop/com.sun.java.swing.plaf.nimbus=ALL-UNNAMED --module-path mlib -cp cplib/cpmain.jar pkgcpmain.MainCallingJavaDesktop | myecho

echo " "

# -------------------------------------------------------------------------------------------------------------------------------------------------------------------------

#
# Run main class, which does reflective access to a class from module modb (whose packages had not existed before Java9)
# Only variant #20 will work, while variants #16,#17,#18, and #19 will show this exception:
#     java.lang.reflect.InaccessibleObjectException: Unable to make public pkgbinternal.BFromModuleButInternal() accessible: module modb does not "exports pkgbinternal" to unnamed module
#

echo "Checking variants of reflective access to the following classes in own module modb:"
echo "    class pkgb.BFromModule                                      is public and exported"
echo "    class pkgbinternal.BFromModuleButInternal                   is not exported"
echo "    class pkgbexportedqualified.BFromModuleButExportedQualified is exported, but only qualified to modc (and hence not to the unnamed module)"

echo " "
echo "16 - reflective call without any options"
$JAVA_HOME/bin/java $JAVA_OPTIONS                         --module-path mlib -cp cplib/cpmain.jar --add-modules modb pkgcpmain.MainCallingModB | myecho
echo " "
echo "17 - reflective call with --illegal-access=permit"
$JAVA_HOME/bin/java $JAVA_OPTIONS --illegal-access=permit --module-path mlib -cp cplib/cpmain.jar --add-modules modb pkgcpmain.MainCallingModB | myecho
echo " "
echo "18 - reflective call with --illegal-access=warn"
$JAVA_HOME/bin/java $JAVA_OPTIONS --illegal-access=warn   --module-path mlib -cp cplib/cpmain.jar --add-modules modb pkgcpmain.MainCallingModB | myecho
echo " "
echo "19 - reflective call with --illegal-access=deny"
$JAVA_HOME/bin/java $JAVA_OPTIONS --illegal-access=deny   --module-path mlib -cp cplib/cpmain.jar --add-modules modb pkgcpmain.MainCallingModB | myecho
echo " "
echo "20 - with explicit --add-opens"
$JAVA_HOME/bin/java $JAVA_OPTIONS --add-opens=modb/pkgbinternal=ALL-UNNAMED --add-opens modb/pkgbexportedqualified=ALL-UNNAMED --module-path mlib -cp cplib/cpmain.jar --add-modules modb pkgcpmain.MainCallingModB | myecho
