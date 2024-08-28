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
package com.ericsson.eniq.events.parser.service;

import static com.ericsson.eniq.events.utils.Constant.*;

import java.io.File;
import java.io.FileNotFoundException;
import java.text.SimpleDateFormat;
import java.util.*;

import com.ericsson.eniq.events.ecim.counter.parser.jaxb.*;
import com.ericsson.eniq.events.ecim.counter.parser.jaxb.MeasCollecFile.MeasData;
import com.ericsson.eniq.events.ecim.counter.parser.jaxb.MeasCollecFile.MeasData.MeasInfo;
import com.ericsson.eniq.events.ecim.counter.parser.jaxb.MeasCollecFile.MeasData.MeasInfo.MeasType;
import com.ericsson.eniq.events.ecim.counter.parser.jaxb.MeasCollecFile.MeasData.MeasInfo.MeasValue;
import com.ericsson.eniq.events.ecim.counter.parser.jaxb.MeasCollecFile.MeasData.MeasInfo.MeasValue.R;
import com.ericsson.eniq.events.parser.factory.ParserType;
import com.ericsson.eniq.events.topology.utils.FileUtils;
import com.ericsson.eniq.events.topology.utils.LoadCounterOutputXMLService;
import com.ericsson.eniq.events.topology.utils.QueryGenerator;
import com.ericsson.eniq.events.utils.Utility;

public class EcimCounterParser extends BaseCounterParser {

    public EcimCounterParser() {
        summaryDetailsMap = new HashMap<String, Summary>();
    }

    @Override
    public void parseStream(final byte[] bytes, final Object obj, final String inputFileName) throws Exception, CorruptedException {

    }

    @Override
    public String getParserType() {

        return ParserType.ECIM_COUNTER_DATA.name();
    }

    @Override
    public void processFile(final File file) {
        final MeasCollecFile measCollectFile = (MeasCollecFile) LoadCounterOutputXMLService.loadXmlToJavaObjects(file,
                CONFIG_PACKAGE_NAME_FOR_JAXB_ECIM_COUNTER);
        final Calendar calendar = Utility.extractDateFromFile(file.getName());
        final MeasData measData = measCollectFile.getMeasData();
        summary.setFdn(Utility.getFdn(file.getName()));
        summary.setSwVersion(measData.getManagedElement().getSwVersion());
        summary.setRopTime(new SimpleDateFormat(DATE_TIME_ID_FORMAT).format(calendar.getTime()));
        summary.setDate(new SimpleDateFormat(DATE_FORMAT).format(calendar.getTime()));
        summary.setDayId(calendar.get(Calendar.DATE));
        summary.setHourId(calendar.get(Calendar.HOUR_OF_DAY));
        summary.setMinId(calendar.get(Calendar.MINUTE));

        for (final MeasInfo measInfo : measData.getMeasInfo()) {

            int mtIterator = 0;
            for (final MeasType measType : measInfo.getMeasType()) {
                updateCounterSummary(measInfo, mtIterator, measType);
                mtIterator++;
            }
        }

    }

    public Counter updateCounterSummary(final MeasInfo mi3GPP, final int mtIterater, final MeasType mt) {
        calculateCouterValue(mi3GPP, mtIterater, mt);
        return null;
    }

    public void calculateCouterValue(final MeasInfo mi3GPP, final int mtIterater, final MeasType mt) {
        for (final MeasValue mv3GPP : mi3GPP.getMeasValue()) {
            final R r3GPP = mv3GPP.getR().get(mtIterater);

            final String counterValue = r3GPP.getValue();
            updateMoidCounterValueMap(mv3GPP.getMeasObjLdn(), mt, counterValue);
        }
    }

    public void updateMoidCounterValueMap(final String moid, final MeasType mt3GPP, final String value) {
        boolean counterExistInList = false;
        final List<Counter> summaryList = getSummaryList(moid);
        for (final Counter counterSummary : summaryList) {
            if (counterSummary.getCounterName().equals(mt3GPP.getValue())) {
                updateCounterSummary(value, counterSummary);
                counterExistInList = true;
                break;
            }
        }
        if (!counterExistInList) {
            summaryList.add(updateCounterSummary(value, mt3GPP.getValue()));
        }
        summary.getMoidCountersMap().put(moid, summaryList);
    }

    public void updateCounterSummary(final String counterValue, final Counter counterSummary) {
        counterSummary.updateCounterValue(counterValue);
    }

    public Counter updateCounterSummary(final String counterValue, final String counterName) {
        final Counter counterSummary = new Counter();
        counterSummary.setCounterName(counterName);
        counterSummary.updateCounterValue(counterValue);
        return counterSummary;
    }

    private List<Counter> getSummaryList(final String moid) {
        if (summary.getMoidCountersMap().containsKey(moid)) {
            return summary.getMoidCountersMap().get(moid);
        }
        return new ArrayList<Counter>();
    }

    @Override
    public String toString() {
        final StringBuilder stringBuilder = new StringBuilder();
        for (final String moid : summary.getMoidCountersMap().keySet()) {
            stringBuilder.append(System.getProperty("line.separator"));
            stringBuilder.append(String
                    .format("----------------------------------------------------------------------------------------------------"));
            stringBuilder.append(System.getProperty("line.separator"));
            stringBuilder.append(String.format("%-15s", moid));
            stringBuilder.append(System.getProperty("line.separator"));
            stringBuilder.append(String
                    .format("----------------------------------------------------------------------------------------------------"));

        }
        return stringBuilder.toString();
    }

    @Override
    public void sendENodeBCounters(final String outputLocation, final Map<String, Summary> summaryDetailsMap,final Map<String,String> mimColumnMap) throws FileNotFoundException {
    	Map<String, List<List<String>>> mapLoadTable=new HashMap<>();
        final Map<String, Set<String>> CounterColumns = new HashMap<String, Set<String>>();
        for (final String fileName : summaryDetailsMap.keySet()) {
        	FileUtils.writeToTableColumnMap(summaryDetailsMap.get(fileName), CounterColumns,ECIM,mimColumnMap);
        }

        for (final String fileName : summaryDetailsMap.keySet()) {
        	FileUtils.writeToLoadTableMap(outputLocation,summaryDetailsMap.get(fileName), CounterColumns,ECIM, mapLoadTable,mimColumnMap);
        }

        FileUtils.writeToLoadFile(outputLocation, mapLoadTable,CounterColumns);
        FileUtils.writeToFile(outputLocation, CounterColumns);

    }

    @Override
    public void sendOssCounters(Map<String, Summary> summaryDetailsMap,Map<String,Set<String>> pmGroupEsCounter) throws FileNotFoundException {
        	for (final String fileName : summaryDetailsMap.keySet()) {
            	FileUtils.writeTopmESCounterMap(summaryDetailsMap.get(fileName),ECIM,pmGroupEsCounter);
    }
    }
}
