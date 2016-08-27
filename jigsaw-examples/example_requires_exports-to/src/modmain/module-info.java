module modmain {
    requires modb1;
    requires modb2;

    // needed so that we can all the Main class via reflection (like e.g. in an "appserver")
    exports pkgmain;
}
