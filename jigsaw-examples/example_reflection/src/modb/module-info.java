module modb {
    // exports pkgb;
	// exports not enough anymore for setAccessible(true) when using reflection.
    exports private pkgb;

    // if the following "exports dynamic" is not set, then we get the following runtime exception
    //    java.lang.reflect.InaccessibleObjectException: 
    //        Unable to make member of class pkgbinternal.InternalB accessible: 
    //        module modb does not export pkgbinternal to module modmain
    // exports dynamic pkgbinternal; // not supported anymore since b136 (but still in discussion if it comes back
    
    // ... now must be exports private
    exports private pkgbinternal;
}
