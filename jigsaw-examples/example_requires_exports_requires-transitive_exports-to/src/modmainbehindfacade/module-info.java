module modmainbehindfacade {
    requires modfacade;

	// allow reflective access, e.g. in the jerry mouse appserver
	opens pkgmainbehindfacade;
}
