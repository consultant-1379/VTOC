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

import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

public class TableSchema {
    private static Map<String, ArrayList<String>> tableSchema = new LinkedHashMap<String, ArrayList<String>>();

    public static List<String> getTableSchema(final String table) {
        return tableSchema.get(table);
    }

    public static void generateTableSchema(final String tableName, final String columns) {
        for (final String column : columns.split("\\|")) {
            if (tableSchema.get(tableName) != null) {
                tableSchema.get(tableName).add(column);
            } else {
                tableSchema.put(tableName, new ArrayList<String>());
                tableSchema.get(tableName).add(column);
            }
        }
    }
}
