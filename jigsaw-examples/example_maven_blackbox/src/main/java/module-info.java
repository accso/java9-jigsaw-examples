module modmain {
    requires commons.lang3;

	// allow reflective access, e.g. in the jerry mouse appserver
	opens pkgmain;
	// static access (for blackbox test)
	exports pkgmain;
}