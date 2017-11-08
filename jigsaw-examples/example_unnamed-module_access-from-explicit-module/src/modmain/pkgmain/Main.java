package pkgmain;

public class Main {
    public static void main(String[] args) {
        System.out.println(new pkgb.BFromClasspath().doIt());  // Does not compile because no access possible from explicit module modmain to unnamed module
        System.out.println(new pkgb.BFromModule().doIt());
    }
}
