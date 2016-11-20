package pkgmain;

import pkgb.*;
import pkgc.*;

public class Main {
    public static void main(String[] args) {
        Main mymain = new Main();		
        B myb = new B();
        C myc = myb.getMyC();

        System.out.println("Main: " + mymain.toString() + ", B: " + myb.doIt() + ", C: " + myc.doIt());
    }
}
