package pkgmain;

import java.lang.Runtime.Version;

public class Main {
	public static void main(String[] args) {
		Version version = Runtime.version();

		String buildVersion = version.build().orElse(null).toString();

		System.out.println("Runtime.version() says, we are using Java version " + version.major() + "."
				+ version.minor() + "." + version.security() + ", build version "
				+ ((buildVersion == null) ? " not available" : buildVersion));

		System.out.println("System properties say, we are using Java version as follows:"
				+ "\n  java.version = " 					+ System.getProperty("java.version") 
				+ "\n  java.runtime.version = " 			+ System.getProperty("java.runtime.version") 
				+ "\n  java.vm.version = " 					+ System.getProperty("java.vm.version") 
				+ "\n  java.specification.version = " 		+ System.getProperty("java.specification.version")
				+ "\n  java.vm.specification.version = " 	+ System.getProperty("java.vm.specification.version") 
				);
	}
}
