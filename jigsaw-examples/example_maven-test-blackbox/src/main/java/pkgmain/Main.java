package pkgmain;

import org.apache.commons.lang3.SystemUtils;

import pkgmain.internal.InternalFractionHelper;

public class Main {
    public static void main(String[] args) {
    	System.out.println("User Dir: " + SystemUtils.getUserDir());
    	System.out.println("User Home: " + SystemUtils.getUserHome());
    	
    	System.out.println("1/3=" + InternalFractionHelper.getFraction(1,3));
    }
	
	public static double getFraction(int numerator, int denominator) {
	    return InternalFractionHelper.getFraction(numerator, denominator);
	}
}
