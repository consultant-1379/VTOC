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

public class ColumnDetails {

    private final String columnName;

    private final String columnType;

    private final String columnSize;

    private final Nullable nullableInfo;

    public ColumnDetails(final String columnName, final String columnType, final String columnSize, final Nullable nullableInfo) {
        this.columnName = columnName;
        this.columnType = columnType;
        this.columnSize = columnSize;
        this.nullableInfo = nullableInfo;
    }

    public String getColumnName() {
        return columnName;
    }

    public String getColumnType() {
        return columnType;
    }

    public String getColumnSize() {
        return columnSize;
    }

    public boolean canBeNull() {
        return nullableInfo == Nullable.CAN_BE_NULL;
    }
}
