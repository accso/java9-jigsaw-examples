package pkgmain;

import java.io.InputStream;
import java.util.Properties;
import java.io.IOException;

import pkgb.B;
import pkgc.C;

public class Main {
    public static void main(String[] args) throws IOException {
        Main mymain = new Main();		
        B myb = new B();

        C myc = myb.getMyC(); 
        System.out.println("Main: " + mymain.toString() + ", B: " + myb.doIt() + ", C: " + myc.doIt());
        
        System.out.println("B: Get text from modb's properties: " + myb.getTextFromProperties());
        System.out.println("C: Get text from modc's properties: " + myc.getTextFromProperties());
        
        // ------------------------------------------------------------------------------------------------------------

        // works, as resources.properties in modc is not encapsulated (because its location is not a package)
        
        System.out.println("B: Get text from modc's properties: " + myb.getTextFromMODCsProperties());

        // ------------------------------------------------------------------------------------------------------------

        System.out.println("Main: Get text from modb's b.properties         , which package is exported:               " + getTextFromMODBProperties("b.properties"));
        System.out.println("Main: Get text from modb's binternal.properties , which package is not exported:           " + getTextFromMODBProperties("binternal.properties"));
        
        System.out.println("Main: Get text from modc's c.properties         , which package is exported:               " + getTextFromMODCProperties("c.properties"));
        System.out.println("Main: Get text from modc's cinternal.properties , which package is not exported:           " + getTextFromMODCProperties("cinternal.properties"));
        System.out.println("Main: Get text from modc's cnopackage.properties, which package is in the unnamed package: " + getTextFromMODCProperties("cnopackage.properties"));
    }
    
    public static String getTextFromMODBProperties(String resourceFileName) throws IOException {
		final Properties properties = new Properties();
		try (final InputStream stream = B.class.getModule().getResourceAsStream(resourceFileName)) {
		    properties.load(stream);
		}
		return properties.getProperty("text", "modc's " + resourceFileName + " not found in modmain");
    }

    public static String getTextFromMODCProperties(String resourceFileName) throws IOException {
		final Properties properties = new Properties();
		try (final InputStream stream = C.class.getModule().getResourceAsStream(resourceFileName)) {
		    properties.load(stream);
		}
		return properties.getProperty("text", "modb's " + resourceFileName + " not found in modmain");
    }

}
