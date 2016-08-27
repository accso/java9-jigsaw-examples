module modb {
    exports pkgb;

    // if the following "exports dynamic" is not set, then we get the following runtime exception
    //    java.lang.reflect.InaccessibleObjectException: 
    //        Unable to make member of class pkgbinternal.InternalB accessible: 
    //        module modb does not export pkgbinternal to module modmain
    // exports dynamic pkgbinternal;
}
