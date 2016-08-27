package pkgb;

import pkgc.*;

public class B {
    public String doIt() {
        return "from B";
    }

    public C getMyC() {
        return new C();
    }
}
