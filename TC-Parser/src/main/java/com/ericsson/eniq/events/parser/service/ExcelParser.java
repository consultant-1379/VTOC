/*------------------------------------------------------------------------------
 *******************************************************************************
 * COPYRIGHT Ericsson 2017
 *
 * The copyright to the computer program(s) herein is the property of
 * Ericsson Inc. The programs may be used and/or copied only with written
 * permission from Ericsson Inc. or in accordance with the terms and
 * conditions stipulated in the agreement/contract under which the
 * program(s) have been supplied.
 *******************************************************************************
 *----------------------------------------------------------------------------*/
/**
 * @author Pranav
 *
 */
package com.ericsson.eniq.events.parser.service;

import static com.ericsson.eniq.events.utils.Constant.CELL_TYPE_BLANK;
import static com.ericsson.eniq.events.utils.Constant.CELL_TYPE_NUMERIC;
import static com.ericsson.eniq.events.utils.Constant.CELL_TYPE_STRING;
import static com.ericsson.eniq.events.utils.Constant.DATE_FORMAT;
import static com.ericsson.eniq.events.utils.Constant.EMPTY_STRING;
import static com.ericsson.eniq.events.utils.Constant.STRING_COLON;
import static com.ericsson.eniq.events.utils.Constant.STRING_DATE;
import static com.ericsson.eniq.events.utils.Constant.STRING_DAY;
import static com.ericsson.eniq.events.utils.Constant.STRING_HOUR;
import static com.ericsson.eniq.events.utils.Constant.STRING_RAW;
import static com.ericsson.eniq.events.utils.Constant.STRING_TIME;
import static com.ericsson.eniq.events.utils.Constant.STRING_UNDERSCORE;
import static com.ericsson.eniq.events.utils.Utility.isAllNulls;
import static com.ericsson.eniq.events.utils.Utility.replaceAll;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.logging.Level;

import org.apache.poi.hssf.usermodel.HSSFPatriarch;
import org.apache.poi.openxml4j.exceptions.InvalidFormatException;
import org.apache.poi.ss.formula.functions.T;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Drawing;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.ss.usermodel.WorkbookFactory;
import org.apache.poi.ss.util.CellRangeAddress;
import org.apache.poi.xssf.usermodel.XSSFDrawing;
import org.apache.xmlbeans.XmlException;

import com.ericsson.eniq.events.parser.factory.ParserType;
import com.ericsson.eniq.events.topology.utils.FileUtils;
import com.ericsson.eniq.events.utils.Utility;
import com.ericsson.eniq.events.utils.logging.ParserLogger;


public class ExcelParser implements IParser<T> {

    public static Map<Integer, Boolean> chartSheetIndexMap = new HashMap<>();
    public static Map<Integer, Column> columnIndexNameMap = new LinkedHashMap<>();

    private ArrayList<List<String>> rowsData;
    public List<Integer> blankColumnIndex;

    private boolean isRawTable = false;

    protected String inputLocation;

    protected String outputLocation;

    /**
     * @return the inputLocation
     */
    public String getInputLocation() {
        return inputLocation;
    }

    /**
     * @return the outputLocation
     */
    public String getOutputLocation() {
        return outputLocation;
    }

    @Override
    public void parseStream(final byte[] bytes, final Object out, final String inputFileName) throws Exception, CorruptedException {
        throw new IllegalAccessException("Stream data parse is not supported !!!!");

    }

    @Override
    public void parserService(final String inputLocation, final String outputLocation,final String parserType,final String parserOption) throws IOException, XmlException, InvalidFormatException {
        this.inputLocation = inputLocation;
        this.outputLocation = outputLocation;
        final Collection<File> fileList = org.apache.commons.io.FileUtils.listFiles(new File(inputLocation), new String[] { "xlsx" ,"xls"}, true);
        System.out.println(String.format("Total excel file in %s need to parse : %d", inputLocation, fileList.size()));
        ParserLogger.log(Level.INFO, String.format("Total excel file in %s need to parse : %d", inputLocation, fileList.size()));
        System.out.println(String.format("Starting excel parsing ..."));
        ParserLogger.log(Level.INFO, String.format("Starting excel parsing ..."));
        processFiles(fileList);
        System.out.println(String.format("Finish excel parsing !!!!"));
        ParserLogger.log(Level.INFO, String.format("Finish excel parsing !!!!"));

    }

    @Override
    public String getParserType() {
        return ParserType.EXCEL.name();
    }

    public void processFiles(final Collection<File> fileList) {
        if (fileList.size() > 1) {
            throw new IllegalArgumentException("Excel files should  not exceed by one.");
        }
        FileInputStream fis = null;
        Workbook workbook = null;
        for (final File file : fileList) {
            String Fname=file.toString();
            String extensionofFile = Fname.substring(Fname.lastIndexOf(".") + 1,Fname.length());
            isRawTable = false;

            try {

                fis = new FileInputStream(file);

                workbook = WorkbookFactory.create(fis);

                //For loop to store count of images in a  map from each sheet of excel.

                for (int sheetNumber = 0; sheetNumber < workbook.getNumberOfSheets(); sheetNumber++) {
                    final Sheet sheet = workbook.getSheetAt(sheetNumber);
                    final Drawing drawing = sheet.createDrawingPatriarch();

                    final int count = drawing instanceof HSSFPatriarch ? ((HSSFPatriarch) drawing).countOfAllChildren() : ((XSSFDrawing)drawing).getShapes().size();
                    chartSheetIndexMap.put(sheetNumber, count > 0);
                }
                processSheets(workbook);

            } catch (final Exception e) {
                e.printStackTrace();
            }

        }
    }

    private void processSheets(final Workbook workbook) throws IOException {
        String tempTableSuffix = EMPTY_STRING;
        for (int sheetNumber = 0; sheetNumber < workbook.getNumberOfSheets(); sheetNumber++) {
            columnIndexNameMap.clear();
            final Sheet sheet = workbook.getSheetAt(sheetNumber);
            System.out.println(String.format("start processing %s Sheet....", sheet.getSheetName()));
            ParserLogger.log(Level.INFO, String.format("start processing %s Sheet....", sheet.getSheetName()));
            rowsData = new ArrayList<List<String>>();
            blankColumnIndex = new ArrayList<Integer>();

            if (!(chartSheetIndexMap.get(sheetNumber))) {
                final int nonEmptyRowIndex = getFirstNonEmptyRow(sheet);
                getAllColumnHeader(sheet, nonEmptyRowIndex, getMaxMergedRows(sheet));
                final int maxColumnIndex = sheet.getRow(nonEmptyRowIndex).getLastCellNum();
                updateBlankColumnIndex(maxColumnIndex);
                processRowData(sheet, getMaxMergedRows(sheet), maxColumnIndex);
                tempTableSuffix = generateTableSchema(replaceAll(sheet.getSheetName()),tempTableSuffix);
            }

        }
    }

    /**
     * @throws IOException
     */

    protected String generateTableSchema(String tableName, String tempTableSuffix) throws IOException {


        final Map<String, String> tableColumnMap = new LinkedHashMap<>();
        final Map<String, String> columnsDetailsMap = new LinkedHashMap<>();
        final StringBuilder sb = new StringBuilder();
        for (final int index : columnIndexNameMap.keySet()) {
            final Column header = columnIndexNameMap.get(index);
            if (header.isMergedColumn() && header.getSubColumnCellsName() != null) {
                for (final String subHeader : header.getSubColumnCellsName()) {
                    sb.setLength(0);
					String s=replaceAll(subHeader);
                    columnsDetailsMap.put(replaceAll(sb.append(header.getColumnName()).append(STRING_UNDERSCORE).append(s).toString()),
                            "VARCHAR|100|CAN_BE_NULL");
                }

            } else {
                final String columnName = header.getColumnName();
                if (columnName.equalsIgnoreCase(STRING_TIME)) {
                    tempTableSuffix = isRawTable ? STRING_RAW : STRING_HOUR;
                    columnsDetailsMap.put("HOUR_ID", "TINYINT||CAN_BE_NULL");
                    columnsDetailsMap.put("MIN_ID", "TINYINT||CAN_BE_NULL");
                } else {
                    columnsDetailsMap.put(replaceAll(header.getColumnName()), "VARCHAR|100|CAN_BE_NULL");
                }

            }

        }
        sb.setLength(0);
        tableName = tempTableSuffix.equals(EMPTY_STRING) ? sb.append(tableName).append(STRING_UNDERSCORE).append(STRING_DAY).toString() : sb
                .append(tableName).append(STRING_UNDERSCORE).append(tempTableSuffix).toString();
        sb.setLength(0);
        String prefix = EMPTY_STRING;
        for (final String columnName : columnsDetailsMap.keySet()) {
            sb.append(prefix);
            prefix = "|";
            sb.append(columnName);
        }
        tableColumnMap.put(tableName, sb.toString());
        FileUtils.writeToFile(outputLocation, getParserType(), tableColumnMap, columnsDetailsMap);
        if (!Utility.isAllNulls(rowsData)) {
            FileUtils.writeToFile(outputLocation, getParserType(), tableColumnMap, rowsData);
        }
        return tempTableSuffix;
    }

    private int getFirstNonEmptyRow(final Sheet sheet) {
        int rowNumber = 0;
        while (isRowEmpty(sheet.getRow(rowNumber))) {
            rowNumber++;
        }
        return rowNumber;

    }

    private boolean isRowEmpty(final Row row) {
        for (int cellNumber = row.getFirstCellNum(); cellNumber < row.getLastCellNum(); cellNumber++) {
            final Cell cell = row.getCell(cellNumber);
            if (cell != null && cell.getCellType() != Cell.CELL_TYPE_BLANK) {
                return false;
            }
        }
        return true;
    }

    private void getAllColumnHeader(final Sheet sheet, final int nonEmptyRowIndex, final int maxMergedRows) {
        final Iterator<Row> rowIterator = sheet.iterator();
        int noOfrowsRead = 0;
        while (rowIterator.hasNext()) {
            final Row row = rowIterator.next();
            if (++noOfrowsRead > maxMergedRows) {
                break;
            }
            //For each row, iterate through all the columns
            final Iterator<Cell> cellIterator = row.cellIterator();

            outer: while (cellIterator.hasNext()) {
                final Cell cell = cellIterator.next();
                Column column = null;
                //will iterate over the Merged cells

                for (int i = 0; i < sheet.getNumMergedRegions(); i++) {
                    final CellRangeAddress region = sheet.getMergedRegion(i); //Region of merged cells

                    final int colIndex = region.getFirstColumn(); //number of columns merged
                    final int rowNum = region.getFirstRow(); //number of rows merged
                    final int lastColIndex = region.getLastColumn();

                    //check first cell of the region

                    if (rowNum == cell.getRowIndex() && colIndex == cell.getColumnIndex()) {
                        column = new Column(cell.getStringCellValue(), colIndex);
                        column.setMergedColumn(region.getNumberOfCells() > 0);
                        column.setMergedColumnCells(colIndex, lastColIndex);
                        columnIndexNameMap.put(colIndex, column);
                        continue outer;
                    }
                }
                //the data in merge cells is always present on the first cell. All other cells(in merged region) are considered blank
                if (cell.getCellType() == Cell.CELL_TYPE_BLANK || cell == null) {
                    continue;
                }
                if (columnIndexNameMap.get(cell.getColumnIndex()) != null) {
                    if (columnIndexNameMap.get(cell.getColumnIndex()).isMergedColumn()) {
                        columnIndexNameMap.get(cell.getColumnIndex()).setSubColumnCellsName(cell, cellIterator);
                    }
                } else {
                    column = new Column(cell.getStringCellValue(), cell.getColumnIndex());
                    column.setMergedColumn(false);
                    columnIndexNameMap.put(cell.getColumnIndex(), column);
                }
            }
        }
    }

    private void processRowData(final Sheet sheet, final int noOfheaderRows, final int maxColumnIndex) {
        final Iterator<Row> rowIterator = sheet.iterator();
        List<String> data = null;
        List<Integer> timeInMin=new ArrayList<Integer>();
        int processedRow = 0;
        while (rowIterator.hasNext()) {
            final Row row = rowIterator.next();
            if (++processedRow <= noOfheaderRows) {
                ParserLogger.log(Level.INFO, String.format("Skipping header rows at  %s", processedRow));
                continue;
            }
            data = new ArrayList<String>();
            for (int cell = 0; cell < maxColumnIndex; cell++) {
                extractDataFromCell(data, cell, false, row,timeInMin);
            }

            if (!isAllNulls(data)) {
                rowsData.add(data);
            }
        }
        if(timeInMin.size()>=2)
        {
        for(int j=0;j<1;j++)
        {
        	int diff=timeInMin.get(j+1)-timeInMin.get(j);
        	if(diff==15)
                isRawTable = true;
        }
        }
    }
    private void updateBlankColumnIndex(final int row) {
        final List<Integer> tempBlankColumnIndex = new ArrayList<>();
        for (int colIndex = 0; colIndex < row; colIndex++) {
            tempBlankColumnIndex.add(colIndex);
        }
        final Set<Integer> indexes = columnIndexNameMap.keySet();
        for (final Integer index : indexes) {
            tempBlankColumnIndex.remove(index);
            ParserLogger.log(Level.INFO, String.format("Deleting columnIndexNameMap indexes from tempBlankColumnIndex at %s ", index));
        }
        for (final int key : indexes) {
            final Column header = columnIndexNameMap.get(key);
            if (header.isMergedColumn() && header.getSubColumnCellsName() != null && header.getMergedColumnCells() != null) {
                for (final Integer index : header.getMergedColumnCells()) {
                    tempBlankColumnIndex.remove(index);
                    ParserLogger.log(Level.INFO, String.format("Deleting columnIndexNameMap indexes of merged regions from tempBlankColumnIndex at %s ", index));
                }
            }
        }
        for (final int index : tempBlankColumnIndex) {
            blankColumnIndex.add(index);
            ParserLogger.log(Level.INFO, String.format("Adding indexes to blankColumnIndex map %s ", index));
        }
    }

    private String getColumnNameFromMap(final Map<Integer, Column> columnMap, final int indexToLookup) {
        String columnName = EMPTY_STRING;
        final Set<Integer> indexes = columnMap.keySet();
        if ((indexes.size() - 1) < indexToLookup) {
            return columnName;
        }
        if (indexes.contains(indexToLookup)) {
            columnName = columnMap.get(indexToLookup).getColumnName();
        } else {
            for (final int key : indexes) {
                final Column header = columnMap.get(key);
                if (header.isMergedColumn() && header.getSubColumnCellsName() != null && header.getMergedColumnCells() != null
                        && header.getMergedColumnCells().contains(indexToLookup)) {
                    columnName = header.getSubColumnCellsName().get(header.getMergedColumnCells().indexOf(indexToLookup));
                }
            }
        }

        return columnName;
    }

    private void extractDataFromCell(final List<String> data, final int cell, final boolean isSplitRequired, final Row row,List<Integer> timeInMin) {

        final Cell c = row.getCell(cell, Row.RETURN_BLANK_AS_NULL);
        if (c == null && blankColumnIndex.contains(cell)) {
            return;
        }
        if (c == null) {
            data.add(null);
            return;
        }
        final int columnType = c.getCellType();
        switch (columnType) {
            case CELL_TYPE_NUMERIC:
                if (getColumnNameFromMap(columnIndexNameMap, cell).equalsIgnoreCase(STRING_DATE)) {
                    final SimpleDateFormat format = new SimpleDateFormat(DATE_FORMAT);
                    data.add(format.format(c.getDateCellValue()));
                } else {
                    data.add(String.valueOf(c.getNumericCellValue()));
                }
                break;
            case CELL_TYPE_STRING:

                if (getColumnNameFromMap(columnIndexNameMap, cell).equalsIgnoreCase(STRING_TIME)) {
                    final String[] timeAttribute = c.getStringCellValue().trim().split(STRING_COLON);
                    int timeVar=0;
                   String hour =timeAttribute[0];
                    	if(hour.contains("00")){
                    	timeVar = (24*60) +Integer.parseInt((timeAttribute[1]));
                    }
                    else{
                    	timeVar = (Integer.parseInt(timeAttribute[0])*60) +Integer.parseInt((timeAttribute[1]));
                    }
                    timeInMin.add(timeVar);
                  for (final String attribute : timeAttribute) {
                        data.add(attribute);
                    }
                } else {
                    data.add(c.getStringCellValue());
                }

                break;
            case CELL_TYPE_BLANK:
                data.add(null);
                break;
            default:

        }

    }

    private int getMaxMergedRows(final Sheet sheet) {
        final Iterator<Row> rowIterator = sheet.iterator();
        int maxMergedValue = 1;
        while (rowIterator.hasNext()) {
            final Row row = rowIterator.next();
            for (int columnNumber = 0; columnNumber < row.getSheet().getNumMergedRegions(); columnNumber++) {
                row.getLastCellNum();
                if (row.getSheet().getNumMergedRegions() > 0) {
                    final CellRangeAddress region = row.getSheet().getMergedRegion(columnNumber);
                    final int tempMaxMergedValue = region.getLastRow() + 1; // added 1 because it return 0 index based number
                    if (tempMaxMergedValue > maxMergedValue) {
                        maxMergedValue = tempMaxMergedValue;
                    }

                }

            }
        }
        return maxMergedValue;
    }

	@Override
	public void ossParserService(String inputLocation, String ossSourceLocation, String outputlocation,
			String parserType, String parserOption, String ossParser)
			throws IOException, XmlException, InvalidFormatException {
		// TODO Auto-generated method stub

	}



}