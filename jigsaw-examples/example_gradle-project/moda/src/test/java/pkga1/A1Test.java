package pkga1;

import org.junit.Test;

import static org.junit.Assert.assertTrue;

/**
 * Currently, this test class does not compile in Eclipse but works fine when called from gradle
 * on the command line, see script run-test.sh
 * 
 * TODO: fix this problem - note that junit has been already added to moda's dependencies on the module path
 */
public class A1Test {
    @Test
    public void doIt() {
        assertTrue(new A1().doIt().startsWith("from A1"));
    }

    @Test
    public void getMyC() {
        assertTrue(new A1().getMyC() instanceof pkgc.C);
    }
}
