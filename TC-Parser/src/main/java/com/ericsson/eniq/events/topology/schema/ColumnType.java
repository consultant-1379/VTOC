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
package com.ericsson.eniq.events.topology.schema;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import com.ericsson.eniq.events.topology.utils.PropertiesReader;

public class ColumnType {
    /**
     *
     */
    private static final String SEPERATOR = "\\|";
    private ColumnType columnType;
    private static Map<String, ColumnDetails> columnsDetailsMap = new HashMap<String, ColumnDetails>();

    public ColumnType() {
        if (columnType == null) {
            columnType = new ColumnType();
        }
    }

    public static void put(final String column, final ColumnDetails columndetails) {
        columnsDetailsMap.put(column, columndetails);
    }

    public Map<String, ColumnDetails> getColumnsMap() {
        return columnsDetailsMap;
    }

    public static ColumnDetails getColumnDetails(final String column) {
        return columnsDetailsMap.get(column);
    }

    public static void readColumnSchema() throws IOException {
        final Map<String, String> columnsMap = PropertiesReader.readFileToProperties("/schema/columntype.txt");
        readColumnSchema(columnsMap);

    }

    public static void readColumnSchema(final Map<String, String> columnsMap) throws IOException {
        for (final String column : columnsMap.keySet()) {
            final String[] columnDetails = columnsMap.get(column).split(SEPERATOR);
            updateColumnsDetails(column, columnDetails);
        }

    }
    
    public static void readColumnSchema(String ossParser) throws IOException {
        final Map<String, String> columnsMap = PropertiesReader.readFileToProperties("/schema/osscolumntype.txt");
        readColumnSchema(columnsMap);

    }

    /**
     * @param column
     * @param columnDetails
     */
    private static void updateColumnsDetails(final String column, final String[] columnDetails) {
        String columnName;
        String columnType;
        String columnSize;
        Nullable nullableInfo;
        if (columnDetails.length > 2) {
            columnName = column;
            columnType = columnDetails[0];
            columnSize = columnDetails[1];
            if (columnDetails[2].trim().equalsIgnoreCase("CANNOT_BE_NULL")) {
                nullableInfo = Nullable.CANNOT_BE_NULL;
            } else {
                nullableInfo = Nullable.CAN_BE_NULL;
            }

        } else if (columnDetails.length == 2) {
            columnName = column;
            columnType = columnDetails[0];
            columnSize = columnDetails[1];
            nullableInfo = Nullable.CANNOT_BE_NULL;
        } else {
            columnName = column;
            columnType = columnDetails[0];
            columnSize = null;
            nullableInfo = Nullable.CANNOT_BE_NULL;
        }
        columnsDetailsMap.put(column, new ColumnDetails(columnName, columnType, columnSize, nullableInfo));
    }
}
