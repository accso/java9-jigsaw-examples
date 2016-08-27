module modmainfoo { // does not compile (as required modsplitfoo1, modsplitfoo2 both export same package pkgfoo)
    requires modsplitfoo1;
    requires modsplitfoo2;

    // needed so that we can all the Main class via reflection (like e.g. in an "appserver")
    exports pkgmainfoo;
}
