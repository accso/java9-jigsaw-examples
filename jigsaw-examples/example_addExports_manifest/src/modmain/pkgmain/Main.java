package pkgmain;

import jdk.internal.misc.SharedSecrets;

public class Main {
    public static void main(String[] args) {
    	SharedSecrets secrets = new SharedSecrets();
        System.out.println("Do you want to know a secret: " + secrets);
    }
}
