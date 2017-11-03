package whitebox;

import static org.junit.Assert.*;

import org.junit.Test;

import pkgmain.internal.InternalFractionHelper;

public class InternalFractionHelperTest {
	@Test
	public void test(){
		// System.out.println("Module Path: " + System.getProperty("jdk.module.path"));

		assertTrue(InternalFractionHelper.getFraction(1,3) > InternalFractionHelper.getFraction(1,4));
		System.out.println("Test run successfully...");
	}
}
