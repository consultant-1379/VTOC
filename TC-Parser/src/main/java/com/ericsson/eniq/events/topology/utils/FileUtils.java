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

import static com.ericsson.eniq.events.utils.Constant.*;

import java.io.*;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.*;
import java.util.logging.Level;
import java.util.zip.GZIPInputStream;

import com.ericsson.eniq.events.parser.factory.ParserType;
import com.ericsson.eniq.events.parser.service.Summary;
import com.ericsson.eniq.events.topology.mo.EnodeBOutput;
import com.ericsson.eniq.events.topology.schema.*;
import com.ericsson.eniq.events.utils.Constant;
import com.ericsson.eniq.events.utils.logging.ParserLogger;

public class FileUtils {

	private static final DateFormat OUTOUTFILE_TSTAMP_FORMATTER = new SimpleDateFormat("yyyyMMdd_HHmmssSSS");
	public static final String DEFAULT_OUTPUT_LOCATION = getBasePath();

	public static void writeOutput(final OutputStream out, final String createSQL) {
         try (PrintWriter writer = new PrintWriter(out)) {
			writer.print(createSQL);
		}
	}

	public static void writeOutput(final OutputStream out, final Set<String> values) {
		try (PrintWriter writer = new PrintWriter(out)) {
			for (final String value : values) {
				writer.println(value);
			}
		}
	}

	public static void writeOutput(final OutputStream out, final List<String> values) {

		try (PrintWriter writer = new PrintWriter(out)) {
			for (final String value : values) {
				writer.println(value);
			}
		}
	}

	public static void writeToFile(final String outputLocation, final Map<String, Set<String>> pmgroupMap,
			final Map<String, Set<String>> pmGroupEsCounter, Set<String> MOID, String ossParser)
					throws FileNotFoundException {
		final String filename = getOutputFileName(outputLocation, ossParser, STRING_INSERT, FILE_EXT_SQL);
		final String queries = QueryGenerator.generateInsertQueries(pmgroupMap, pmGroupEsCounter, MOID);
		writeFile(filename, queries);
	}

	public static void writeTopmESCounterMap(final Summary summary, final String tableType,
			Map<String, Set<String>> pmGroupEsCounter) throws FileNotFoundException {
		QueryGenerator.populateEsPmCounterTable(summary, pmGroupEsCounter);

	}

	public static void writeToFile(final String outputLocation, final EnodeBOutput eNBoutput)
			throws FileNotFoundException {
		final String filename = getOutputFileName(outputLocation, ParserType.TOPOLOGY.parserType(), STRING_INSERT,
				FILE_EXT_SQL);
		final String queries = QueryGenerator.generateInsertQueries(eNBoutput);
		writeFile(filename, queries);
	}

	public static void writeToFile(final String outputLocation, final Summary summary, final Set<String> tableColumns)
			throws FileNotFoundException {
		final String filename = getOutputFileName(outputLocation, ParserType.COUNTER.parserType(), STRING_INSERT,
				FILE_EXT_SQL);
		final String queries = QueryGenerator.generateInsertQueries(summary, tableColumns);
		writeFile(filename, queries);
	}

	/*
	 * public static void writeToFile(final String outputLocation, final Summary
	 * summary, final Map<String, Set<String>> moIdWiseTableColumns, final
	 * String tableType) throws FileNotFoundException { final String filename =
	 * getOutputFileName(outputLocation, ParserType.COUNTER.parserType(),
	 * STRING_INSERT, FILE_EXT_SQL); final String queries =
	 * QueryGenerator.generateInsertQueries(summary, moIdWiseTableColumns,
	 * tableType); writeFile(filename, queries);
	 *
	 * }
	 */
	public static void writeToTableColumnMap(final Summary summary, final Map<String, Set<String>> moIdWiseTableColumns,
			final String tableType, final Map<String, String> mimColumnMap) throws FileNotFoundException {
		if (mimColumnMap.size() > 0) {
			QueryGenerator.populatemoidTableColumnsMim(summary, moIdWiseTableColumns, tableType, mimColumnMap);
		} else {
			QueryGenerator.populatemoidTableColumns(summary, moIdWiseTableColumns, tableType);
		}

	}

	public static Map<String, List<List<String>>> writeToLoadTableMap(final String outputLocation,
			final Summary summary, final Map<String, Set<String>> moIdWiseTableColumns, final String tableType,
			Map<String, List<List<String>>> mapLoadTable, final Map<String, String> mimColumnMap)
					throws FileNotFoundException {
		final Map<String, List<String>> mapCounterFile = QueryGenerator.loadInsertQueries(summary, moIdWiseTableColumns,
				tableType, mimColumnMap);
		for (String key : mapCounterFile.keySet()) {
			if (mapLoadTable.get(key) == null) {
				List<List<String>> tetsList = new ArrayList<>();
				tetsList.add(mapCounterFile.get(key));
				mapLoadTable.put(key, tetsList);
			} else {
				mapLoadTable.get(key).add(mapCounterFile.get(key));
			}
		}
		return null;
	}

	public static void writeToLoadFile(final String outputLocation, final Map<String, List<List<String>>> mapLoadTable,
			final Map<String, Set<String>> tableColumns) throws FileNotFoundException {
		try {
			String loadOutputFile = getSimpleOutputFileName(outputLocation, LOAD_FILES, LOAD_COMMAND_FILE,
					FILE_EXT_TXT);
			createDirectry(loadOutputFile);
			FileWriter f = new FileWriter(loadOutputFile);
			BufferedWriter b = new BufferedWriter(f);
			for (Map.Entry<String, List<List<String>>> entry : mapLoadTable.entrySet()) {
				String key = entry.getKey();
				String tableData = getSimpleOutputFileName(outputLocation, LOAD_FILES, key, FILE_EXT_CSV);
				createDirectry(tableData);
				File fileNamePath = new File(tableData);
				try {
					fileNamePath.createNewFile();
				} catch (Exception e) {
					e.printStackTrace();
				}
				List<List<String>> values = (List) entry.getValue();
				FileWriter fw = new FileWriter(fileNamePath);
				BufferedWriter bw = new BufferedWriter(fw);
				for (List<String> valuesList : values) {
					for (String s : valuesList) {
						bw.write(s + "");
					}
				}
				bw.close();
				Set<String> value = tableColumns.get(key);
				StringBuilder val = new StringBuilder();
				for (String s : value) {
					if (val.length() > 0) {
						val.append(",");
					}
					val.append(s);
				}
				if (key.contains("VECTOR")) {
					b.write("\"LOAD TABLE dc." + key
							+ " (MOID,FDN,SW_VERSION,USER_LABEL,DAY_ID,HOUR_ID,MIN_ID,DATE_ID,DATETIME_ID,DC_VECTOR_INDEX,"
							+ val + ") from" + " '" + outputLocation + File.separator + "LoadTableFiles"
							+ File.separator + key + ".csv" + "'"
							+ " ESCAPES OFF FORMAT BCP QUOTES OFF DELIMITED BY '|' ROW DELIMITED BY '\\n' WITH CHECKPOINT OFF ;\"");
					b.write("\n");
				} else {
					b.write("\"LOAD TABLE dc." + key
							+ " (MOID,FDN,SW_VERSION,USER_LABEL,DAY_ID,HOUR_ID,MIN_ID,DATE_ID,DATETIME_ID,FLEX_FILTERNAME,"
							+ val + ") from" + " '" + outputLocation + File.separator + "LoadTableFiles"
							+ File.separator + key + ".csv" + "'"
							+ " ESCAPES OFF FORMAT BCP QUOTES OFF DELIMITED BY '|' ROW DELIMITED BY '\\n' WITH CHECKPOINT OFF ;\"");
					b.write("\n");
				}

			}
			b.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		System.out.println(String.format("load file created at %s", new Object[] { outputLocation }));
		ParserLogger.log(Level.INFO, String.format("load file created at %s", new Object[] { outputLocation }));
	}

	public static void writeToFile(final String outputLocation, final String parserType,
			final Map<String, String> tableColumnMap, final List<List<String>> data) throws FileNotFoundException {
		final String filename = getOutputFileName(outputLocation, parserType, STRING_INSERT,
				(String) tableColumnMap.keySet().toArray()[0], FILE_EXT_SQL);
		final String queries = QueryGenerator.generateInsertQueries(tableColumnMap, data);

		writeFile(filename, queries);

	}

	public static void writeToFile(final String outputLocation, final Set<String> tableColumns)
			throws FileNotFoundException {
		final String filename = getOutputFileName(outputLocation, ParserType.COUNTER.parserType(), STRING_CREATE,
				FILE_EXT_SQL);
		final String queries = QueryGenerator.generateCreateTableQueries(tableColumns);
		writeFile(filename, queries);
	}

	public static void writeToFile(final String outputLocation, final Map<String, Set<String>> tableColumns)
			throws FileNotFoundException {
		final String filename = getOutputFileName(outputLocation, ParserType.COUNTER.parserType(), STRING_CREATE,
				FILE_EXT_SQL);
		final String queries = QueryGenerator.generateCreateTableQueries(tableColumns, outputLocation);
		writeFile(filename, queries);
	}

    public static void writeToFile(final String outputLocation, final String parserType,
			final Map<String, String> mimColumnMap) throws FileNotFoundException {
		String counterNames = null;
		String filename = null;
		StringBuilder sb = new StringBuilder();
		if (parserType.contains(Constant.CPP)) {
			filename = outputLocation + File.separator + CPP_COUNTERS + FILE_EXT_TXT;
		} else if (parserType.contains(Constant.ECIM)) {
			filename = outputLocation + File.separator + ECIM_COUNTERS + FILE_EXT_TXT;
		}
		for (Map.Entry<String, String> entry : mimColumnMap.entrySet()) {
			counterNames = entry.getKey();
			sb.append(counterNames);
			sb.append(STRING_NEWLINE);

		}
		writeFile(filename, sb.toString());

	}

	public static void writeToFile(final String outputLocation) throws IOException {
		final String filename = getOutputFileName(outputLocation, ParserType.TOPOLOGY.parserType(), STRING_CREATE,
				FILE_EXT_SQL);
		final Map<String, String> tableColumnMap = PropertiesReader.readFileToProperties("/schema/tableschema.txt");
		ColumnType.readColumnSchema();
		writeSqlFile(tableColumnMap, filename);
	}

	public static void writeToFile(final String outputLocation, String ossParser) throws IOException {
		final String filename = getOutputFileName(outputLocation, ossParser, STRING_CREATE, FILE_EXT_SQL);
		final Map<String, String> tableColumnMap = PropertiesReader.readFileToProperties("/schema/oss_schema.txt");
		ColumnType.readColumnSchema(ossParser);
		writeSqlFile(tableColumnMap, filename);
	}

	public static void writeToFile(final String outputLocation, Map<String, Set<String>> pmGroupMap, String ossParser)
			throws IOException {
		final String filenameMo = getSimpleOutputFileName(outputLocation,STRING_RULES,MOID_RULES,FILE_EXT_RULES);
		final String filenameCounters = getSimpleOutputFileName(outputLocation,STRING_RULES,COUNTER_RULES,FILE_EXT_RULES);
		String rulesCounters  = QueryGenerator.generateRulesForOnePmCounters(pmGroupMap, filenameCounters,COUNTERNAME);
	    String rulesMo  = QueryGenerator.generateRulesForOnePmCounters(pmGroupMap, filenameMo,MOID);
		writeFile(filenameMo,rulesMo);
	    writeFile(filenameCounters, rulesCounters);
	  }

	public static void writeToFile(final String outputLocation, final String parserType,
			final Map<String, String> tableColumnMap, final Map<String, String> columnsDetailsMap) throws IOException {
		final String filename = getOutputFileName(outputLocation, parserType, STRING_CREATE,
				(String) tableColumnMap.keySet().toArray()[0], FILE_EXT_SQL);
		ColumnType.readColumnSchema(columnsDetailsMap);
		writeSqlFile(tableColumnMap, filename);
	}

	/**
	 * @param filename
	 * @param content
	 * @throws FileNotFoundException
	 */
	public static void writeFile(final String filename, final String content) throws FileNotFoundException {
		createDirectry(filename);
		writeOutput(new FileOutputStream(filename), content);
		System.out.println(String.format("file created at %s", filename));
		ParserLogger.log(Level.INFO, String.format("file created at %s", filename));
	}

	public static void writeFile(final String filename, final Set<String> content) throws FileNotFoundException {
		createDirectry(filename);
		writeOutput(new FileOutputStream(filename), content);
		System.out.println(String.format("file created at %s", filename));
		ParserLogger.log(Level.INFO, String.format("file created at %s", filename));
	}

	/**
	 * @param tableColumnMap
	 * @param filename
	 * @throws FileNotFoundException
	 */
	private static void writeSqlFile(final Map<String, String> tableColumnMap, final String filename)
			throws FileNotFoundException {
		createDirectry(filename);
		final SQLCommand sqlcmd = new SQLCommand();
		for (final String table : tableColumnMap.keySet()) {
			TableSchema.generateTableSchema(table, tableColumnMap.get(table));
			sqlcmd.generateDropTableQueries(table);
			sqlcmd.createTable(table, TableSchema.getTableSchema(table));
		}

		writeOutput(new FileOutputStream(filename), sqlcmd.getQueries());
		System.out.println(String.format("sql queries at %s", filename));
		ParserLogger.log(Level.INFO, String.format("sql queries at %s", filename));
	}

	public static void writeToConsole(final EnodeBOutput eNBoutput) {

		final String queries = QueryGenerator.generateInsertQueries(eNBoutput);
		writeOutput(System.out, queries);
	}

	public static String getBasePath() {
		return USER_DIR.concat(File.separator);
	}

	public static String getUnzippedDirectory() {

		return getBasePath() + "unzipped" + File.separator;

	}

	public static boolean createDirectry(final String filename) {
		if (filename != EMPTY_STRING) {
			final String dirPath = filename.substring(0, filename.lastIndexOf(File.separator));
			final File dir = new File(dirPath);
			ParserLogger.log(Level.FINE, String.format("Output Directory is : ", dirPath));
			if (!dir.exists()) {
				ParserLogger.log(Level.INFO, String.format("Directory %s not exist, try to create.... ", dirPath));
				return dir.mkdirs();
			}
		}
		return false;

	}

	public static void cleanFolder(final String path) {

		try {
			final File dir = new File(path);
			if (dir.exists()) {
				System.out.println(String.format("Cleaning directory %s", path));
				ParserLogger.log(Level.INFO, String.format("Cleaning directory %s", path));
				org.apache.commons.io.FileUtils.cleanDirectory(dir);
			}
		} catch (final IOException e) {
			e.printStackTrace();
		}

	}

	public static void unzipFiles(final String inputFile, final String outFileName) {
		final byte[] buffer = new byte[1024];
		FileOutputStream outStream = null;
		GZIPInputStream gzipStream = null;

		try {

			gzipStream = new GZIPInputStream(new FileInputStream(inputFile));
			outStream = new FileOutputStream(outFileName);

			int len;
			while ((len = gzipStream.read(buffer)) > 0) {
				outStream.write(buffer, 0, len);
			}

		} catch (final IOException ex) {
			ex.printStackTrace();
		} finally {
			if (outStream != null) {

				try {

					outStream.close();
					gzipStream.close();

				} catch (final IOException e) {

					System.err.println("Error closing the file : ");

					e.printStackTrace();

				}

			}

		}
	}

	private static String getOutputFileName(final String outputLocation, final String parserType,
			final String queryType, final String fileExtention) {
		return getOutputFileName(outputLocation, parserType, queryType, EMPTY_STRING,
				fileExtention.equals(EMPTY_STRING) ? FILE_EXT_SQL : fileExtention);

	}

	private static String getOutputFileName(String outputLocation, final String parserType, final String queryType,
			final String prefix, final String fileExtention) {
		final String dstamp = OUTOUTFILE_TSTAMP_FORMATTER.format(new Date());
		final int ind = outputLocation.lastIndexOf(DOT);
		final StringBuilder outputFileName = new StringBuilder();
		if (outputLocation.equalsIgnoreCase(DEFAULT_OUTPUT_LOCATION)) {
			if (!prefix.equals(EMPTY_STRING)) {
				outputFileName.append(prefix).append(STRING_UNDERSCORE);
			}
			if (!queryType.equals(EMPTY_STRING)) {
				outputFileName.append(queryType).append(STRING_UNDERSCORE);
			}
			return outputFileName.append(dstamp).append(fileExtention).toString();

		} else {
			if (outputLocation.contains(File.separator) && ind != -1) {
				return outputFileName.append(outputLocation.substring(0, ind)).append(STRING_UNDERSCORE).append(dstamp)
						.append(outputLocation.substring(ind, outputLocation.length())).toString();
			} else if (outputLocation.contains(File.separator) && ind == -1) {
				if (!outputLocation.endsWith(File.separator)) {
					outputLocation = outputLocation.concat(File.separator);
				}
				outputFileName.append(outputLocation).append(queryType).append(File.separator).append(parserType)
						.append(STRING_UNDERSCORE);
				if (!prefix.equals(EMPTY_STRING)) {
					outputFileName.append(prefix).append(STRING_UNDERSCORE);
				}
				if (!queryType.equals(EMPTY_STRING)) {
					outputFileName.append(queryType).append(STRING_UNDERSCORE);
				}

				return outputFileName.append(dstamp).append(fileExtention).toString();
			} else if (!outputLocation.contains(File.separator) && ind != -1) {
				return outputFileName.append(getBasePath()).append(outputLocation.substring(0, ind))
						.append(STRING_UNDERSCORE).append(dstamp)
						.append(outputLocation.substring(ind, outputLocation.length())).toString();
			}
		}
		return EMPTY_STRING;
	}

	private static String getSimpleOutputFileName(String outputLocation, final String prefix, final String fileName,
			final String fileExtention) {
	 final int ind = outputLocation.lastIndexOf(DOT);
		final StringBuilder outputFileName = new StringBuilder();
		if (outputLocation.equalsIgnoreCase(DEFAULT_OUTPUT_LOCATION)) {
			if (!prefix.equals(EMPTY_STRING)) {
				outputFileName.append(prefix).append(File.separator);
			}
			return outputFileName.append(fileName).append(fileExtention).toString();

		} else {
			if (outputLocation.contains(File.separator) && ind != -1) {
				return outputLocation;
			} else if (outputLocation.contains(File.separator) && ind == -1) {
				if (!outputLocation.endsWith(File.separator)) {
					outputLocation = outputLocation.concat(File.separator);
				}
				outputFileName.append(outputLocation);
				if (!prefix.equals(EMPTY_STRING)) {
					outputFileName.append(prefix).append(File.separator);
				}

				return outputFileName.append(fileName).append(fileExtention).toString();

			} else if (!outputLocation.contains(File.separator) && ind != -1) {
				return outputFileName.append(getBasePath()).append(outputLocation).toString();
			}
		}
		return EMPTY_STRING;
	}

}
