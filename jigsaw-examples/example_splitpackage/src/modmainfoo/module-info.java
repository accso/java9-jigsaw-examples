module modmainfoo { // does not compile (as required modsplitfoo1, modsplitfoo2 both export same package pkgfoo)
    requires modsplitfoo1;
    requires modsplitfoo2;

	// allow reflective access, e.g. in the jerry mouse appserver
	opens pkgmainfoo;
}
