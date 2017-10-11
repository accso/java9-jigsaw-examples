package pkgmain;

// Does not compile because on classpath = unnamed module
// import pkgb.BasCP;
import pkgb.BasMod;

public class Main {

    public static void main(String[] args) {
        BasMod myBasMod = new BasMod();
        
        // Does not compile because from unnamed module:
        // BasCP myBasCP = new BasCP();
 
        System.out.println("BasMod: " + myBasMod.doIt());		
    }
}
