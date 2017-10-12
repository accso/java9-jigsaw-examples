package pkgmain;

public class Main {
	public static void main(String[] args) {
		System.out.println("Main class " + Main.class.getName() + " from module " 
		   + Main.class.getModule().getDescriptor().toNameAndVersion());
	}
}
