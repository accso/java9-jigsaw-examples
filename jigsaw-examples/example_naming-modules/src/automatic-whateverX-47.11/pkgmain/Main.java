package pkgmain;

public class Main {
	public static void main(String[] args) {
		System.out.println("Main: " + Main.class.getName() + ": " 
		   + Main.class.getModule().getDescriptor().toNameAndVersion());
	}
}
