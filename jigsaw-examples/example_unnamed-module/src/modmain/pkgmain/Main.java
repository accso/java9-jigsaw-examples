package pkgmain;

public class Main {
    public static void main(String[] args) {
        // Does not compile because no access possible from modmain (or any other module) to unnamed module:
        // pkgb.BasCP myBasCP = new BasCP();
    }
}
