package pkgmain;

// Note that running to get name & version of this automatic module will *NOT* work.

// Expected result:
// JAR-file: automatic-whateverX48.12.jar in amlib3
// java --module-path . -m automatic.whateverX48/pkgmain.Main
// Error occurred during initialization of boot layer
// java.lang.module.FindException: Unable to derive module descriptor for .\automatic-whateverX48.12.jar
// Caused by: java.lang.IllegalArgumentException: automatic.whateverX48.12: Invalid module name: '12' is not a Java identifier

public class Main {
	public static void main(String[] args) {
		System.out.println("Main class " + Main.class.getName() + " from module " 
		   + Main.class.getModule().getDescriptor().toNameAndVersion());
	}
}
