module modmain {
    requires modb1;
    requires modb2;

	// allow reflective access, e.g. in the jerry mouse appserver
	opens pkgmain;
}
