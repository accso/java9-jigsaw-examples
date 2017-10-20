package pkgmain;

public class Main {
    public static void main(String[] args) throws Exception {
// access to pkga1 (exported from moda)
        pkga.A mya = new pkga.A();
        System.out.println("A: " + mya.doIt());

     }
}
