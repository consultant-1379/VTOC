/**
 *
 */
package com.ericsson.eniq.events.parser.service;

import static com.ericsson.eniq.events.utils.Constant.*;

import java.io.File;
import java.io.FileNotFoundException;
import java.util.*;

import com.ericsson.eniq.events.counter.parser.jaxb.*;
import com.ericsson.eniq.events.parser.factory.ParserType;
import com.ericsson.eniq.events.topology.utils.FileUtils;
import com.ericsson.eniq.events.topology.utils.LoadCounterOutputXMLService;

/**
 * @author Sanjay
 *
 */
public class CounterParser extends BaseCounterParser {

    public CounterParser() {
        summaryDetailsMap = new HashMap<String, Summary>();
    }

    @Override
    public void processFile(final File file) {
        final Mdc mdc = (Mdc) LoadCounterOutputXMLService.loadXmlToJavaObjects(file, CONFIG_PACKAGE_NAME_FOR_JAXB_ENIQ);
        final List<Md> mdList = mdc.getMd();

        for (final Md md : mdList) {
            summary.setFdn(md.getNeid().getNedn());
            summary.setSwVersion(md.getNeid().getNesw());
            summary.setUserLabel(md.getNeid().getNeun());

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

            final String rList[] = r3GPP.getvalue().split(",");
            long counterValue = 0L;
            for (final String r : rList) {
                if (!r.trim().equals("")) {
                    counterValue = counterValue + Long.parseLong(r);

                }
            }
            updateMoidCounterValueMap(mv3GPP.getMoid(), mt, counterValue);
        }
    }

    public void updateMoidCounterValueMap(final String moid, final Mt mt3GPP, final long value) {
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

    public void updateCounterSummary(final long counterValue, final Counter counterSummary) {
        counterSummary.updatelteesCounterValue(counterValue);
    }

    public Counter updateCounterSummary(final long counterValue, final String counterName) {
        final Counter counterSummary = new Counter();
        counterSummary.setCounterName(counterName);

        counterSummary.updatelteesCounterValue(counterValue);
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
        final Set<String> CounterColumns = new HashSet<String>();
        for (final String fileName : summaryDetailsMap.keySet()) {
            FileUtils.writeToFile(outputLocation, summaryDetailsMap.get(fileName), CounterColumns);
        }
        FileUtils.writeToFile(outputLocation, CounterColumns);

    }

	@Override
	public void sendOssCounters(Map<String, Summary> summaryDetailsMap, Map<String, Set<String>> pmGroupEsCounter)
			throws FileNotFoundException {
		// TODO Auto-generated method stub

	}

}
