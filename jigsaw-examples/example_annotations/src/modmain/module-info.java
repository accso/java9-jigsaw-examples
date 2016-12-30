module modmain {
    requires modb;
    requires modc;

	// allow reflective access, e.g. in the jerry mouse appserver
	opens pkgmain;
}
