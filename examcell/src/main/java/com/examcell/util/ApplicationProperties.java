package com.examcell.util;
import java.util.ResourceBundle;
public class ApplicationProperties {
	private static ResourceBundle resourceBundle = ResourceBundle.getBundle("application");

	
	private ApplicationProperties() {
	    throw new IllegalStateException("ApplicationProperties class");
	  }

         
    public static String getPropertyValue(String key){
    	return resourceBundle.getString(key);
    }
    
}

