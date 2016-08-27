module modfib {
    exports pkgfib; 
    exports pkgfib.internal to modtest.whitebox;
}
