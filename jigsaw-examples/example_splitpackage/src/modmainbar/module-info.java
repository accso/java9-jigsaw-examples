module modmainbar {
    // does not compile, if both are required
    requires modsplitbar1;

    // we hence do not require modsplitbar2:
    //    requires modsplitbar2;
    // but we use --add-modules in our run script with which then will prodcue a RuntimeException

    // needed so that we can all the Main class via reflection (like e.g. in an "appserver")
    exports pkgmainbar;
}
