module modb {
    // exports not enough anymore for setAccessible(true) when using reflection.
    // exports pkgb;

    // needed since b136
    exports private pkgb to modmain;

    // if the following "exports dynamic" is not set, then we get the following runtime exception
    //    java.lang.reflect.InaccessibleObjectException: 
    //        Unable to make member of class pkgbinternal.InternalB accessible: 
    //        module modb does not export pkgbinternal to module modmain
    // exports dynamic pkgbinternal; // not supported anymore since b136 (but still in discussion if it comes back)
    
    // needed since b136
    exports private pkgbinternal to modmain;
}
