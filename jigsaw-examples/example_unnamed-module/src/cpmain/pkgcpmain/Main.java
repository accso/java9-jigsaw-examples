package pkgcpmain;

/**
 * This class is on the classpath, i.e. in the unnamed module.
 */
public class Main {
    public static void main(String[] args) {
        System.out.println("We are calling various classes from " + Main.class + " (which is on the classpath, i.e. in the unnamed module)");
        
    	// We access a class which is on the classpath, should always work
    	pkgboncp.BFromClasspath myB1 = new pkgboncp.BFromClasspath();
        System.out.println("Calling B which is on the classpath: " + myB1.doIt());

        // We access a class on the module path, in module modb - class's package is exported, should work
        pkgb.BFromModule myB2 = new pkgb.BFromModule();
        System.out.println("Calling an exported class B which is in module modb: " + myB2.doIt());

        // We access a class on the module path, in module modb - class's package is not exported, results in an java.lang.IllegalAccessError
        pkgbinternal.BFromModuleButInternal myB3 = new pkgbinternal.BFromModuleButInternal();
        System.out.println("Calling an internal, non-exported class B which is in module modb: " + myB3.doIt());
    }
}
