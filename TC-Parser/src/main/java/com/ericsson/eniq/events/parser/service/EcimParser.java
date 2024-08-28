package com.ericsson.eniq.events.parser.service;

import static com.ericsson.eniq.events.utils.Constant.*;

import java.io.File;
import java.io.IOException;
import java.util.*;
import java.util.logging.Level;

import org.apache.poi.openxml4j.exceptions.InvalidFormatException;
import org.apache.xmlbeans.XmlException;

import com.ericsson.eniq.events.ecim.parser.jaxb.*;
import com.ericsson.eniq.events.ecim.parser.jaxb.Object;
import com.ericsson.eniq.events.parser.factory.ParserType;
import com.ericsson.eniq.events.topology.utils.FileUtils;
import com.ericsson.eniq.events.topology.utils.LoadCounterOutputXMLService;
import com.ericsson.eniq.events.utils.logging.ParserLogger;

public class EcimParser implements IParser {
    @Override
	public void ossParserService(String inputLocation, String ossSourceLocation, String outputlocation,
			String parserType, String parserOption, String ossParser)
			throws IOException, XmlException, InvalidFormatException {
		// TODO Auto-generated method stub

	}

	private String outputLocation = "";
    private Set<String> countersList = null;

    @Override
    public void parseStream(final byte[] bytes, final java.lang.Object obj, final String inputFileName) throws Exception, CorruptedException {
        throw new IllegalAccessException("Stream data parse is not supported !!!!");
    }

    @Override
    public void parserService(final String inputLocation, final String outputLocation,final String parserType,final String parserOption) throws IOException {
        this.outputLocation = outputLocation;
        final Collection<File> fileList = org.apache.commons.io.FileUtils.listFiles(new File(inputLocation), new String[] { FILE_EXT_XML }, true);
        processFiles(fileList);

    }

    @Override
    public String getParserType() {
        return ParserType.ECIM_COUNTER_DATA.name();
    }

    public void processFiles(final Collection<File> fileList) throws IOException {
        countersList = new HashSet<>();
        for (final File file : fileList) {
            System.out.println(String.format("Location of xml file is %s:", file.getParent()));
            ParserLogger.log(Level.INFO, String.format("Location of xml file is %s:", file.getParent()));
            System.out.println(String.format("Finished parsing !!! "));
        }
    }

    public Map<String,String> processFileOneByOne(final File file,final Map<String,String> mimColumnMap,String outputLocation) throws IOException {
    	String counterName =null;
        String counterType=null;
        String multiVal=null;
        Boolean isPeg=null;

        final Models models = (Models) LoadCounterOutputXMLService.loadXmlToJavaObjects(file, CONFIG_PACKAGE_NAME_FOR_JAXB_ECIM);
        final Mib mib = models.getMib();
        final List<Object> objectList = mib.getObject();

        for (final Object object : objectList) {
          final List<Slot> slotList = object.getSlot();
            for (final Slot slot : slotList) {
                if (slot.getName().equals((STRING_TYPEID))) {
                	counterName=slot.getValue();

                    }
                if(slot.getName().equals((STRING_MULTIPLICITY)))
                		{
                	isPeg=false;
                	int val=Integer.parseInt(slot.getValue());
                	if(val==1)
                	{
                		counterType =ECIM_SIMPLE;
                		isPeg=true;
                	}
                	else{
                		multiVal=VECTOR;

                    }
                	if(counterType!=null)
                	{
                	mimColumnMap.put(counterName,counterType);
                	}
                	}

                if(multiVal==VECTOR && slot.getName().equals(ECIM_isCompressed) && !isPeg){

                	String compressedVal=slot.getValue().toLowerCase();
                	       if(compressedVal.equals(STRING_TRUE)){
                	    	   counterType=COMPRESSED_VECTOR;
                	       }
                	       else
                	       {
                	    	   counterType=ECIM_VECTOR;
                	       }
                	       mimColumnMap.put(counterName,counterType);
                		}
                 }
            }


        for (Map.Entry<String, String> entry :mimColumnMap.entrySet()) {
			String key = entry.getKey();
			ParserLogger.log(Level.INFO, String.format("pmGroup name---- %s", key));
			String value=entry.getValue();
			ParserLogger.log(Level.INFO, String.format("counter name---- %s", value));
        }
    FileUtils.writeToFile(outputLocation, getParserType(), mimColumnMap);
    return mimColumnMap;

    }

    public Map<String,String> processPRBSFileOneByOne(final File file, Map<String, String> mimColumnMap,String outputLocation) throws IOException {
    	String counterName =null;
        String counterType=null;
        Boolean isPeg=false;
        final Models models = (Models) LoadCounterOutputXMLService.loadXmlToJavaObjects(file, CONFIG_PACKAGE_NAME_FOR_JAXB_ECIM);
        final Mib mib = models.getMib();
        final List<Object> objectList = mib.getObject();

        for (final Object object : objectList) {
            		final List<Slot> slotList = object.getSlot();
            		int val=0;
            				for (final Slot slot : slotList) {

            					if(slot.getName().equals((STRING_MULTIPLICITY)))
            					{
            						 val=Integer.parseInt(slot.getValue());
            						if(val==1)
            						{
            							counterType =ECIM_SIMPLE;
            							isPeg=true;
            						}
            						else
            						{
            							isPeg=false;
            						}
            					}
            					if(!isPeg && slot.getName().equals(STRING_DESC))
            						{
            						String compressedVal=slot.getValue().toLowerCase();
            						if(compressedVal.contains(COMPRESSED_DESC))
            							{
            								counterType=COMPRESSED_VECTOR;
            							}
            						else
            							{
            							counterType=ECIM_VECTOR;
            							}
            						}
            						if (slot.getName().equals(STRING_TYPEID)) {
                                    	counterName=slot.getValue();
                                    	if(counterName.toLowerCase().startsWith(FLEX_TYPE_COUNTER.toLowerCase()))
                                    	{
                                    		counterType =FLEX_COUNTER;
                                    	}
                                    	mimColumnMap.put(counterName,counterType);
                					}
            				}
            				}
           for (Map.Entry<String,String> entry :mimColumnMap.entrySet()) {
			String key = entry.getKey();
			ParserLogger.log(Level.INFO, String.format("pmGroup name---- %s", key));
			String value=entry.getValue();
			ParserLogger.log(Level.INFO, String.format("counter name---- %s", value));
        }
        FileUtils.writeToFile(outputLocation, getParserType(), mimColumnMap);
        return mimColumnMap;
    }

    public Map<String, Set<String>> pmgroupDetails(final File file, Map<String, Set<String>> pmgroupMap,String outputLocation) throws IOException {
    	Set<String>countersList = null;
    	String pmGroup =null;
    	String counterName =null;
        String counterType=null;
        final Models models = (Models) LoadCounterOutputXMLService.loadXmlToJavaObjects(file, CONFIG_PACKAGE_NAME_FOR_JAXB_ECIM);
        final Mib mib = models.getMib();
        final List<Object> objectList = mib.getObject();

        for (final Object object : objectList) {
             final String parentDn = object.getParentDn();
            	if(parentDn.contains(STRING_PMGROUP)){
            		pmGroup = (parentDn.substring(parentDn.lastIndexOf(STRING_EQUALS)+1));
            		if (pmGroup.contains(STATS) || pmGroup.contains(PMGROUP) || pmGroup.contains(COUNTERGROUP) || pmGroup.contains(PMFLEX)){
            			if(pmGroup.contains(STATS)){
            				pmGroup= pmGroup.split(STATS)[0];
            			}
            				else if(pmGroup.contains(PMGROUP)){
            					pmGroup=pmGroup.split(PMGROUP)[0];
            				}
            				else if(pmGroup.contains(COUNTERGROUP)){
            					pmGroup=pmGroup.split(COUNTERGROUP)[0];
            				}
            				else if (pmGroup.startsWith(PMFLEX)){
            					pmGroup=pmGroup.split(PMFLEX)[1];
            			}
            			}
            		final List<Slot> slotList = object.getSlot();
            		int val=0;

            				Boolean isCompressed=false;
            				counterName ="";
            				counterType="";
            				for (final Slot slot : slotList) {
            					if (slot.getName().equals(STRING_TYPEID)) {
                                	counterName=slot.getValue();
                                	if(counterName.toLowerCase().startsWith(FLEX_TYPE_COUNTER.toLowerCase()))
                                	{
                                		counterType =FLEX_COUNTER;
                                	}
            					}

            					if(slot.getName().equals(STRING_DESC)){
            						isCompressed=false;
            						String compressedVal=slot.getValue().toLowerCase();
            						if(compressedVal.contains(COMPRESSED_DESC)){
            							counterType=COMPRESSED_VECTOR;
            							isCompressed=true;
               					}
            					}
            						if(!isCompressed && slot.getName().equals((STRING_MULTIPLICITY)) && !counterName.toLowerCase().startsWith(FLEX))
                					{

                						 val=Integer.parseInt(slot.getValue());
                						if(val==1)
                						{
                							counterType =ECIM_SIMPLE;

                						}
                						else
                						{
                							counterType=ECIM_VECTOR;
                						}

                					}



                	if(counterType!="")
                	{
                		if (pmgroupMap.get(pmGroup) == null) {
                			countersList=new HashSet<String>();
                			countersList.add(counterName+"," +counterType);

                    		pmgroupMap.put(pmGroup, countersList);
                    	}
                    	else{

                    		pmgroupMap.get(pmGroup).add(counterName+"," +counterType);

                    	}
                	}

            				}

                		}
        }
        for (Map.Entry<String, Set<String>> entry :pmgroupMap.entrySet()) {
			String key = entry.getKey();
			ParserLogger.log(Level.INFO, String.format("pmGroup name---- %s", key));
			Set<String> value=entry.getValue();
			ParserLogger.log(Level.INFO, String.format("counter name---- %s", value));
        }
        return pmgroupMap;
    }

public Map<String, Set<String>> pmgroupPRBSDetails(final File file, Map<String, Set<String>> pmgroupMap,String outputLocation) throws IOException
	{
	Set<String>countersList = null;
	String pmGroup =null;
	Boolean isPeg=false;
	String counterName =null;
    String counterType=null;
    final Models models = (Models) LoadCounterOutputXMLService.loadXmlToJavaObjects(file, CONFIG_PACKAGE_NAME_FOR_JAXB_ECIM);
    final Mib mib = models.getMib();
    final List<Object> objectList = mib.getObject();

    for (final Object object : objectList) {
         final String parentDn = object.getParentDn();
        	if(parentDn.contains(STRING_PMGROUP)){
        		pmGroup = (parentDn.substring(parentDn.lastIndexOf(STRING_EQUALS)+1));
        		if (pmGroup.contains(STATS) || pmGroup.contains(PMGROUP) || pmGroup.contains(COUNTERGROUP) || pmGroup.contains(PMFLEX)){
        			if(pmGroup.contains(STATS)){
        				pmGroup= pmGroup.split(STATS)[0];
        			}
        				else if(pmGroup.contains(PMGROUP)){
        					pmGroup=pmGroup.split(PMGROUP)[0];
        				}
        				else if(pmGroup.contains(COUNTERGROUP)){
        					pmGroup=pmGroup.split(COUNTERGROUP)[0];
        				}
        				else if (pmGroup.startsWith(PMFLEX)){
        					pmGroup=pmGroup.split(PMFLEX)[1];
        			}
        			}

        		final List<Slot> slotList = object.getSlot();
        		counterType="";
        		counterName="";
        		int val=0;
        		for (final Slot slot : slotList) {
        		if(slot.getName().equals((STRING_MULTIPLICITY)))
        		{
        			val=Integer.parseInt(slot.getValue());
        			if(val==1)
        			{
        				counterType =ECIM_SIMPLE;
        				isPeg=true;
        			}
        			else
        			{
        				isPeg=false;
        			}
        		}
        		else if(!isPeg && slot.getName().equals(STRING_DESC)){
        			String compressedVal=slot.getValue().toLowerCase();
        			if(compressedVal.contains(COMPRESSED_DESC)){
        				counterType=COMPRESSED_VECTOR;
        			}
        			else{
        				counterType=ECIM_VECTOR;
        			}
        		}
        		else if (slot.getName().equals(STRING_TYPEID)) {
        			counterName=slot.getValue();
        			if(counterName.toLowerCase().startsWith(PMFLEX.toLowerCase()))
        			{
        				counterType =FLEX_COUNTER;
        			}


        		}

        		}
        		if(counterType!="")
    			{
            		if (pmgroupMap.get(pmGroup) == null) {
            			countersList=new HashSet<String>();
            			countersList.add(counterName+"," +counterType);

                		pmgroupMap.put(pmGroup, countersList);
                	}
                	else{

                		pmgroupMap.get(pmGroup).add(counterName+"," +counterType);

                	}
    			}
        	}


    }

    for (Map.Entry<String,Set<String>> entry :pmgroupMap.entrySet()) {
		String key = entry.getKey();
		ParserLogger.log(Level.INFO, String.format("pmGroup name---- %s", key));
		Set<String> value=entry.getValue();
		ParserLogger.log(Level.INFO, String.format("counter name---- %s", value));
    }
    return pmgroupMap;
}
}
