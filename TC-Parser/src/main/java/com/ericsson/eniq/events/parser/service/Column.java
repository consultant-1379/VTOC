package com.ericsson.eniq.events.parser.service;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import org.apache.poi.ss.usermodel.Cell;

public final class Column {

    private final String columnName;

    private final int columnIndex;

    private boolean isMergedColumn;

    private List<Integer> mergedColumnCells;

    private List<String> subColumnCellsName;

    public Column(final String columnName, final int columnIndex) {
        this.columnName = columnName;
        this.columnIndex = columnIndex;
    }

    public String getColumnName() {
        return columnName;
    }

    public int getColumnIndex() {
        return columnIndex;
    }

    public boolean isMergedColumn() {
        return isMergedColumn;
    }

    public List<Integer> getMergedColumnCells() {
        return mergedColumnCells;
    }

    public List<String> getSubColumnCellsName() {
        return subColumnCellsName;
    }

    /**
     * @param isMergedColumn
     *            the isMergedColumn to set
     */
    public void setMergedColumn(final boolean isMergedColumn) {
        this.isMergedColumn = isMergedColumn;
    }

    public void setSubColumnCellsName(Cell cell, final Iterator<Cell> cellIterator) {
        subColumnCellsName = new ArrayList<>();
        subColumnCellsName.add(cell.getStringCellValue());
        for (int subCell = 0; subCell < getMergedColumnCells().size() - 1; subCell++) {
            cell = cellIterator.next();
            subColumnCellsName.add(cell.getStringCellValue());
        }

    }

    public void setMergedColumnCells(int startValue, final int endValue) {
        mergedColumnCells = new ArrayList<>();
        while (startValue <= endValue) {
            mergedColumnCells.add(startValue++);
        }
    }

    @Override
    public int hashCode() {
        final int prime = 31;
        int result = 1;
        result = prime * result + columnIndex;
        result = prime * result + ((columnName == null) ? 0 : columnName.hashCode());
        result = prime * result + (isMergedColumn ? 1231 : 1237);
        result = prime * result + ((mergedColumnCells == null) ? 0 : mergedColumnCells.hashCode());
        result = prime * result + ((subColumnCellsName == null) ? 0 : subColumnCellsName.hashCode());
        return result;
    }

    @Override
    public boolean equals(final Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj == null) {
            return false;
        }
        if (getClass() != obj.getClass()) {
            return false;
        }
        final Column other = (Column) obj;
        if (columnIndex != other.columnIndex) {
            return false;
        }
        if (columnName == null) {
            if (other.columnName != null) {
                return false;
            }
        } else if (!columnName.equals(other.columnName)) {
            return false;
        }
        if (isMergedColumn != other.isMergedColumn) {
            return false;
        }
        if (mergedColumnCells == null) {
            if (other.mergedColumnCells != null) {
                return false;
            }
        } else if (!mergedColumnCells.equals(other.mergedColumnCells)) {
            return false;
        }
        if (subColumnCellsName == null) {
            if (other.subColumnCellsName != null) {
                return false;
            }
        } else if (!subColumnCellsName.equals(other.subColumnCellsName)) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        final StringBuilder builder = new StringBuilder();
        builder.append("Column [columnName=");
        builder.append(columnName);
        builder.append(", columnIndex=");
        builder.append(columnIndex);
        builder.append(", isMergedColumn=");
        builder.append(isMergedColumn);
        builder.append(", mergedColumnCells=");
        builder.append(mergedColumnCells);
        builder.append(", subColumnCellsName=");
        builder.append(subColumnCellsName);
        builder.append("]");
        return builder.toString();
    }

}
