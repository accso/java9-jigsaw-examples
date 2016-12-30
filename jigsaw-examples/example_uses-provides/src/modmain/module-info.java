module modmain { 
    requires modservicedefinition;

	// allow reflective access, e.g. in the jerry mouse appserver
	opens pkgmain;
}