package pkgcpmain;

/**
 * This class is on the classpath, i.e. in the unnamed module.
 */

/**
 * This class cannot be compiled in Eclipse because of missing dependencies, might be an Eclipse problem
 * as cpmain cannot access modb.
 */
public class Main {
    public static void main(String[] args) {

        System.out.println("We are calling various classes from " + Main.class + " (which is on the classpath, i.e. in the unnamed module)");

        // ----------------------------------------------------------------------------------------------------------------------------------

        // We access a class on the module path, in module modb - class's package is exported, should work
        System.out.println("1. Calling an exported class which is in a module on the module path");
        pkgb.BFromModule myB1 = new pkgb.BFromModule();
        System.out.println("Calling an exported class B which is in module modb: " + myB1.doIt());

        // ----------------------------------------------------------------------------------------------------------------------------------

        // We access a class on the module path, in module modb - class's package is not exported, results in an java.lang.IllegalAccessError
        try {
            System.out.println("2. Calling an internal, non-exported class which is in a module on the module path");

            pkgbinternal.BFromModuleButInternal myB2 = new pkgbinternal.BFromModuleButInternal();
            System.out.println("Calling an internal, non-exported class B which is in module modb: " + myB2.doIt());
        }
        catch (java.lang.IllegalAccessError err) {
            err.printStackTrace(System.err);     // we expect a java.lang.IllegalAccessError
        }

        // ----------------------------------------------------------------------------------------------------------------------------------

    	// We access a class which is on the classpath, should always work
        System.out.println("3. Calling a class which is on the classpath");
    	pkgboncp.BFromClasspath myB3 = new pkgboncp.BFromClasspath();
        System.out.println("Calling BFromClasspath which is on the classpath: " + myB3.doIt());

        try {
             System.out.println("4. Calling a class which is on the classpath, but whose package name is covered by another class on the module path");

    	     // We access a class which is on the classpath - will not work, but only because the package name "pkgb" is covered by the same class in the same package in modb
          	 pkgb.BFromClasspath myB4 = new pkgb.BFromClasspath();
             System.out.println("ERROR: Calling BFromClasspath whose package is both on the module path and on the classpath - SHOULD NOT WORK: " + myB4.doIt());
        }
        catch (Throwable ex) {
            ex.printStackTrace(System.err);     // we expect a java.lang.ClassNotFoundException
        }

        // ----------------------------------------------------------------------------------------------------------------------------------
                
        System.out.println("5. Calling a class which is on the classpath, but whose class and package name is covered by another class on the module path");

        // We access a class which is on the classpath - will not work, but only because the package name "pkgb" is covered by the same class in the same package in modb
        pkgb.B myB5 = new pkgb.B();
        System.out.println("Calling B which is both on the module path and on the classpath: " + myB5.doIt());
    }
}
