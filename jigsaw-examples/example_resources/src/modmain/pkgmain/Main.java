package pkgmain;

import java.io.IOException;

import pkgb.B;
import pkgc.C;

public class Main {
    public static void main(String[] args) throws IOException {
        Main mymain = new Main();		
        B myb = new B();

        C myc = myb.getMyC(); 
        System.out.println("Main: " + mymain.toString() + ", B: " + myb.doIt() + ", C: " + myc.doIt());
        
        System.out.println("B: Get text from modb's properties: " + myb.getTextFromProperties());
        System.out.println("C: Get text from modc's properties: " + myc.getTextFromProperties());
        System.out.println("B: Get text from modc's properties: " + myb.getTextFromMODCsProperties());
    }
}
