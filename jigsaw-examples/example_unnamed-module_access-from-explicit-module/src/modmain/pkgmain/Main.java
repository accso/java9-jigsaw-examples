package pkgmain;

public class Main {
    public static void main(String[] args) {
        System.out.println(new pkgboncp.BFromClasspath().doIt());  // Only compiles and runs with command line option --add-reads modmain=ALL-UNNAMED
        // System.out.println(new pkgb.BFromClasspath().doIt());  // Does not compile because pkgb in cpb is hidden by pkgb of mod b
        System.out.println(new pkgb.BFromModule().doIt());
    }
}
