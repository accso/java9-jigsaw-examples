package pkgautomain;

import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;

import pkga.A;

public class Main {

	public static void main(String[] args) throws NoSuchMethodException, SecurityException, IllegalAccessException, IllegalArgumentException, InvocationTargetException {
		//---- calling class A from classpath.
		// pkga from Unnamed Module is exported to automatic moduels
		
		A myA = new A();
		System.out.println("\nCalling A.doIt(): " + myA.doIt());
		
		//---- calling A via reflection
		Method m = myA.getClass().getDeclaredMethod("doItSecretly");
		m.setAccessible(true);   // A.doItSecretly() is a private method
		System.out.println("Calling A.doItSecretly() via reflection: " + m.invoke(myA));
	}
}
