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
package com.ericsson.eniq.events.utils;

import static com.ericsson.eniq.events.utils.Constant.*;

import java.sql.*;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;

import com.ericsson.eniq.db.connection.DBConnection;

public class Utility {

    /**
     * Method to use to identify if Iterable object have all the null value or it is empty.
     *
     * @param array
     * @return boolean
     */
    public static boolean isAllNulls(final Iterable<?> array) {
        for (final Object element : array) {
            if (element != null) {
                return false;
            }
        }
        return true;
    }

    /**
     *
     * @param string
     * @return
     */
    public static String replaceAll(final String string) {
        String updated = string.replaceAll("\\s", STRING_UNDERSCORE).replaceAll("\\%", "rate").replaceAll("\\(", STRING_UNDERSCORE).replaceAll("\\)",STRING_UNDERSCORE)
                .replaceAll("\\/", "").replaceAll("\\,",STRING_UNDERSCORE).replaceAll("Date", "DATE_ID").replaceAll("Time", "Time_ID")
                .replaceAll("-", STRING_UNDERSCORE).replaceAll(":", "").replaceAll("\\.", STRING_UNDERSCORE);
        updated = updated.replaceAll("__", STRING_UNDERSCORE);
        if(updated.endsWith(STRING_UNDERSCORE)){
           int endIndex = updated.lastIndexOf(STRING_UNDERSCORE);
        	updated = updated.substring(0, endIndex);
        }
        return updated.toUpperCase();
    }

    public static String getFdn(final String fileName) {
        String fdn = null;
        try {

            final int startIndex = fileName.indexOf("SubNetwork");
            final int endInndex = fileName.indexOf("_statsfile");
            fdn = fileName.substring(startIndex, endInndex);

        } catch (final Exception e) {
            System.out.println("File Naming Convention is not correct. It should contain SubNetwork and _statsfile.");

        }

        return fdn;
    }

    public static Calendar extractDateFromFile(final String fileName) {
    	 String dateStr =null;
    	 String offsetOperator =null;
    	 String offset =null;
    	 final Calendar calendar = Calendar.getInstance();
    	String fileTime=fileName.substring(fileName.indexOf(".")+1,fileName.indexOf("_"));
        if(fileTime.length()>9)
        {
    	dateStr = fileName.substring(fileName.indexOf("A") + 1, fileName.indexOf("."))
                + fileName.substring(fileName.indexOf(".") + 1, fileName.indexOf("+"));
        offsetOperator = fileName.substring(14, 15);
        offset = fileName.substring(15, 19);
        final SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmm");
        try {
            calendar.setTime(sdf.parse(dateStr));
            final int offSetInMinute = Integer.parseInt(offset.substring(0, 2)) * 60 + Integer.parseInt(offset.substring(2, 4));
            if (offsetOperator.equals("+")) {
                calendar.add(Calendar.MINUTE, offSetInMinute);
            } else {
                calendar.add(Calendar.MINUTE, -(offSetInMinute));
            }
        } catch (final ParseException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        }
        else
        {
        	dateStr = fileName.substring(fileName.indexOf("A") + 1, fileName.indexOf("."))+ fileName.substring(fileName.indexOf(".") + 1, fileName.indexOf("-"));
            final SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmm");
            try {
                calendar.setTime(sdf.parse(dateStr));
            }
            catch (final ParseException e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            }
        }
        return calendar;
    }

    public static Map<String, StringBuilder> getCounterTypeMapping() {
        final Map<String, StringBuilder> counterTypeMap = new HashMap<String, StringBuilder>();
        final Connection con = DBConnection.getConnection();
        PreparedStatement pst = null;
        ResultSet rs = null;
        StringBuilder sb = null;

        try {
            pst = con.prepareStatement(Constant.COUNTER_TYPE_QUERY);
            rs = pst.executeQuery();
            while (rs.next()) {
                if (counterTypeMap.get(rs.getString(1)) == null) {
                    sb = new StringBuilder();
                    sb.append(rs.getString(2));
                    counterTypeMap.put(rs.getString(1), sb);

                } else {
                    counterTypeMap.get(rs.getString(1)).append("," + rs.getString(2));
                }

            }

        } catch (final SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return counterTypeMap;
    }
}
