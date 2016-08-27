package pkgmainbehindfacade;

import pkgb.*;
import pkgc.*;

public class MainBehindFacade {
    public static void main(String[] args) {
        MainBehindFacade mymain = new MainBehindFacade();		
        B myb = new B();
        C myc = myb.getMyC();

        System.out.println("MainBehindFacade: " + mymain.toString() + ", B: " + myb.doIt() + ", C: " + myc.doIt());
    }
}
