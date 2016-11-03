module modb {
    // exports not enough anymore for setAccessible(true) when using reflection.
    // opens: since b142 needed for Deep Reflection
    exports  pkgb to modmain;
    opens  pkgb to modmain;
    
    // exports only allows Shallow Reflection
    exports pkgb1 to modmain;

    // if the following "opens" is not set, then we get the following runtime exception
    //    java.lang.reflect.InaccessibleObjectException: 
    //         Unable to make pkgbinternal.InternalB() accessible: 
    //         module modb does not "opens pkgbinternal" to module modmain
    // exports dynamic pkgbinternal; // not supported anymore since b136 (but still in discussion if it comes back)
    
    // opens: since b142 needed for Deep Reflection
    opens  pkgbinternal to modmain;
}
