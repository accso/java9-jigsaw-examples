import pkgc.CompileTimeAnnotation;
import pkgc.ReallyCoolModule;
import pkgc.RunTimeAnnotation;

/**
 * This module modb is deprecated
 */
@Deprecated
@ReallyCoolModule(wowReason="modb is simply cool")
@CompileTimeAnnotation
@RunTimeAnnotation
module modb {
    exports pkgb;
    
    requires transitive modc;
}
