package com.ericsson.eniq.events.utils.logging;

import java.io.*;
import java.util.Properties;

public class LoadLoggerProperties {
    private static final String PROPERTIES_FILE = "logger.properties";
    protected static final String USER_SYSTEM_PATH = System.getProperty("user.dir");
    protected static final String CONFIG_FOLDER_PATH = USER_SYSTEM_PATH + File.separator + ".." + File.separator + "config";
    //######################## use this veriable for local run
    protected static final String LOCAL_CONFIG_FOLDER_PATH = "/config/logger.properties";
    protected static String FHANDLER_LOG_LEVEL;
    protected static String STDOUT_REDIRECT;
    static {
        final Properties preferences = new Properties();
        try {
            System.out.println(CONFIG_FOLDER_PATH + File.separatorChar + PROPERTIES_FILE);
            final FileInputStream configFile = new FileInputStream(CONFIG_FOLDER_PATH + File.separatorChar + PROPERTIES_FILE);
            preferences.load(configFile);
            FHANDLER_LOG_LEVEL = preferences.getProperty("FileHandler.level");
            STDOUT_REDIRECT = preferences.getProperty("DifferenceCalculator.stdout");
        } catch (final IOException ex) {
            try {
                preferences.load(LoadLoggerProperties.class.getClass().getResourceAsStream(LOCAL_CONFIG_FOLDER_PATH));
                FHANDLER_LOG_LEVEL = preferences.getProperty("FileHandler.level");
                STDOUT_REDIRECT = preferences.getProperty("DifferenceCalculator.stdout");
            } catch (final IOException e) {
                System.out.println("WARNING: Could not open configuration file");
                System.out.println("WARNING: Logging not configured (console output only)");
            }

        }

    }

}
