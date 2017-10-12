module modmain {
    requires moda;

	// allow reflective access, e.g. in the jerry mouse appserver
	opens pkgmain;
}
