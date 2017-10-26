package pkga1;

import org.junit.Test;

import static org.junit.Assert.assertTrue;

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
