package pkgcpmain;

/**
 * This class is on the classpath, i.e. in the unnamed module.
 */
public class Main {
    public static void main(String[] args) {
        
    	// access a class from the classpath, should always work
    	pkgboncp.BasCP myB1 = new pkgboncp.BasCP();
        System.out.println("Calling B from classpath: " + myB1.doIt());

        // access from classpath (i.e. from unnamed module) to a class from module modb, which is exported
        pkgb.BasMod myB2 = new pkgb.BasMod();
        System.out.println("Calling B from module modb: " + myB2.doIt());

        // access from classpath (i.e. from unnamed module) to a class from module modb, which is not exported (results in a RuntimeException, but compiles!)
        pkgbinternal.B myB3 = new pkgbinternal.B();
        System.out.println("Calling B from module modb: " + myB3.doIt());
    }
}
