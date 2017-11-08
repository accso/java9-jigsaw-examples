package pkgmain;

/**
 * This class cannot be compiled in Eclipse as compiler options --add-reads modmain=ALL-UNNAMED are needed.
 * See compile.sh for details. 
 */
public class Main {
    public static void main(String[] args) {
        // ---------------------------------------------------------------
    	// accessing classes on the classpath    	
        System.out.println(new pkgboncp.BFromClasspath().doIt());   // Only compiles and runs with command line option --add-reads modmain=ALL-UNNAMED
        // System.out.println(new pkgb.BFromClasspath().doIt());    // Does not compile because pkgb in cpb is hidden by pkgb of mod b

        // ---------------------------------------------------------------
        // accessing classes on the module path, to module modb
        System.out.println(new pkgb.B().doIt());					// The class is taken from modb, not from cpb!
        System.out.println(new pkgb.BFromModule().doIt());
    }
}
