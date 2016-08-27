module modc {
    // does not work in Eclipse, if modb1 and modb2 are separate Eclipse projects
    //    because project dependencies to modb1, modb2 are not available 
    //    (and cannot be modelled, as otherwise we get cyclic dependencies)
    exports pkgc to modb1, modb2;
}
