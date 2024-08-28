/*------------------------------------------------------------------------------
 *******************************************************************************
 * COPYRIGHT Ericsson 2016
 *
 * The copyright to the computer program(s) herein is the property of
 * Ericsson Inc. The programs may be used and/or copied only with written
 * permission from Ericsson Inc. or in accordance with the terms and
 * conditions stipulated in the agreement/contract under which the
 * program(s) have been supplied.
 *******************************************************************************
 *----------------------------------------------------------------------------*/
package com.ericsson.eniq.events.topology.utils;

import java.io.*;
import java.util.*;

public class PropertiesReader {

    public static Map<String, String> readFile(final InputStream inputStream) throws IOException {
        BufferedReader bufferReader = null;
        Map<String, String> responseData = null;
        try {
            bufferReader = new BufferedReader(new InputStreamReader(inputStream));

            String line = null;

            responseData = new HashMap<String, String>();
            while ((line = bufferReader.readLine()) != null) {
                final String[] tableInfo = line.split(":");
                responseData.put(tableInfo[0], tableInfo[1]);
            }
        } finally {
            if (bufferReader != null) {
                bufferReader.close();
            }
        }
        return responseData;
    }

    public static Map<String, String> readFileToProperties(final String file) throws IOException {
        final Properties configuration = new Properties();
        String tableName;
        final Map<String, String> responseData = new HashMap<String, String>();
        configuration.clear();
        configuration.load(ClassLoader.class.getResourceAsStream(file));
        final Enumeration<?> enumerator = configuration.propertyNames();
        while (enumerator.hasMoreElements()) {
            tableName = (String) enumerator.nextElement();
            responseData.put(tableName, configuration.getProperty(tableName).trim());
        }
        return responseData;
    }
}
