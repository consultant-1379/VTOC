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

import java.util.Collection;
import java.util.LinkedHashMap;
import java.util.Map;

public class SQLCommand {

    /**
     *
     */
    private static final String STR_SPACE = " ";
    private StringBuilder buf;
    public static final String NEW_LINE = System.getProperty("line.separator");

    public void generateDropTableQueries(final String tableName) {
        buf.append("DROP TABLE IF EXISTS ").append(tableName).append(";").append(NEW_LINE);
    }

    public SQLCommand() {
        if (buf == null) {
            buf = new StringBuilder();
        }
    }

    public void createTable(final String table, final Collection<String> columns) {
        try {
            boolean isFirst = true;
            
            buf.append("CREATE TABLE ");
            buf.append(table).append("(").append(NEW_LINE);

            final Map<String, ColumnDetails> columnTypes = getColumnTypes(columns);
            for (final String column : columnTypes.keySet()) {
                if (!isFirst) {
                    buf.append(",").append(NEW_LINE);

                }
                getSchema(buf, columnTypes.get(column));
                isFirst = false;
            }

            buf.append(NEW_LINE).append(");").append(NEW_LINE);
        } finally {
        }
    }

    private Map<String, ColumnDetails> getColumnTypes(final Collection<String> columns) {
        final Map<String, ColumnDetails> columnTypes = new LinkedHashMap<String, ColumnDetails>();
        for (final String column : columns) {
            columnTypes.put(column, ColumnType.getColumnDetails(column));
        }
        return columnTypes;
    }

    private void getSchema(final StringBuilder buf, final ColumnDetails columnDetails) {
        String columnName;
        String columnType;
        String columnSize;
        boolean nullableInfo;

        columnName = columnDetails.getColumnName();
        columnType = columnDetails.getColumnType();
        columnSize = columnDetails.getColumnSize();
        nullableInfo = columnDetails.canBeNull();

        buf.append("    ").append(columnName).append(STR_SPACE).append(columnType);
        if (null != columnSize && !columnSize.trim().equalsIgnoreCase("")) {
            buf.append("(").append(columnSize).append(")").append(STR_SPACE);
        } else {
            buf.append(STR_SPACE);
        }
        if (nullableInfo) {
            buf.append("NULL");
        } else {
            buf.append("NOT NULL");
        }

    }

    /**
     * @return the buf
     */
    public String getQueries() {
        return buf.toString();
    }
}
