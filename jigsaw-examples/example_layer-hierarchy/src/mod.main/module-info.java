module mod.main {
    requires javax.json;
    requires mod.layer;
    
    // allow reflective access, e.g. in the jerry mouse appserver
	opens pkgmain;
}
