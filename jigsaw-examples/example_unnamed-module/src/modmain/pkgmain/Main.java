package pkgmain;

public class Main {
    public static void main(String[] args) {
        pkgb.BFromClasspath myBasCP = new pkgb.BFromClasspath(); // Does not compile because no access possible from explicit module modmain to unnamed module
    }
}
