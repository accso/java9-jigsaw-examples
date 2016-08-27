package pkgmain;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import pkgb.B;

public class Main {
    public static void main(String[] args) {

        Main mymain = new Main();  
        B myb = new B();
        System.out.println("Main: " + mymain.toString() + ", B: " + myb.doIt());

        // Logging   
        Logger logger = LoggerFactory.getLogger(Main.class);
        logger.info("This is Main - logging.");
    }
}
