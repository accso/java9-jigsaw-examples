package pkgmain;

import java.io.IOException;
import java.lang.annotation.Annotation;
import java.lang.ModuleLayer;
import java.lang.Module;

public class Main {
    public static void main(String[] args) throws IOException {
        Module modb = ModuleLayer.boot().findModule("modb").get();
        Module modc = ModuleLayer.boot().findModule("modc").get();
        
        System.out.println("Annotations of modb");
        for (Annotation annotation: modb.getAnnotations()) {
        	System.out.println("- " + annotation);	
        }
        
        System.out.println("Annotations of modc");
        for (Annotation annotation: modc.getAnnotations()) {
        	System.out.println("- " + annotation);	
        }
        
    }
}
