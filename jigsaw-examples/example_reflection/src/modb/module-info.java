module modb {
    // exports not enough anymore for setAccessible(true) when using reflection.
    // opens: since b142 needed for Deep Reflection
    exports  pkgb to modmain;
    opens    pkgb to modmain;
    
    // exports only allows Shallow Reflection
    exports  pkgb1 to modmain;

    // opens: since b142 needed for Deep Reflection
    opens    pkgbinternal /* to modmain */;
}
