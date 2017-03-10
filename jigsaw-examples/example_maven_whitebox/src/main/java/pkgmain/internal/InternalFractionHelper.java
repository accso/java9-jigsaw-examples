package pkgmain.internal;

import org.apache.commons.lang3.math.Fraction;

public class InternalFractionHelper {
	public static double getFraction(int numerator, int denominator) {
		return Fraction.getFraction(numerator, denominator).doubleValue();
	}
}
