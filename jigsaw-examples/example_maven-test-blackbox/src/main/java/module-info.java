open module modmain { 	// allow reflective access, currently used in the example_jerry-mouse
    requires commons.lang3;

	// allow static access (for blackbox testing)
	exports pkgmain to modmaintest;
}