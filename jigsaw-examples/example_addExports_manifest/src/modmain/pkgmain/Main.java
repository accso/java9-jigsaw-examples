package pkgmain;

import jdk.internal.misc.SharedSecrets;

public class Main {
    public static void main(String[] args) {
    	// Runtime option needed: --add-exports java.base/jdk.internal.misc=modmain
    	SharedSecrets secrets = new SharedSecrets();
        System.out.println("Do you want to know a secret: " + secrets);

    	// Runtime option needed: --add-exports moda/pkgainternal=modmain
        System.out.println(new pkgainternal.A().doIt());
    }
}
