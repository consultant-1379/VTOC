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

import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.*;
import java.util.logging.Level;

import com.ericsson.eniq.events.parser.service.Counter;
import com.ericsson.eniq.events.parser.service.Summary;
import com.ericsson.eniq.events.topology.mo.*;
import com.ericsson.eniq.events.utils.Constant;
import com.ericsson.eniq.events.utils.Utility;
import com.ericsson.eniq.events.utils.logging.ParserLogger;

public class QueryGenerator {

    public static String generateInsertQueries(final EnodeBOutput eNBoutput) {
        final StringBuilder createSQL = new StringBuilder();
        insertQueryForEnodeB(eNBoutput, createSQL);
        insertQueryForENBFunction(eNBoutput, createSQL);
        insertQueryForEUCell(eNBoutput, createSQL);
        insertQueryForCellRelation(eNBoutput, createSQL);
        insertQueryForTermPointToENB(eNBoutput, createSQL);
        insertQueryForTermPointToMME(eNBoutput, createSQL);
        insertQueryForProcessorLoad(eNBoutput, createSQL);
        return createSQL.toString();

    }

    public static String generateInsertQueries(final Map<String, Set<String>> pmgroupMap,final Map<String,Set<String>> pmGroupEsCounter,Set<String> MOID) {
    	final StringBuilder createSQL = new StringBuilder();
    	insertQueryForGritCounter(pmgroupMap, createSQL);
    	insertQueryForEsCounter(pmGroupEsCounter, createSQL);
        insertQueryForGritMoid(pmgroupMap, MOID, createSQL);
        insertQueryForEsMoid(pmGroupEsCounter, createSQL);
    	return createSQL.toString();
    }


    public static String generateInsertQueries(final Summary summary, final Set<String> tableColumns) {
        final StringBuilder createSQL = new StringBuilder();
        populateCounterTable(summary, createSQL, tableColumns);
        return createSQL.toString();

    }

    public static void insertQueryForGritCounter(final Map<String, Set<String>> pmgroupMap, final StringBuilder createSQL) {
    	if(pmgroupMap.size()>0){
    	 createSQL.append(QUERY_PREFIX_GRITCOUNTER);
    	 int count=0;
    	 int index=0;
    	 for (Map.Entry<String, Set<String>> entry :pmgroupMap.entrySet()) {
    		 Set<String> counterDetail = entry.getValue();
    		 count=count+counterDetail.size();

    	 }
    	  for (final String pmGroup : pmgroupMap.keySet()) {
              final Set<String> counterDetail = pmgroupMap.get(pmGroup);

              for (final String counterData : counterDetail) {
            	  createSQL.append(OPEN_PARENTHESIS);
            	  queryBuilder(createSQL, pmGroup).append(STRING_COMMA);
            	  String counterName=counterData.split(STRING_COMMA)[0];
            	  queryBuilder(createSQL, counterName).append(STRING_COMMA);
                  String counterType=counterData.split(STRING_COMMA)[1];
                  queryBuilder(createSQL, counterType).append(CLOSE_PARENTHESIS);
                  index++;
                  if (index != count) {
                      createSQL.append(STRING_COMMA).append(NEW_LINE).append(STRING_TAB);
                  } else {
                      createSQL.append(SEMICOLUMN).append(NEW_LINE);
                  }
              }
              }
    }
    }

    public static void insertQueryForEsCounter(final Map<String, Set<String>> pmGroupEsCounter, final StringBuilder createSQL) {
    	if(pmGroupEsCounter.size()>0){
    		Set<String> pmGrpsSet =new HashSet();
    	 createSQL.append(QUERY_PREFIX_ESCOUNTER);
    	 int count=0;
    	 int index=0;
    	 for (Map.Entry<String, Set<String>> entry :pmGroupEsCounter.entrySet()) {
    		 String key=entry.getKey().substring(entry.getKey().lastIndexOf(STRING_COMMA)+1);
    		 if(!pmGrpsSet.contains(key))
    		 {
    			 pmGrpsSet.add(key);
    			 Set<String> counterDetail = entry.getValue();
    			 count=count+counterDetail.size();

    		 }
    	 }
    	 pmGrpsSet =new HashSet();
    	  for (final String mo : pmGroupEsCounter.keySet()) {
    		  String pmGroup =mo.substring(mo.lastIndexOf(STRING_COMMA)+1);
        	  if(!pmGrpsSet.contains(pmGroup))
        	  {
        		  pmGrpsSet.add(pmGroup);
              final Set<String> counterDetail = pmGroupEsCounter.get(mo);
              for (final String counterData : counterDetail) {

            	   createSQL.append(OPEN_PARENTHESIS);
                  queryBuilder(createSQL, pmGroup).append(STRING_COMMA);
            	  String counterName=counterData.split(STRING_COMMA)[0];
            	  queryBuilder(createSQL, counterName).append(STRING_COMMA);
                  String counterType=counterData.split(STRING_COMMA)[1];
                  queryBuilder(createSQL, counterType).append(CLOSE_PARENTHESIS);
                  index++;
                  if (index != count) {
                      createSQL.append(STRING_COMMA).append(NEW_LINE).append(STRING_TAB);
                  } else {
                      createSQL.append(SEMICOLUMN).append(NEW_LINE);
                  }
            	  }
              }
              }
    }

    }
    public static void insertQueryForGritMoid(final Map<String, Set<String>> pmgroupMap,Set<String> MOID, final StringBuilder createSQL) {


    	createSQL.append(QUERY_PREFIX_GRITMOID);
    	int count=0;
    	 for (String m : MOID) {
    		 String  pmgroup = m.substring(m.lastIndexOf(",") +1);
    		 Set<String> counterSet = pmgroupMap.get(pmgroup);

    	      createSQL.append(OPEN_PARENTHESIS);
    		 queryBuilder(createSQL, pmgroup).append(STRING_COMMA);
           	 queryBuilder(createSQL, m.substring(1)).append(STRING_COMMA);
           	 queryBuilder(createSQL, counterSet.size()).append(CLOSE_PARENTHESIS);
           	 count++;
    	    if (count != MOID.size()) {
             createSQL.append(STRING_COMMA).append(NEW_LINE).append(STRING_TAB);
         }  else {
             createSQL.append(SEMICOLUMN).append(NEW_LINE);
                 }
	     }

}

    public static void insertQueryForEsMoid(final Map<String, Set<String>> pmGroupEsCounter, final StringBuilder createSQL) {
    	createSQL.append(QUERY_PREFIX_ESMOID);
    	int count=0;

    	 for (final String moid : pmGroupEsCounter.keySet()) {
    		  String  pmgroup = moid.substring(moid.lastIndexOf(",") +1);
    		  Set<String> counterSet= pmGroupEsCounter.get(moid);
           	  createSQL.append(OPEN_PARENTHESIS);
           	queryBuilder(createSQL, pmgroup).append(STRING_COMMA);
           	queryBuilder(createSQL, moid).append(STRING_COMMA);
           	queryBuilder(createSQL, counterSet.size()).append(CLOSE_PARENTHESIS);
           	count++;
    	 if (count != pmGroupEsCounter.keySet().size()) {
             createSQL.append(STRING_COMMA).append(NEW_LINE).append(STRING_TAB);
         } else {
             createSQL.append(SEMICOLUMN).append(NEW_LINE);
         }
    	 }

    }

    /*public static String generateInsertQueries(final Summary summary, final Map<String, Set<String>> moIdWiseTableColumns, final String tableType) {

        final StringBuilder createSQL = new StringBuilder();
        Map<String, List<String>> mapSimple = new HashMap<String, List<String>>();
        populateCounterTable(summary, createSQL, moIdWiseTableColumns, tableType,mapSimple);

        return createSQL.toString();

    }*/
    public static Map<String, List<String>> loadInsertQueries(final Summary summary, final Map<String, Set<String>> moIdWiseTableColumns, final String tableType,final Map<String,String> mimColumnMap) {
        final StringBuilder createSQL = new StringBuilder();
        Map<String, List<String>> mapCounterFile = new HashMap<String, List<String>>();
        if(mimColumnMap.size()>0)
        {
        populateCounterTableMim(summary, createSQL, moIdWiseTableColumns, tableType,mapCounterFile,mimColumnMap);
        }
        else
        {
        	populateCounterTable(summary, createSQL, moIdWiseTableColumns, tableType,mapCounterFile);
        }
        return mapCounterFile;

    }

    public static String generateInsertQueries(final Map<String, String> tableColumnMap, final List<List<String>> data) {
        final StringBuilder createSQL = new StringBuilder();
        generateInsertQuery(createSQL, tableColumnMap, data);
        return createSQL.toString();
    }

    public static String generateCreateTableQueries(final Set<String> tableColumns) {
        final StringBuilder createSQL = new StringBuilder();
        createTableQueryForCounters(
                createSQL,
                tableColumns,
                DEFAULT_COUNTER_TABLE_NAME,
                "( MOID VARCHAR(255) NOT NULL, FDN VARCHAR(255) NOT NULL, SW_VERSION VARCHAR(128) NULL, USER_LABEL VARCHAR(128) NULL, DAY_ID INTEGER NULL, HOUR_ID INTEGER NULL, MIN_ID INTEGER NULL, DATETIME_ID datetime NULL,");
        return createSQL.toString();
    }

    public static String generateRulesForOnePmCounters(Map<String, Set<String>> pmGroupMap,final String outputLocation, String value) {
         String ruleString ="";
         final StringBuilder createSQL = new StringBuilder();
         for (String pmGroupname : pmGroupMap.keySet()) {
        		ruleString = "in."+value+" <=> out."+value+" when(in.PMGROUP="+DOUBLE_QUOTE+pmGroupname+DOUBLE_QUOTE+",out.PMGROUP="+DOUBLE_QUOTE+pmGroupname+DOUBLE_QUOTE + ")"+"\n";
   		 createSQL.append(ruleString);
    		}
         return createSQL.toString().trim();
   		
	}
    public static String generateCreateTableQueries(final Map<String, Set<String>> tableColumns,String outputLocation) throws FileNotFoundException {
        final StringBuilder createSQL = new StringBuilder();
        for (final String key : tableColumns.keySet()) {
        	if (key.contains("VECTOR_")) {
                createTableQueryForCounters(
                        createSQL,
                        tableColumns.get(key),
                        key,
                        "( MOID VARCHAR(255) NOT NULL, FDN VARCHAR(255) NOT NULL, SW_VERSION VARCHAR(128) NULL, USER_LABEL VARCHAR(128) NULL, DAY_ID INTEGER NULL, HOUR_ID INTEGER NULL, MIN_ID INTEGER NULL, DATE_ID date NULL, DATETIME_ID datetime NULL, DC_VECTOR_INDEX INTEGER NULL, ");
            } else {
                createTableQueryForCounters(
                        createSQL,
                        tableColumns.get(key),
                        key,
                        "( MOID VARCHAR(255) NOT NULL, FDN VARCHAR(255) NOT NULL, SW_VERSION VARCHAR(128) NULL, USER_LABEL VARCHAR(128) NULL, DAY_ID INTEGER NULL, HOUR_ID INTEGER NULL, MIN_ID INTEGER NULL, DATE_ID date NULL, DATETIME_ID datetime NULL, FLEX_FILTERNAME VARCHAR(255) NULL,");
            }
        }
        return createSQL.toString();
    }

    public static void insertQueryForEnodeB(final EnodeBOutput eNBoutput, final StringBuilder createSQL) {
        final EnodeB eNB = eNBoutput.geteNodeB();
        if (eNB != null) {
            final String fdn = eNB.get_fdn();
            final String userLabel = eNB.get_userLabel();
            final String swVersion = eNB.get_swVersion();
            createSQL.append(QUERY_PREFIX_ENB).append(OPEN_PARENTHESIS);
            queryBuilder(createSQL, fdn).append(STRING_COMMA);
            queryBuilder(createSQL, userLabel).append(STRING_COMMA);
            queryBuilder(createSQL, swVersion);
            createSQL.append(CLOSE_PARENTHESIS).append(SEMICOLUMN).append(NEW_LINE);
        }
    }

    private static StringBuilder queryBuilder(final StringBuilder createSQL, final String StringValue) {
        if (null != StringValue) {
            createSQL.append(SINGLE_QUOTE).append(StringValue).append(SINGLE_QUOTE);
        } else {
            createSQL.append(StringValue);
        }
        return createSQL;
    }

    private static StringBuilder queryBuilder(final StringBuilder createSQL, final Integer integerValue) {
        createSQL.append(integerValue);
        return createSQL;
    }

    public static void insertQueryForENBFunction(final EnodeBOutput eNBoutput, final StringBuilder createSQL) {
        final EnodeBFunction eNBFunction = eNBoutput.geteNBFunction();
        if (eNBFunction != null) {
            final String nodeFdn = eNBFunction.get_nodeName();
            final String moid = eNBFunction.get_moid();
            final String fdn = eNBFunction.get_fdn();
            final Integer eNBId = Integer.valueOf(eNBFunction.get_eNBId());
            final String mcc = Objects.toString(eNBFunction.get_eNodeBPlmnId().get_mcc(), null);
            final String mnc = Objects.toString(eNBFunction.get_eNodeBPlmnId().get_mnc(), null);
            createSQL.append(QUERY_PREFIX_ENBFUNCTION).append(OPEN_PARENTHESIS);
            queryBuilder(createSQL, nodeFdn).append(STRING_COMMA);
            queryBuilder(createSQL, moid).append(STRING_COMMA);
            queryBuilder(createSQL, fdn).append(STRING_COMMA);
            queryBuilder(createSQL, eNBId).append(STRING_COMMA);
            queryBuilder(createSQL, mcc).append(STRING_COMMA);
            queryBuilder(createSQL, mnc);
            createSQL.append(CLOSE_PARENTHESIS).append(SEMICOLUMN).append(NEW_LINE);
        }
    }

    public static void insertQueryForEUCell(final EnodeBOutput eNBoutput, final StringBuilder createSQL) {
        final List<EUtranCell> lsitEUCell = eNBoutput.getListEUCell();
        if (lsitEUCell.size() > 0) {
            createSQL.append(QUERY_PREFIX_EUCELL);
            int count = 1;
            String nodeFdn = null, moid = null, fdn = null;
            Integer cellId = null, eNBId = null;
            for (final EUtranCell eUcell : lsitEUCell) {
                nodeFdn = eUcell.get_nodeFdn();
                moid = eUcell.get_moid();
                fdn = eUcell.get_fdn();
                cellId = Integer.valueOf(eUcell.get_cellID());
                eNBId = Integer.valueOf(eUcell.get_eNBId());
                createSQL.append(OPEN_PARENTHESIS);
                queryBuilder(createSQL, nodeFdn).append(STRING_COMMA);
                queryBuilder(createSQL, moid).append(STRING_COMMA);
                queryBuilder(createSQL, fdn).append(STRING_COMMA);
                queryBuilder(createSQL, cellId).append(STRING_COMMA);
                queryBuilder(createSQL, eNBId).append(CLOSE_PARENTHESIS);
                if (count != lsitEUCell.size()) {
                    createSQL.append(STRING_COMMA).append(NEW_LINE).append(STRING_TAB);
                } else {
                    createSQL.append(SEMICOLUMN).append(NEW_LINE);
                }
                count++;
            }
        }
    }

    public static void insertQueryForCellRelation(final EnodeBOutput eNBoutput, final StringBuilder createSQL) {
        final List<CellRelations> listCellRelations = eNBoutput.getListCellRelation();
        final EnodeBFunction eNBFunction = eNBoutput.geteNBFunction();
        if (listCellRelations.size() > 0) {
            boolean isRequired = true, isInsideFunction = false;
            String nodeFdn = null, moid = null, fdn = null, nbrEnbFdn = null, nbrMcc = null, nbrMnc = null, nbrCellRef = null;
            int count = 1;
            Integer nbrCellId = null, cellId = null, eNBId = null, nbrEnbId = null, nbrRncId = null, nbrLacId = null;
            for (final CellRelations cellRelation : listCellRelations) {
                int nbrCount = 1;
                nodeFdn = cellRelation.get_nodeFdn();
                cellId = Integer.valueOf(cellRelation.get_cellId());
                eNBId = Integer.valueOf(eNBFunction.get_eNBId());
                for (final NbrCell nbrCell : cellRelation.get_listNbrCellDetails()) {
                    if (isRequired) {
                        createSQL.append(QUERY_PREFIX_CELLRELATION);
                        isRequired = false;
                        isInsideFunction = true;
                    }
                    try {
                        fdn = nbrCell.get_fdn();
                        moid = nbrCell.get_moid();
                        nbrCellId = Integer.valueOf(nbrCell.get_nbrCellID());
                        switch (nbrCell.getCellRelationType()) {

                            case EUTRAN:
                                nbrEnbId = Integer.valueOf(nbrCell.get_nbrENodeBID());
                                nbrRncId = null;
                                nbrLacId = null;
                                break;
                            case UTRAN:
                                nbrRncId = Integer.valueOf(nbrCell.get_nbrENodeBID());
                                nbrEnbId = null;
                                nbrLacId = null;
                                break;
                            case GERAN:
                                nbrLacId = Integer.valueOf(nbrCell.get_nbrENodeBID());
                                nbrRncId = null;
                                nbrEnbId = null;
                                break;
                            default:
                                System.out.println("Can not identify cell relation type");
                        }
                        nbrEnbFdn = nbrCell.get_nbrENodeBFDN();
                        nbrMcc = nbrCell.get_nbrMccId();
                        nbrMnc = nbrCell.get_nbrMncId();
                        nbrCellRef = nbrCell.get_nbrCellREF();
                    } catch (final Exception e) {
                    }
                    createSQL.append(OPEN_PARENTHESIS);
                    queryBuilder(createSQL, nodeFdn).append(STRING_COMMA);
                    queryBuilder(createSQL, moid).append(STRING_COMMA);
                    queryBuilder(createSQL, fdn).append(STRING_COMMA);
                    queryBuilder(createSQL, cellId).append(STRING_COMMA);
                    queryBuilder(createSQL, eNBId).append(STRING_COMMA);
                    queryBuilder(createSQL, nbrCellId).append(STRING_COMMA);
                    queryBuilder(createSQL, nbrEnbId).append(STRING_COMMA);
                    queryBuilder(createSQL, nbrRncId).append(STRING_COMMA);
                    queryBuilder(createSQL, nbrLacId).append(STRING_COMMA);
                    queryBuilder(createSQL, nbrEnbFdn).append(STRING_COMMA);
                    queryBuilder(createSQL, nbrMcc).append(STRING_COMMA);
                    queryBuilder(createSQL, nbrMnc).append(STRING_COMMA);
                    queryBuilder(createSQL, nbrCellRef).append(STRING_COMMA);
                    queryBuilder(createSQL, nbrCell.getCellRelationType().getRelationName());
                    if (nbrCount != cellRelation.get_listNbrCellDetails().size()) {
                        createSQL.append(CLOSE_PARENTHESIS).append(STRING_COMMA);
                    }
                    nbrCount++;
                }
                if (isInsideFunction) {
                    if (count != listCellRelations.size()) {
                        createSQL.append(CLOSE_PARENTHESIS).append(STRING_COMMA).append(NEW_LINE).append(STRING_TAB);
                    } else {
                        createSQL.append(CLOSE_PARENTHESIS).append(SEMICOLUMN).append(NEW_LINE);
                    }
                }
                count++;
            }
        }
    }

    public static void insertQueryForTermPointToENB(final EnodeBOutput eNBoutput, final StringBuilder createSQL) {
        final List<TermPointToEnodeB> listTermPointToEnodeB = eNBoutput.getListTermPointToEnodeB();
        final EnodeBFunction eNBFunction = eNBoutput.geteNBFunction();
        if (listTermPointToEnodeB.size() > 0) {
            createSQL.append(QUERY_PREFIX_TERMPOINTTOENB);
            String nodeFdn = null, moid = null, fdn = null, externalENBfdn = null, mcc = null, mnc = null;
            Integer eNBId = null, externalENBId = null;
            int count = 1;
            for (final TermPointToEnodeB termPointToENB : listTermPointToEnodeB) {
                nodeFdn = termPointToENB.get_nodeFdn();
                moid = termPointToENB.get_moid();
                eNBId = Integer.valueOf(eNBFunction.get_eNBId());
                fdn = termPointToENB.get_fdn();
                externalENBfdn = termPointToENB.get_externalENodeBFdn();
                externalENBId = Integer.valueOf(termPointToENB.get_extENodeBFn().get_externalENBId());
                mcc = Objects.toString(termPointToENB.get_extENodeBFn().get_eNodeBPlmnId().get_mcc(), null);
                mnc = Objects.toString(termPointToENB.get_extENodeBFn().get_eNodeBPlmnId().get_mnc(), null);
                createSQL.append(OPEN_PARENTHESIS);
                queryBuilder(createSQL, nodeFdn).append(STRING_COMMA);
                queryBuilder(createSQL, moid).append(STRING_COMMA);
                queryBuilder(createSQL, eNBId).append(STRING_COMMA);
                queryBuilder(createSQL, fdn).append(STRING_COMMA);
                queryBuilder(createSQL, externalENBfdn).append(STRING_COMMA);
                queryBuilder(createSQL, externalENBId).append(STRING_COMMA);
                queryBuilder(createSQL, mcc).append(STRING_COMMA);
                queryBuilder(createSQL, mnc).append(CLOSE_PARENTHESIS);
                if (count != listTermPointToEnodeB.size()) {
                    createSQL.append(STRING_COMMA).append(NEW_LINE).append(STRING_TAB);
                } else {
                    createSQL.append(SEMICOLUMN).append(NEW_LINE);
                }
                count++;
            }
        }
    }

    public static void insertQueryForTermPointToMME(final EnodeBOutput eNBoutput, final StringBuilder createSQL) {
        final List<TermPointToMme> listTermPointToMme = eNBoutput.getListTermPointToMme();
        final EnodeBFunction eNBFunction = eNBoutput.geteNBFunction();
        if (listTermPointToMme.size() > 0) {
            createSQL.append(QUERY_PREFIX_TERMPOINTTOMME);
            int count = 1;
            String nodeFdn = null, moid = null, fdn = null, mcc = null, mnc = null;
            Integer eNBId = null, mmeGIList = null, mmeCodeList = null;
            for (final TermPointToMme termPointToMme : listTermPointToMme) {
                int plmnIdCount = 1;
                nodeFdn = termPointToMme.get_nodeFdn();
                moid = termPointToMme.get_moid();
                eNBId = Integer.valueOf(eNBFunction.get_eNBId());
                fdn = termPointToMme.get_fdn();
                for (final PlmnId plmnId : termPointToMme.get_servedPlmnList()) {
                    mcc = Objects.toString(plmnId.get_mcc(), null);
                    mnc = Objects.toString(plmnId.get_mnc(), null);
                    int mmeCount = 1;
                    for (final Integer mmecode : termPointToMme.get_mmeCodeListLTERelated()) {
                        int mmeGicount = 1;
                        mmeCodeList = mmecode;
                        for (final Integer mmegi : termPointToMme.get_mmeGIListLTERelated()) {
                            mmeGIList = mmegi;
                            createSQL.append(OPEN_PARENTHESIS);
                            queryBuilder(createSQL, nodeFdn).append(STRING_COMMA);
                            queryBuilder(createSQL, moid).append(STRING_COMMA);
                            queryBuilder(createSQL, eNBId).append(STRING_COMMA);
                            queryBuilder(createSQL, fdn).append(STRING_COMMA);
                            queryBuilder(createSQL, mcc).append(STRING_COMMA);
                            queryBuilder(createSQL, mnc).append(STRING_COMMA);
                            queryBuilder(createSQL, mmeGIList).append(STRING_COMMA);
                            queryBuilder(createSQL, mmeCodeList);
                            if (mmeGicount != termPointToMme.get_mmeGIListLTERelated().size()) {
                                createSQL.append(CLOSE_PARENTHESIS).append(STRING_COMMA);
                            }
                            mmeGicount++;
                        }
                        if (mmeCount != termPointToMme.get_mmeCodeListLTERelated().size()) {

                            createSQL.append(CLOSE_PARENTHESIS).append(STRING_COMMA);
                        }
                        mmeCount++;
                    }
                    if (plmnIdCount != termPointToMme.get_servedPlmnList().size()) {
                        createSQL.append(CLOSE_PARENTHESIS).append(STRING_COMMA);
                    }
                    plmnIdCount++;
                }
                if (count != listTermPointToMme.size()) {
                    createSQL.append(CLOSE_PARENTHESIS).append(STRING_COMMA).append(NEW_LINE).append(STRING_TAB);
                } else {
                    createSQL.append(CLOSE_PARENTHESIS).append(SEMICOLUMN).append(NEW_LINE);
                }
                count++;
            }
        }
    }

    public static void insertQueryForProcessorLoad(final EnodeBOutput eNBoutput, final StringBuilder createSQL) {
        final List<ProcessorLoad> listProcessorLoad = eNBoutput.getListProcessorLoad();
        final EnodeBFunction eNBFunction = eNBoutput.geteNBFunction();
        if (listProcessorLoad.size() > 0) {
            createSQL.append(QUERY_PREFIX_PROCESSORLOAD);
            int count = 1;
            String nodeFdn = null, moid = null, fdn = null, ploadId = null;
            Integer eNBId = null, slotId = null;
            for (final ProcessorLoad processorLoad : listProcessorLoad) {
                nodeFdn = processorLoad.get_nodeFdn();
                moid = processorLoad.get_moid();
                eNBId = Integer.valueOf(eNBFunction.get_eNBId());
                fdn = processorLoad.get_fdn();
                ploadId = processorLoad.get_processorLoadId();
                slotId = Integer.valueOf(processorLoad.get_SlotId());
                createSQL.append(OPEN_PARENTHESIS);
                queryBuilder(createSQL, nodeFdn).append(STRING_COMMA);
                queryBuilder(createSQL, moid).append(STRING_COMMA);
                queryBuilder(createSQL, eNBId).append(STRING_COMMA);
                queryBuilder(createSQL, fdn).append(STRING_COMMA);
                queryBuilder(createSQL, ploadId).append(STRING_COMMA);
                queryBuilder(createSQL, slotId).append(CLOSE_PARENTHESIS);
                if (count != listProcessorLoad.size()) {
                    createSQL.append(STRING_COMMA).append(NEW_LINE).append(STRING_TAB);
                } else {
                    createSQL.append(SEMICOLUMN).append(NEW_LINE);
                }
                count++;
            }
        }
    }

    private static void populateCounterTable(final Summary summary, final StringBuilder createSQL, final Set<String> tableColumns) {
        for (final String moid : summary.getMoidCountersMap().keySet()) {
            createSQL.append("\r INSERT INTO COUNTER_TABLE ( FDN, SW_VERSION, USER_LABEL, MOID, DAY_ID, HOUR_ID, MIN_ID, DATETIME_ID ");
            final List<Counter> counterDetailsList = summary.getMoidCountersMap().get(moid);
            for (final Counter counterName : counterDetailsList) {
                tableColumns.add(counterName.getCounterName());
                createSQL.append(STRING_COMMA).append(counterName.getCounterName());
            }
            createSQL.append(") VALUES( '").append(summary.getFdn()).append("' , '").append(summary.getSwVersion()).append("' , '")
                    .append(summary.getUserLabel()).append("' , '").append(moid).append("' ,").append(summary.getDayId()).append(",")
                    .append(summary.getHourId()).append(",").append(summary.getMinId()).append(", '").append(summary.getRopTime()).append("'");
            for (final Counter counterValue : counterDetailsList) {
                createSQL.append(STRING_COMMA).append(counterValue.getlteesCounterValue());
            }
            createSQL.append(CLOSE_PARENTHESIS).append(SEMICOLUMN);
        }
    }

    public static Map<String,Set<String>> populateEsPmCounterTable(final Summary summary,Map<String,Set<String>> pmGroupEsCounter) {
    	//String pm = null;
    	Set<String> counterList = null;
    	for (final String moid : summary.getMoidCountersMap().keySet()) {
    		//pm = moid.substring(moid.lastIndexOf(STRING_COMMA)+1).split("=")[0];
    		List<String> tmp = Arrays.asList(moid.split(","));
    		String mo="";
    		for (String i :tmp){
    			String[] x = i.split("=");
    			mo=mo+","+x[0];
       		}
    		final List<Counter> counterDetailsList = summary.getMoidCountersMap().get(moid);
    		mo = mo.substring(1);
    		String counterType= "";
    		for (final Counter counter : counterDetailsList) {
    			String counterName=counter.getCounterName();
    			String counterValue=counter.getCounterValue();
    			if(counterValue.split(STRING_COMMA).length == 1 && !counterName.toLowerCase().startsWith(FLEX_TYPE_COUNTER.toLowerCase())){
    				counterType =ECIM_SIMPLE;
    			}
    			else if(counterName.toLowerCase().startsWith(FLEX_TYPE_COUNTER.toLowerCase())){
    				counterType =FLEX_COUNTER;
    			}
    			else{
    				counterType =ECIM_VECTOR;
    			}

            		if (pmGroupEsCounter.get(mo) == null) {
            			counterList=new HashSet<String>();
            			counterList.add(counterName+"," +counterType);

            			pmGroupEsCounter.put(mo, counterList);
                	}
                	else{

                		pmGroupEsCounter.get(mo).add(counterName+"," +counterType);

                	}
    		}
    	}
    	/* for (Map.Entry<String, Set<String>> entry :pmGroupEsCounter.entrySet()) {
 			String key = entry.getKey();
 			//System.out.println("in ecimParser -> " +key);
 			ParserLogger.log(Level.INFO, String.format("pmGroup name---- %s", key));
 			Set<String> value=entry.getValue();
 			ParserLogger.log(Level.INFO, String.format("counter List---- %s", value));
         } */
    	return pmGroupEsCounter;
    }

    private static void populateLoadTable(final String counterTable, final Summary summary, final Counter counterValue,final String moid,final Map<String, List<String>> mapCounterFile,final Map<String, Set<String>> moIdWisetableColumns,final String indexValue,final String vectorValue,Boolean isCMVector)
    {
    	Set<String> counterColumn=null;
    	 List<String> valSetOne=null;
        counterColumn=new HashSet<String>();
        counterColumn=moIdWisetableColumns.get(counterTable);
        int lenCounterColumn=0;
        if(counterColumn!=null)
        {
        	lenCounterColumn=counterColumn.size();
        }
        String currentCounterName=null;
        		if(counterValue.getCounterName().startsWith(Constant.FLEX_TYPE_COUNTER))
        				{
        				currentCounterName=counterValue.getCounterName().split("_")[0];
        				}
        		else
        		{
        			currentCounterName=counterValue.getCounterName();
        		}
        int index=0;
        int counterIndex=0;
        if(counterColumn!=null)
        {
        for (String temp : counterColumn) {
        	if(temp.equals(currentCounterName))
        	{
        		counterIndex=index;
        	}
        	index=index+1;
        }
        }
        if (mapCounterFile.get(counterTable)==null) {
                valSetOne= new ArrayList<String>();
            	valSetOne.add(moid);
            	valSetOne.add(STRING_PIPE);
                valSetOne.add(summary.getFdn());
                valSetOne.add(STRING_PIPE);
                valSetOne.add(summary.getSwVersion());
                valSetOne.add(STRING_PIPE);
                valSetOne.add(summary.getUserLabel());
                valSetOne.add(STRING_PIPE);
                valSetOne.add(Integer.toString(summary.getDayId()));
                valSetOne.add(STRING_PIPE);
                valSetOne.add(Integer.toString(summary.getHourId()));
                valSetOne.add(STRING_PIPE);
                valSetOne.add(Integer.toString(summary.getMinId()));
                valSetOne.add(STRING_PIPE);
                valSetOne.add(summary.getDate());
                valSetOne.add(STRING_PIPE);
                valSetOne.add(summary.getRopTime());
                valSetOne.add(STRING_PIPE);
                if(currentCounterName.startsWith(Constant.FLEX_TYPE_COUNTER))
                {
                	valSetOne.add(counterValue.getCounterName().split("_")[1]);
                }
                else if(counterTable.contains("VECTOR")||isCMVector)
                {
                	valSetOne.add(indexValue);
                }
                else
                {
                	valSetOne.add(null);
                }
                valSetOne.add(STRING_PIPE);

                 for(int j=0;j<counterIndex;j++)
                    {
                    	valSetOne.add(null);
                    	if(j<counterIndex)
                    		valSetOne.add(STRING_PIPE);
                    }
                 if(counterTable.contains("VECTOR")||isCMVector)
                 {
                	 valSetOne.add(vectorValue);
                 }
                 else
                 {
                   valSetOne.add(counterValue.getCounterValue());
                 }
                if(counterIndex<(lenCounterColumn-1))
                	valSetOne.add(STRING_PIPE);
                 for(int j=counterIndex+1;j<lenCounterColumn;j++)
                   {
                    valSetOne.add(null);
                    if(j<(lenCounterColumn-1))
                    	valSetOne.add(STRING_PIPE);
                   }
                    valSetOne.add("\n");
                    mapCounterFile.put(counterTable, valSetOne);
                }
        else {
        	mapCounterFile.get(counterTable).add(moid);
        	mapCounterFile.get(counterTable).add(STRING_PIPE);
        	mapCounterFile.get(counterTable).add(summary.getFdn());
        	mapCounterFile.get(counterTable).add(STRING_PIPE);
        	mapCounterFile.get(counterTable).add(summary.getSwVersion());
        	mapCounterFile.get(counterTable).add(STRING_PIPE);
        	mapCounterFile.get(counterTable).add(summary.getUserLabel());
        	mapCounterFile.get(counterTable).add(STRING_PIPE);
        	mapCounterFile.get(counterTable).add(Integer.toString(summary.getDayId()));
        	mapCounterFile.get(counterTable).add(STRING_PIPE);
        	mapCounterFile.get(counterTable).add(Integer.toString(summary.getHourId()));
        	mapCounterFile.get(counterTable).add(STRING_PIPE);
        	mapCounterFile.get(counterTable).add(Integer.toString(summary.getMinId()));
        	mapCounterFile.get(counterTable).add(STRING_PIPE);
        	mapCounterFile.get(counterTable).add(summary.getDate());
        	mapCounterFile.get(counterTable).add(STRING_PIPE);
        	mapCounterFile.get(counterTable).add(summary.getRopTime());
        	mapCounterFile.get(counterTable).add(STRING_PIPE);
        	if(currentCounterName.startsWith(Constant.FLEX_TYPE_COUNTER))
            {
        		if(counterValue.getCounterName().contains("_"))
        			mapCounterFile.get(counterTable).add(counterValue.getCounterName().split("_")[1]);
            }
        	else if(counterTable.contains("VECTOR")||isCMVector)
        	{
        		mapCounterFile.get(counterTable).add(indexValue);
        	}
        	else
        	{
        		mapCounterFile.get(counterTable).add(null);
        	}
        	mapCounterFile.get(counterTable).add(STRING_PIPE);
        	for(int j=0;j<counterIndex;j++)
            {
        		mapCounterFile.get(counterTable).add(null);
        		if(j<counterIndex)
        			mapCounterFile.get(counterTable).add(STRING_PIPE);
            }
        	if(counterTable.contains("VECTOR")||isCMVector)
            {
        		mapCounterFile.get(counterTable).add(vectorValue);
            }
        	else
        	{
        		mapCounterFile.get(counterTable).add(counterValue.getCounterValue());
        	}
        	if(counterIndex<(lenCounterColumn-1))
        		mapCounterFile.get(counterTable).add(STRING_PIPE);
           for(int j=counterIndex+1;j<lenCounterColumn;j++)
           {
        	   mapCounterFile.get(counterTable).add(null);
        	   if(j<(lenCounterColumn-1))
        		   mapCounterFile.get(counterTable).add(STRING_PIPE);
           }
           mapCounterFile.get(counterTable).add("\n");
        }
    }

    public static Map<String, Set<String>> populatemoidTableColumns(final Summary summary, final Map<String, Set<String>> moIdWisetableColumns, final String tableType)
    {
    	final Map<String, StringBuilder> counterTypeMapping = Utility.getCounterTypeMapping();
    	for (final String moid : summary.getMoidCountersMap().keySet()) {
            final String counterTable = tableType + STRING_UNDERSCORE + DEFAULT_COUNTER_TABLE_NAME + STRING_UNDERSCORE
                    + moid.substring(moid.lastIndexOf(STRING_COMMA) + 1, moid.lastIndexOf(STRING_EQUALS));
            final String vectorCounterTable = tableType + STRING_UNDERSCORE + DEFAULT_VECTOR_TABLE_NAME + STRING_UNDERSCORE
                    + moid.substring(moid.lastIndexOf(STRING_COMMA) + 1, moid.lastIndexOf(STRING_EQUALS));
            final List<Counter> counterDetailsList = summary.getMoidCountersMap().get(moid);
            for (final Counter counterName : counterDetailsList) {
                Set<String> tableColumns = null;
                final int counterSize = Arrays.asList(counterName.getCounterValue().split(STRING_COMMA)).size();
                if (counterSize == 1) {
                    if (moIdWisetableColumns.get(counterTable) == null) {
                        tableColumns = new HashSet<String>();
                        if (counterName.getCounterName().startsWith(Constant.FLEX_TYPE_COUNTER)) {
                            tableColumns.add(counterName.getCounterName().split("_")[0]);
                        } else {
                            tableColumns.add(counterName.getCounterName());
                        }
                        moIdWisetableColumns.put(counterTable, tableColumns);
                    } else {
                        if (counterName.getCounterName().startsWith(Constant.FLEX_TYPE_COUNTER)) {
                            moIdWisetableColumns.get(counterTable).add(counterName.getCounterName().split("_")[0]);
                        } else {
                            moIdWisetableColumns.get(counterTable).add(counterName.getCounterName());
                        }
                    }
                } else {
                    if (moIdWisetableColumns.get(vectorCounterTable) == null) {
                        tableColumns = new HashSet<String>();
                        tableColumns.add(counterName.getCounterName());
                        moIdWisetableColumns.put(vectorCounterTable, tableColumns);
                        if (counterTypeMapping.get(counterName.getCounterName()) != null && (counterTypeMapping.get(counterName.getCounterName()).toString().contains(Constant.CM_VECTOR) || counterTypeMapping.get(counterName.getCounterName()).toString().contains("PEG"))) {
                            if (moIdWisetableColumns.get(counterTable) == null) {
                                tableColumns.add(counterName.getCounterName());
                                moIdWisetableColumns.put(counterTable, tableColumns);
                            } else {
                                moIdWisetableColumns.get(counterTable).add(counterName.getCounterName());
                            }
                        }
                    } else {
                    	  moIdWisetableColumns.get(vectorCounterTable).add(counterName.getCounterName());
                    }
                }
            }
        }
		return moIdWisetableColumns;
    }
    public static Map<String, Set<String>> populatemoidTableColumnsMim(final Summary summary, final Map<String, Set<String>> moIdWisetableColumns, final String tableType,final Map<String,String> mimColumnMap)
    {
    	String counter=null;
    	for (final String moid : summary.getMoidCountersMap().keySet()) {
            final String counterTable = tableType + STRING_UNDERSCORE + DEFAULT_COUNTER_TABLE_NAME + STRING_UNDERSCORE
                    + moid.substring(moid.lastIndexOf(STRING_COMMA) + 1, moid.lastIndexOf(STRING_EQUALS));
            final String vectorCounterTable = tableType + STRING_UNDERSCORE + DEFAULT_VECTOR_TABLE_NAME + STRING_UNDERSCORE
                    + moid.substring(moid.lastIndexOf(STRING_COMMA) + 1, moid.lastIndexOf(STRING_EQUALS));
            final List<Counter> counterDetailsList = summary.getMoidCountersMap().get(moid);
            for (final Counter counterName : counterDetailsList) {
                Set<String> tableColumns = null;
                final int counterSize = Arrays.asList(counterName.getCounterValue().split(STRING_COMMA)).size();
                if(counterName.getCounterName().startsWith(Constant.FLEX_TYPE_COUNTER))
                		{
                	counter=counterName.getCounterName().split("_")[0];
                		}
                else
                {
                	counter=counterName.getCounterName();
                }
                if(mimColumnMap.get(counter) != null)
                {
                if (counterSize == 1) {
                    if (moIdWisetableColumns.get(counterTable) == null) {
                        tableColumns = new HashSet<String>();
                        if (counterName.getCounterName().startsWith(Constant.FLEX_TYPE_COUNTER)) {
                            tableColumns.add(counterName.getCounterName().split("_")[0]);
                        } else {
                            tableColumns.add(counterName.getCounterName());
                        }
                        moIdWisetableColumns.put(counterTable, tableColumns);
                    } else {
                        if (counterName.getCounterName().startsWith(Constant.FLEX_TYPE_COUNTER)) {
                            moIdWisetableColumns.get(counterTable).add(counterName.getCounterName().split("_")[0]);
                        } else {
                            moIdWisetableColumns.get(counterTable).add(counterName.getCounterName());
                        }
                    }
                } else {
                    if (moIdWisetableColumns.get(vectorCounterTable) == null) {
                        tableColumns = new HashSet<String>();
                        tableColumns.add(counterName.getCounterName());
                        moIdWisetableColumns.put(vectorCounterTable, tableColumns);
                        if (mimColumnMap.get(counterName.getCounterName()) != null && mimColumnMap.get(counterName.getCounterName()).toString().contains(Constant.CM_VECTOR)) {
                          if (moIdWisetableColumns.get(counterTable) == null) {
                                tableColumns.add(counterName.getCounterName());
                                moIdWisetableColumns.put(counterTable, tableColumns);
                            } else {
                                moIdWisetableColumns.get(counterTable).add(counterName.getCounterName());
                            }
                        }
                    } else {
                        moIdWisetableColumns.get(vectorCounterTable).add(counterName.getCounterName());
                        if ( mimColumnMap.get(counterName.getCounterName()).toString().contains(Constant.CM_VECTOR)) {
                            if (moIdWisetableColumns.get(counterTable) == null) {
                                tableColumns.add(counterName.getCounterName());
                                moIdWisetableColumns.put(counterTable, tableColumns);
                            } else {
                                moIdWisetableColumns.get(counterTable).add(counterName.getCounterName());
                            }
                        }
                    }
                  }
            }
            }
        }
		return moIdWisetableColumns;
    }

    private static void populateCounterTable(final Summary summary, final StringBuilder createSQL,final Map<String, Set<String>> moIdWisetableColumns, final String tableType,final Map<String, List<String>> mapCounterFile) {final Map<String, StringBuilder> counterTypeMapping = Utility.getCounterTypeMapping();
    	for (final String moid : summary.getMoidCountersMap().keySet()) {
    		final String counterTable = tableType + STRING_UNDERSCORE + DEFAULT_COUNTER_TABLE_NAME + STRING_UNDERSCORE+ moid.substring(moid.lastIndexOf(STRING_COMMA) + 1, moid.lastIndexOf(STRING_EQUALS));
    		final String vectorCounterTable = tableType + STRING_UNDERSCORE + DEFAULT_VECTOR_TABLE_NAME + STRING_UNDERSCORE + moid.substring(moid.lastIndexOf(STRING_COMMA) + 1, moid.lastIndexOf(STRING_EQUALS));
    		final List<Counter> counterDetailsList = summary.getMoidCountersMap().get(moid);
    		for (final Counter counterValue : counterDetailsList) {
    			if(counterTypeMapping.get(counterValue.getCounterName().split(STRING_UNDERSCORE)[0]) != null)
    			{
    				if (Arrays.asList(counterValue.getCounterValue().split(STRING_COMMA)).size() == 1 && counterTypeMapping.get(counterValue.getCounterName().split(STRING_UNDERSCORE)[0]) != null&& !(counterTypeMapping.get(counterValue.getCounterName().split(STRING_UNDERSCORE)[0]).toString().contains(COMPRESSED_VECTOR))) {
    					if (counterValue.getCounterName().startsWith(Constant.FLEX_TYPE_COUNTER)) {
    						populateLoadTable(counterTable, summary, counterValue,moid,mapCounterFile,moIdWisetableColumns,null,null,false);
    					} else {
    						populateLoadTable(counterTable, summary, counterValue,moid,mapCounterFile,moIdWisetableColumns,null,null,false);
    					}
    				}
    				else {
    					final List<String> vectorList = Arrays.asList(counterValue.getCounterValue().split(STRING_COMMA));
    					if (counterTypeMapping.get(counterValue.getCounterName()) != null && counterTypeMapping.get(counterValue.getCounterName()).toString().contains(Constant.COMPRESSED_VECTOR)) {
    						final int compressedVectorLength = vectorList.size();
    						for (int i = 1; i < (compressedVectorLength - 1); i++) {
    							populateLoadTable(vectorCounterTable,summary, counterValue,moid,mapCounterFile,moIdWisetableColumns,vectorList.get(i),vectorList.get(i+1),false);
    							i = i + 1;
    							if (i >= compressedVectorLength) {
    								break;
    							}
    						}
    					} else {
    						for (int i = 0; i < vectorList.size(); i++) {
    							if (counterTypeMapping.get(counterValue.getCounterName()) != null && (counterTypeMapping.get(counterValue.getCounterName()).toString().contains(Constant.CM_VECTOR)) && i == 0) {
    								populateLoadTable(counterTable, summary, counterValue,moid,mapCounterFile,moIdWisetableColumns,null,vectorList.get(i),true);
    							} else {
    								populateLoadTable(vectorCounterTable,summary, counterValue,moid,mapCounterFile,moIdWisetableColumns,Integer.toString(i),vectorList.get(i),false);
    							}
    						}
    					}
    				}
    			}
    		}
    	}
    }

    private static void populateCounterTableMim(final Summary summary, final StringBuilder createSQL,final Map<String, Set<String>> moIdWisetableColumns, final String tableType,final Map<String, List<String>> mapCounterFile, final Map<String,String> mimColumnMap) {
    	for (final String moid : summary.getMoidCountersMap().keySet()) {
    		final String counterTable = tableType + STRING_UNDERSCORE + DEFAULT_COUNTER_TABLE_NAME + STRING_UNDERSCORE + moid.substring(moid.lastIndexOf(STRING_COMMA) + 1, moid.lastIndexOf(STRING_EQUALS));
    		final String vectorCounterTable = tableType + STRING_UNDERSCORE + DEFAULT_VECTOR_TABLE_NAME + STRING_UNDERSCORE + moid.substring(moid.lastIndexOf(STRING_COMMA) + 1, moid.lastIndexOf(STRING_EQUALS));
    		final List<Counter> counterDetailsList = summary.getMoidCountersMap().get(moid);
    		for (final Counter counterValue : counterDetailsList) {
    			if(mimColumnMap.get(counterValue.getCounterName().split(STRING_UNDERSCORE)[0]) != null)
    			{
    				if (Arrays.asList(counterValue.getCounterValue().split(STRING_COMMA)).size() == 1 && mimColumnMap.get(counterValue.getCounterName().split(STRING_UNDERSCORE)[0]) != null&& !(mimColumnMap.get(counterValue.getCounterName().split(STRING_UNDERSCORE)[0]).toString().contains(COMPRESSED_VECTOR))) {
    					if (counterValue.getCounterName().startsWith(Constant.FLEX_TYPE_COUNTER)) {
    						populateLoadTable(counterTable, summary, counterValue,moid,mapCounterFile,moIdWisetableColumns,null,null,false);
    					} else {
    						populateLoadTable(counterTable, summary, counterValue,moid,mapCounterFile,moIdWisetableColumns,null,null,false);
    					}
    				}
    				else {
    					final List<String> vectorList = Arrays.asList(counterValue.getCounterValue().split(STRING_COMMA));
    					if (mimColumnMap.get(counterValue.getCounterName()) != null && mimColumnMap.get(counterValue.getCounterName()).toString().contains(Constant.COMPRESSED_VECTOR)) {
    						final int compressedVectorLength = vectorList.size();
    						for (int i = 1; i < (compressedVectorLength - 1); i++) {
    							populateLoadTable(vectorCounterTable,summary, counterValue,moid,mapCounterFile,moIdWisetableColumns,vectorList.get(i),vectorList.get(i+1),false);
    							i = i + 1;
    							if (i >= compressedVectorLength) {
    								break;
    							}
    						}
    					} else {
    						for (int i = 0; i < vectorList.size(); i++) {
    							if (mimColumnMap.get(counterValue.getCounterName()) != null && (mimColumnMap.get(counterValue.getCounterName()).toString().contains(Constant.CM_VECTOR)) && i == 0) {
    								populateLoadTable(counterTable, summary, counterValue,moid,mapCounterFile,moIdWisetableColumns,null,vectorList.get(i),true);
    							} else {
    								populateLoadTable(vectorCounterTable,summary, counterValue,moid,mapCounterFile,moIdWisetableColumns,Integer.toString(i),vectorList.get(i),false);
    							}
    						}
    					}
    				}
    			}
    		}
    	}
    }
    private static void generateInsertQuery(final StringBuilder createSQL, final Map<String, String> tableColumnMap, final List<List<String>> data) {
        for (final String tableName : tableColumnMap.keySet()) {
            createSQL.append(String.format("\r INSERT INTO %s (", tableName));
            String prefix = "";
            for (final String column : tableColumnMap.get(tableName).split("\\|")) {
                createSQL.append(prefix);
                prefix = STRING_COMMA;
                createSQL.append(column);
            }
        }
        createSQL.append(") VALUES ");
        int count = 1;
        for (final List<String> rowData : data) {
            String prefix = "";
            createSQL.append(OPEN_PARENTHESIS);
            for (final String columnData : rowData) {
                createSQL.append(prefix);
                prefix = STRING_COMMA;
                queryBuilder(createSQL, columnData);
            }
            createSQL.append(CLOSE_PARENTHESIS);
            if (count != data.size()) {
                createSQL.append(STRING_COMMA).append(NEW_LINE).append(STRING_TAB);
            } else {
                createSQL.append(SEMICOLUMN).append(NEW_LINE);
            }
            count++;
        }
    }

    private static void createTableQueryForCounters(final StringBuilder createSQL, final Set<String> CounterColumns, final String tableName,
                                                    final String defaultColumn) {
       createSQL.append(String.format(DROP_TABLE_PREFIX, tableName)).append(SEMICOLUMN).append(NEW_LINE);
       createSQL.append(String.format(CREATE_TABLE_PREFIX + "%s", tableName, defaultColumn));
       final Iterator iterator = CounterColumns.iterator();
        int index = 0;
        while (iterator.hasNext()) {
            createSQL.append(iterator.next()).append(" Integer NULL");
            if (index < CounterColumns.size() - 1) {
                createSQL.append(STRING_COMMA);
            }
            index++;
        }
        createSQL.append(CLOSE_PARENTHESIS).append(SEMICOLUMN);
        
    }
}
