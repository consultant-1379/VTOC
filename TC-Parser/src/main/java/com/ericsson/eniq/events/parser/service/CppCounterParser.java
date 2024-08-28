
package com.ericsson.eniq.events.parser.service;

import static com.ericsson.eniq.events.utils.Constant.*;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.*;

import org.apache.poi.openxml4j.exceptions.InvalidFormatException;
import org.apache.xmlbeans.XmlException;

import com.ericsson.eniq.events.counter.parser.jaxb.*;
import com.ericsson.eniq.events.parser.factory.ParserType;
import com.ericsson.eniq.events.topology.utils.FileUtils;
import com.ericsson.eniq.events.topology.utils.LoadCounterOutputXMLService;
import com.ericsson.eniq.events.utils.Utility;


/**
 * @author Sanjay
 *
 */

public class CppCounterParser extends BaseCounterParser {


	public CppCounterParser() {
        summaryDetailsMap = new HashMap<String, Summary>();
    }

    @Override
    public void processFile(final File file) {
        final Mdc mdc = (Mdc) LoadCounterOutputXMLService.loadXmlToJavaObjects(file, CONFIG_PACKAGE_NAME_FOR_JAXB_ENIQ);
        final List<Md> mdList = mdc.getMd();
        final Calendar calendar = Utility.extractDateFromFile(file.getName());
        for (final Md md : mdList) {

            summary.setFdn(Utility.getFdn(file.getName()));
            summary.setSwVersion(md.getNeid().getNesw());
            summary.setUserLabel(md.getNeid().getNeun());
            summary.setRopTime(new SimpleDateFormat(DATE_TIME_ID_FORMAT).format(calendar.getTime()));
            summary.setDate(new SimpleDateFormat(DATE_FORMAT).format(calendar.getTime()));
            summary.setDayId(calendar.get(Calendar.DATE));
            summary.setHourId(calendar.get(Calendar.HOUR_OF_DAY));
            summary.setMinId(calendar.get(Calendar.MINUTE));

            final List<Mi> miList = md.getMi();

            for (final Mi mi3GPP : miList) {

                int mtIterator = 0;
                for (final Mt mt3GPP : mi3GPP.getMt()) {
                    updateCounterSummary(mi3GPP, mtIterator, mt3GPP);
                    mtIterator++;
                }
            }
        }
    }

    public Counter updateCounterSummary(final Mi mi3GPP, final int mtIterater, final Mt mt) {
        calculateCouterValue(mi3GPP, mtIterater, mt);
        return null;
    }

    public void calculateCouterValue(final Mi mi3GPP, final int mtIterater, final Mt mt) {
        for (final Mv mv3GPP : mi3GPP.getMv()) {
            final R r3GPP = mv3GPP.getR().get(mtIterater);
            final String counterValue = r3GPP.getvalue();
            updateMoidCounterValueMap(mv3GPP.getMoid(), mt, counterValue);
        }
    }

    public void updateMoidCounterValueMap(final String moid, final Mt mt3GPP, final String value) {
        boolean counterExistInList = false;
        final List<Counter> summaryList = getSummaryList(moid);
        for (final Counter counterSummary : summaryList) {
            if (counterSummary.getCounterName().equals(mt3GPP.getvalue())) {
                updateCounterSummary(value, counterSummary);
                counterExistInList = true;
                break;
            }
        }
        if (!counterExistInList) {
            summaryList.add(updateCounterSummary(value, mt3GPP.getvalue()));
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
    public void parseStream(final byte[] bytes, final Object out, final String inputFileName) throws Exception, CorruptedException {

    }

    @Override
    public String getParserType() {
        return ParserType.COUNTER.name();

    }

    @Override
    public void sendENodeBCounters(final String outputLocation, final Map<String, Summary> summaryDetailsMap,final Map<String,String> mimColumnMap) throws FileNotFoundException {
    	Map<String, List<List<String>>> mapLoadTable=new HashMap<>();
        final Map<String, Set<String>> CounterColumns = new HashMap<String, Set<String>>();
        for (final String fileName : summaryDetailsMap.keySet()) {
        	FileUtils.writeToTableColumnMap(summaryDetailsMap.get(fileName), CounterColumns,CPP,mimColumnMap);
        }
        for (final String fileName : summaryDetailsMap.keySet()) {
        	FileUtils.writeToLoadTableMap(outputLocation,summaryDetailsMap.get(fileName), CounterColumns,CPP, mapLoadTable,mimColumnMap);
        }
        	FileUtils.writeToLoadFile(outputLocation, mapLoadTable,CounterColumns);
        FileUtils.writeToFile(outputLocation, CounterColumns);
    }

    @Override
	public void sendOssCounters(Map<String, Summary> summaryDetailsMap,Map<String,Set<String>> pmGroupEsCounter) throws FileNotFoundException {
    	for (final String fileName : summaryDetailsMap.keySet()) {
        	FileUtils.writeTopmESCounterMap(summaryDetailsMap.get(fileName),CPP,pmGroupEsCounter);
}
}

}
