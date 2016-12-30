module modmain {
    requires slf4j.api;		// note: must not be called slf4j-api (no '-' allowed in module names)
    requires modb;

	// allow reflective access, e.g. in the jerry mouse appserver
	opens pkgmain;
}