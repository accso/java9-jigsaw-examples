package blackbox;

import static org.junit.Assert.*;

import org.junit.Test;

import pkgmain.Main;

public class FractionTest {

	@Test
	public void test(){
		System.out.println("Module Path: " + System.getProperty("jdk.module.path"));
		assertTrue(Main.getFraction(1,3) > Main.getFraction(1,4));
	}

}
