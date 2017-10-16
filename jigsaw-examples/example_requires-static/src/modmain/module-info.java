module modmain {
    requires static modb;

	// allow reflective access, e.g. in the jerry mouse appserver
	opens pkgmain;
}
