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
package com.ericsson.eniq.events.utils;

public interface Constant {

    final int CELL_TYPE_NUMERIC = 0;
    final int CELL_TYPE_STRING = 1;
    final int CELL_TYPE_FORMULA = 2;
    final int CELL_TYPE_BLANK = 3;
    final String DEFAULT_COUNTER_TABLE_NAME = "COUNTER_TABLE";
    final String DEFAULT_VECTOR_TABLE_NAME = "VECTOR_COUNTER_TABLE";
    final String EMPTY_STRING = "";
    final String STRING_DATE = "Date";
    final String STRING_TIME = "Time";
    final String DATE_FORMAT = "yyyy-MM-dd";
    final char DOT = '.';
    final String STRING_UNDERSCORE = "_";
    final String STRING_COLON = ":";
    final String CLOSE_PARENTHESIS = ")";
    final String SEMICOLUMN = ";";
    final String STRING_COMMA = ",";
    final String STRING_PIPE = "|";
    final String STRING_TAB = "\t";
    final String STRING_NEWLINE = "\n";
    final String NEW_LINE = System.getProperty("line.separator");
    final String USER_DIR = System.getProperty("user.dir");
    final String SINGLE_QUOTE = "'";
    final char DOUBLE_QUOTE = '"';
    final String OPEN_PARENTHESIS = "(";
    final String STRING_INSERT = "insert";
    final String STRING_RAW = "RAW";
    final String STRING_HOUR = "HOUR";
    final String STRING_DAY = "DAY";
    final String STRING_EQUALS = "=";
    final String STATS="Stats";
    final String PMGROUP="PmGroup";
    final String COUNTERGROUP="CounterGroup";
    final String PMFLEX="PmFlex";
    final String STRING_PMGROUP="Pm=1,PmGroup=";
    final String STRING_ATTRIBUTE = "attribute";
    final String STRING_COUNTERTYPE = "counterType";
    final String STRING_DESC ="description";
    final String STRING_TYPEID = "measurementTypeId";
    final String STRING_MULTIPLICITY = "multiplicity";
    final String FILE_EXT_TXT = ".txt";
    final String FILE_EXT_SQL = ".sql";
    final String FILE_EXT_CSV = ".csv";
    final String FILE_EXT_XML = "xml";
    String FLEX = "pmflex";
    final String CONFIG_PACKAGE_NAME_FOR_JAXB_ENIQ = "com.ericsson.eniq.events.counter.parser.jaxb";
    final String CONFIG_PACKAGE_NAME_FOR_JAXB_ECIM = "com.ericsson.eniq.events.ecim.parser.jaxb";
    final String CONFIG_PACKAGE_NAME_FOR_JAXB_ECIM_MIM = "com.ericsson.eniq.events.ecim.mim.parser.jaxb";
    final String CONFIG_PACKAGE_NAME_FOR_JAXB_CPP = "com.ericsson.eniq.events.cpp.parser.jaxb";
    final String CONFIG_PACKAGE_NAME_FOR_JAXB_ECIM_COUNTER = "com.ericsson.eniq.events.ecim.counter.parser.jaxb";
    final String STRING_CREATE = "create";
    final String STRING_RULES = "rules";
    final String MOID_RULES = "mo_rules";
    final String MOID = "MOID";
    final String COUNTERNAME = "COUNTERNAME";
    final String COUNTER_RULES = "counter_rules";
    final String FILE_EXT_RULES = ".rules";
    final String DROP_TABLE_PREFIX = "DROP TABLE IF EXISTS %s";
    final String CREATE_TABLE_PREFIX = "CREATE TABLE %s";
    final String QUERY_PREFIX_ENB = "INSERT INTO TOPO_ENODEB (NODE_FDN,USER_LABEL,SW_VERSION) VALUES";
    final String QUERY_PREFIX_ENBFUNCTION = "INSERT INTO TOPO_ENBFUNCTION (NODE_FDN,MOID,FDN,ENB_ID,MCC,MNC) VALUES";
    final String QUERY_PREFIX_EUCELL = "INSERT INTO TOPO_EUCELL (NODE_FDN,MOID,FDN,CELL_ID,ENB_ID) VALUES";
    final String QUERY_PREFIX_CELLRELATION = "INSERT INTO TOPO_CELLRELATION (NODE_FDN,MOID,FDN,CELL_ID,ENB_ID,NBR_CELL_ID,NBR_ENB_ID,NBR_RNC_ID,NBR_LAC_ID,"
            + "NBR_ENB_FDN,NBR_MCC,NBR_MNC,NBR_REF_CELL,NBR_CELLREL_TYPE) VALUES";
    final String QUERY_PREFIX_TERMPOINTTOENB = "INSERT INTO TOPO_TERMPOINTTOENB (NODE_FDN,MOID,ENB_ID,FDN,EXTENB_FDN,EXTENB_ID,MCC,MNC) VALUES";
    final String QUERY_PREFIX_TERMPOINTTOMME = "INSERT INTO TOPO_TERMPOINTTOMME (NODE_FDN,MOID,ENB_ID,FDN,MCC,MNC,MME_GROUP_ID,MME_CODE) VALUES";
    final String QUERY_PREFIX_PROCESSORLOAD = "INSERT INTO TOPO_PROCESSORLOAD (NODE_FDN,MOID,ENB_ID,FDN,PLOAD_ID,SLOT_ID) VALUES";
	final String GRIT_COUNTER_TABLE_NAME = "GRIT_COUNTER";
	final String QUERY_PREFIX_GRITMOID = "INSERT INTO GRIT_MOID (PMGROUP,MOID,NOOFCOUNTERS) VALUES";
    final String QUERY_PREFIX_GRITCOUNTER = "INSERT INTO GRIT_COUNTER (PMGROUP,COUNTERNAME,COUNTERTYPE) VALUES";
    final String QUERY_PREFIX_ESMOID = "INSERT INTO ES_MOID (PMGROUP,MOID,NOOFCOUNTERS) VALUES";
    final String QUERY_PREFIX_ESCOUNTER = "INSERT INTO ES_COUNTER (PMGROUP,COUNTERNAME,COUNTERTYPE) VALUES";
    String RESERVED_BY="_reservedBy";
    String ECIM_SIMPLE ="PEG";
    String COUNTER_ID ="counter type:";
    String RBS_VECTOR ="counter type: pdf";
    String RBS_CMVECTOR ="counter type: ddm";
    String ECIM_VECTOR ="PDF";
    String CM_VECTOR = "CMVECTOR";
    String COMPRESSED_DESC = "compressed: true";
    String COMPRESSED_VECTOR = "COMPRESSEDVECTOR";
    String FLEX_COUNTER ="Flex";
    String FLEX_TYPE_COUNTER = "pmFlex";
    String COUNTER_TYPE_QUERY = "SELECT Dataname,Process_instruction from dataitem where Process_instruction in('CMVECTOR','COMPRESSEDVECTOR','VECTOR','PEG','GAUGE','FlexCounter') group by Dataname,Process_instruction";
    String ECIM = "ECIM";
    String CPP = "CPP";
    String ECIM_isCompressed ="isCompressed";
	String ECIM_Compressed ="Compressed: True";
    String CPP_COUNTERS="CppCounters";
    String LOAD_FILES="LoadTableFiles";
   String LOAD_COMMAND_FILE="loadCommands";
   String ECIM_COUNTERS="EcimCounters";
   String RBS = "RBS";
   String PRBS = "PRBS";
   String DDM = "DDM";
   String PMGROUP_TAG="Pm=1,PmGroup=";
   String MANAGED_ELEMENT="ManagedElement";
   String VECTOR="VECTOR";
   String PDF="PDF";
   String STRING_TRUE="true";
   boolean TRUE=true;
   


}
