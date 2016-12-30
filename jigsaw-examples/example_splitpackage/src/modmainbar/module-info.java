module modmainbar {
    // does not compile, if both are required
    requires modsplitbar1;

    // we hence do not require modsplitbar2:
    //    requires modsplitbar2;
    // but we use --add-modules in our run script with which then will prodcue a RuntimeException

	// allow reflective access, e.g. in the jerry mouse appserver
	opens pkgmainbar;
}
