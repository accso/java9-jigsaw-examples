package pkgmain;

import java.lang.reflect.Method;

import pkga.A;				// pkga from Unnamed Module is exported and opened to Automatic Modules only

public class Main {
	public static void main(String[] args) throws Exception {
		// 1. calling class A from classpath.
		A myA = new A();
		System.out.println("\nCalling A.doIt(): " + myA.doIt());
		
		// 2. calling A via reflection
		Method m = myA.getClass().getDeclaredMethod("doItSecretly");
		m.setAccessible(true);   // A.doItSecretly() is a private method
		System.out.println("Calling A.doItSecretly() via reflection: " + m.invoke(myA));
	}
}
