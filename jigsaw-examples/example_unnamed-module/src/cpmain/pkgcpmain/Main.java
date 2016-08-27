package pkgcpmain;

import pkgb.BasMod;
import pkgboncp.BasCP;

public class Main {
    public static void main(String[] args) {
        BasMod myBasMod = new BasMod();
        BasCP myBasCP = new BasCP();

        System.out.println("From Module: " + myBasMod.doIt() + ", from Classpath: " + myBasCP.doIt());
    }
}
