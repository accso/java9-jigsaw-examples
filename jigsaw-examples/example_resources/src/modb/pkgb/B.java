package pkgb;

import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;

import pkgc.*;

public class B {
    public String doIt() {
        return "from B";
    }

    public C getMyC() {
        return new C();
    }

    // access resources in modb
    public String getTextFromProperties() throws IOException {
    	String resourceFileName = "resources.properties";		// now we get modc's resources.properties
    	
		final Properties properties = new Properties();
		try (final InputStream stream = B.class.getModule().getResourceAsStream(resourceFileName)) {
		    properties.load(stream);
		}
		return properties.getProperty("text", "not found");
    }

    // access resources in modc!
    public String getTextFromMODCsProperties() throws IOException {
    	String resourceFileName = "resources.properties";		// now we get modc's resources.properties

    	final Properties properties = new Properties();
		try (final InputStream stream = C.class.getModule().getResourceAsStream(resourceFileName)) {
		    properties.load(stream);
		}
		return properties.getProperty("text", "not found");
    }
}
