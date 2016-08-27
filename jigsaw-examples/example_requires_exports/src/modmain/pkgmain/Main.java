package pkgmain;

import pkgb.B;

public class Main {
    public static void main(String[] args) {
        Main mymain = new Main();		
        B myb = new B();

        Object myc = myb.getMyC();
        System.out.println("Main: " + mymain.toString() + ", B: " + myb.doIt() + ", C: " + myc.toString());

        // does not compile, as type C not visible here
        // C myc1 = myb.getMyC(); 
        // System.out.println("Main: " + mymain.toString() + ", B: " + myb.doIt() + ", C: " + myc1.doIt());
    }
}
