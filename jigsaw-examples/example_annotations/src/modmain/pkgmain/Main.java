package pkgmain;

import java.io.IOException;
import java.lang.annotation.Annotation;
import java.lang.reflect.Layer;
import java.lang.reflect.Module;

public class Main {
    public static void main(String[] args) throws IOException {
        Module modb = Layer.boot().findModule("modb").get();
        Module modc = Layer.boot().findModule("modc").get();
        
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
