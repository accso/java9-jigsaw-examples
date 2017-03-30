module modmain {
    requires commons.lang;

	// allow reflective access, e.g. in the jerry mouse appserver
	opens pkgmain;
	// static access (for blackbox test)
	exports pkgmain;
}