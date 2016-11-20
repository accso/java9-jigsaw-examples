module modmainbehindfacade {
    requires modfacade;

    // needed so that we can all the Main class via reflection (like e.g. in an "appserver")
    exports pkgmainbehindfacade;
}
