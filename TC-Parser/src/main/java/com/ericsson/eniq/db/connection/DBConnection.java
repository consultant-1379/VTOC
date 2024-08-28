/*------------------------------------------------------------------------------
 *******************************************************************************
 * COPYRIGHT Ericsson 2013
 *
 * The copyright to the computer program(s) herein is the property of
 * Ericsson Inc. The programs may be used and/or copied only with written
 * permission from Ericsson Inc. or in accordance with the terms and
 * conditions stipulated in the agreement/contract under which the
 * program(s) have been supplied.
 *******************************************************************************
 *----------------------------------------------------------------------------*/
package com.ericsson.eniq.db.connection;

import java.io.*;
import java.sql.*;
import java.util.Properties;

public class DBConnection {

    public static Connection getConnection() {
        final Properties prop = loadDbProperties();
        Connection con = null;

        //Class.forName(prop.getProperty("driver"));
        try {
            con = DriverManager.getConnection(prop.getProperty("dbUrl") + prop.getProperty("hostName") + ":" + prop.getProperty("port"),
                    prop.getProperty("userName"), prop.getProperty("password"));
        } catch (final SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }

        return con;
    }

    public static Properties loadDbProperties() {
        final Properties prop = new Properties();
        FileInputStream fis = null;
        try {
            fis = new FileInputStream(new File(System.getProperty("propertyFile")));
            try {
                prop.load(fis);
                fis.close();
            } catch (final IOException e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            }

        } catch (final FileNotFoundException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return prop;

    }

    public static Connection getRepDBConnection() {
        final Properties prop = loadDbProperties();
        Connection con = null;
        try {
            Class.forName(prop.getProperty("driver"));
            try {
                con = DriverManager.getConnection(prop.getProperty("dbUrl") + prop.getProperty("hostName") + ":" + prop.getProperty("repdbport"),
                        prop.getProperty("repdbuserName"), prop.getProperty("repdbpassword"));
            } catch (final SQLException e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            }
        } catch (final ClassNotFoundException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return con;
    }

}
