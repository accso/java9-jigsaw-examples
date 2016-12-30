module modmain {
    requires modcallbackhandler;
    requires modcallee;

	// allow reflective access, e.g. in the jerry mouse appserver
	opens pkgmain;
}
