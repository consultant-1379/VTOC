package com.ericsson.eniq.events.parser.service;

import static com.ericsson.eniq.events.utils.Constant.*;

import java.io.File;
import java.io.IOException;
import java.util.*;
import java.util.logging.Level;

import javax.xml.bind.JAXBElement;
import org.apache.poi.openxml4j.exceptions.InvalidFormatException;
import org.apache.xmlbeans.XmlException;

import com.ericsson.eniq.events.cpp.parser.jaxb.*;
import com.ericsson.eniq.events.cpp.parser.jaxb.Models.Mim;
import com.ericsson.eniq.events.cpp.parser.jaxb.Models.Mim.Class;
import com.ericsson.eniq.events.cpp.parser.jaxb.Models.Mim.Class.Attribute;
import com.ericsson.eniq.events.parser.factory.ParserType;
import com.ericsson.eniq.events.topology.utils.FileUtils;
import com.ericsson.eniq.events.topology.utils.LoadCounterOutputXMLService;
import com.ericsson.eniq.events.utils.logging.ParserLogger;

public class CppParser implements IParser {
    private String outputLocation = "";
    private Set<String> countersList = null;

    @Override
    public void parseStream(final byte[] bytes, final Object out, final String inputFileName) throws Exception, CorruptedException {
        throw new IllegalAccessException("Stream data parse is not supported !!!!");
    }

    @Override
    public void parserService(final String inputLocation, final String outputLocation,final String parserType,final String parserOption) throws IOException {
        this.outputLocation = outputLocation;
        final Collection<File> fileList = org.apache.commons.io.FileUtils.listFiles(new File(inputLocation), new String[] { FILE_EXT_XML }, true);
    }

    @Override
    public String getParserType() {
        return ParserType.CPP_COUNTER_DATA.name();
    }

    public void processFiles(final Collection<File> fileList) throws IOException {
        countersList = new HashSet<>();
        for (final File file : fileList) {
            System.out.println(String.format("Location of xml file is %s:", file.getParent()));
            ParserLogger.log(Level.INFO, String.format("Location of xml file is %s:", file.getParent()));
            System.out.println(String.format("Finished parsing !!! "));
            ParserLogger.log(Level.INFO,String.format("Finished parsing !!! "));
        }
    }

    public Map<String,String> processFileOneByOne(final File file,final Map<String,String> mimColumnMap,String outputLocation) throws IOException {
    	String counterName =null;
        String counterType=null;
        Boolean isCompressed=null;
        final Object modelsObject = LoadCounterOutputXMLService.loadXmlToJavaObjects(file, CONFIG_PACKAGE_NAME_FOR_JAXB_CPP);
        final Models models = modelsObject instanceof Models ? (Models) modelsObject : null;
        if (models == null) {
            throw new IllegalAccessError("Not a model object");
        }
        final Mim mim = models.getMim();
        final List<Class> moList = mim.getClazz();
        for (final Class mo : moList) {
            final List<JAXBElement<?>> moParameter = mo.getDescriptionOrSystemCreatedOrDependencies();
            for (final JAXBElement<?> attribute : moParameter) {
            	isCompressed=false;
                if (attribute.getName().toString().equals(STRING_ATTRIBUTE)) {
                    final Attribute attr = (Attribute) attribute.getValue();
                    final List<JAXBElement<?>> b = attr.getDescriptionOrMandatoryOrNoNotification();
                    for (final JAXBElement<?> c : b) {
                    	counterType=null;
                    if(c.getName().toString().trim().equals(STRING_DESC))
                	{
                	String desc=c.getValue().toString().toLowerCase();

                	if(desc.contains(COMPRESSED_DESC))
                	{
                		 counterName = attr.getName();
                		 counterType=COMPRESSED_VECTOR;
                		 isCompressed=true;
                		 mimColumnMap.put(counterName,counterType);
                	}
                	}

                    else if (c.getName().toString().trim().equals(STRING_COUNTERTYPE )&& !isCompressed)
                        {
                    	 if(c.getValue().toString().equals(DDM))
                    	 		{
                                  counterName = attr.getName();
                                  counterType=CM_VECTOR;
                    	 		}

                    	 else if(attr.getName().startsWith(FLEX_TYPE_COUNTER))
             	 			{
             	 			counterName = attr.getName();
             	 		    counterType=FLEX_COUNTER;
             	 			}
             	 		else if(c.getValue().toString().equals(ECIM_VECTOR)){
             	 			counterName = attr.getName();
             	 			counterType=ECIM_VECTOR;
             	 		}
             	 		else{
             	 			counterName = attr.getName();
             	 			counterType=ECIM_SIMPLE;
             	 		}
                            mimColumnMap.put(counterName,counterType);
                        }
                	}

                }
            }
        }

        FileUtils.writeToFile(outputLocation, getParserType(), mimColumnMap);
        return mimColumnMap;
    }

    public Map<String,String> processRBSFileOneByOne(final File file,Map<String,String> mimColumnMap,String outputLocation) throws IOException {
    	String counterName =null;
        String counterType=null;
        Boolean isCounter =false;
        final Object modelsObject = LoadCounterOutputXMLService.loadXmlToJavaObjects(file, CONFIG_PACKAGE_NAME_FOR_JAXB_CPP);
        final Models models = modelsObject instanceof Models ? (Models) modelsObject : null;
        if (models == null) {
            throw new IllegalAccessError("Not a model object");
        }

        final Mim mim = models.getMim();
        final List<Class> moList = mim.getClazz();
        for (final Class mo : moList) {
            final List<JAXBElement<?>> moParameter = mo.getDescriptionOrSystemCreatedOrDependencies();
            for (final JAXBElement<?> attribute : moParameter) {
                if (attribute.getName().toString().equals(STRING_ATTRIBUTE)) {
                    final Attribute attr = (Attribute) attribute.getValue();
                    final List<JAXBElement<?>> b = attr.getDescriptionOrMandatoryOrNoNotification();
                    for (final JAXBElement<?> c : b) {
                    	isCounter =false;
                    	counterType=null;
                    	counterName =null;
                            if(c.getName().toString().trim().equals(STRING_DESC))
                        	{
                        	String desc=c.getValue().toString().toLowerCase();
                        	if(desc.contains(RBS_VECTOR) && desc.contains(COUNTER_ID))
                        		{
                        		counterType=ECIM_VECTOR;
                        		counterName = attr.getName();
                        		isCounter=true;
                        		mimColumnMap.put(counterName,counterType);
                        		}
                        	if(desc.contains(RBS_CMVECTOR) && desc.contains(COUNTER_ID))
                        		{
                             		counterType=CM_VECTOR;
                             		counterName = attr.getName();
                             		isCounter=true;
                             		mimColumnMap.put(counterName,counterType);
                        		}
                        		if(!isCounter && desc.contains(COUNTER_ID))
                        			{
                             			counterType=ECIM_SIMPLE;
                             			counterName = attr.getName();
                             			mimColumnMap.put(counterName,counterType);
                        			}
                        		}

                            }
                        }
                    }
                }

        for (Map.Entry<String, String> entry :mimColumnMap.entrySet()) {
			String key = entry.getKey();
			ParserLogger.log(Level.INFO, String.format("counter name---- %s", key));
			String value=entry.getValue();
			ParserLogger.log(Level.INFO, String.format("counter type---- %s", value));
        }
        FileUtils.writeToFile(outputLocation, getParserType(), mimColumnMap);
        return mimColumnMap;
       }

    public Map<String, Set<String>> pmgroupDetails(final File file,final Map<String, Set<String>> pmgroupMap,String outputLocation) throws IOException {
    	Set<String>countersList = null;
    	String counterName =null;
        String counterType=null;
        Boolean isCompressed=null;
        final Object modelsObject = LoadCounterOutputXMLService.loadXmlToJavaObjects(file, CONFIG_PACKAGE_NAME_FOR_JAXB_CPP);
        final Models models = modelsObject instanceof Models ? (Models) modelsObject : null;
        if (models == null) {
            throw new IllegalAccessError("Not a model object");
        }
        final Mim mim = models.getMim();
        final List<Class> moList = mim.getClazz();
        for (final Class mo : moList) {
        	countersList =new HashSet<String>();
            final List<JAXBElement<?>> moParameter = mo.getDescriptionOrSystemCreatedOrDependencies();
            final String pmGroup = mo.getName();
            for (final JAXBElement<?> attribute : moParameter) {
            	counterType=null;
            	counterName=null;
            	isCompressed=false;
                if (attribute.getName().toString().equals(STRING_ATTRIBUTE)) {
                    final Attribute attr = (Attribute) attribute.getValue();
                    final List<JAXBElement<?>> b = attr.getDescriptionOrMandatoryOrNoNotification();
                    for (final JAXBElement<?> c : b) {

                    if(c.getName().toString().trim().equals(STRING_DESC))
                	{
                	String desc=c.getValue().toString().toLowerCase();

                	if(desc.contains(COMPRESSED_DESC))
                	{
                		 counterName = attr.getName();
                		counterType=COMPRESSED_VECTOR;
                		isCompressed=true;
                	}
                	}
                    if (c.getName().toString().trim().equals(STRING_COUNTERTYPE )&& !isCompressed)
                        {
                    	 if(c.getValue().toString().equals(DDM))
                    	 		{
                                  counterName = attr.getName();
                                  counterType=CM_VECTOR;
                    	 		}
                    	 		else if(attr.getName().startsWith(FLEX_TYPE_COUNTER))
                    	 		{
                    	 			counterName = attr.getName();
                    	 		    counterType=FLEX_COUNTER;
                                }
                    	 		else if(c.getValue().toString().equals(PDF)){
                    	 			counterName = attr.getName();
                    	 			counterType=ECIM_VECTOR;
                    	 		}
                    	 		else{
                    	 			counterName = attr.getName();
                    	 			counterType=ECIM_SIMPLE;
                    	 		}

                        }

            		if(counterType!=null){
                        if(pmgroupMap.get(pmGroup)==null){
                        	countersList.add(counterName+STRING_COMMA +counterType);
                     		pmgroupMap.put(pmGroup,countersList);
                     		}
                     		else{
                     			pmgroupMap.get(pmGroup).add(counterName+STRING_COMMA +counterType);
                     		}
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

public Map<String, Set<String>> pmgroupRBSDetails(final File file,final Map<String, Set<String>> pmgroupMap,String outputLocation) throws IOException {
	Set<String>countersList = null;
	String counterName =null;
    String counterType=null;
    final Object modelsObject = LoadCounterOutputXMLService.loadXmlToJavaObjects(file, CONFIG_PACKAGE_NAME_FOR_JAXB_CPP);
    final Models models = modelsObject instanceof Models ? (Models) modelsObject : null;
    if (models == null) {
        throw new IllegalAccessError("Not a model object");
    }
    final Mim mim = models.getMim();
    final List<Class> moList = mim.getClazz();
    for (final Class mo : moList) {
    	countersList =new HashSet<String>();
        final List<JAXBElement<?>> moParameter = mo.getDescriptionOrSystemCreatedOrDependencies();
        final String pmGroup = mo.getName();
        for (final JAXBElement<?> attribute : moParameter) {
        	 counterName =null;
             counterType=null;
            if (attribute.getName().toString().equals(STRING_ATTRIBUTE)) {
                final Attribute attr = (Attribute) attribute.getValue();
                final List<JAXBElement<?>> b = attr.getDescriptionOrMandatoryOrNoNotification();
                for (final JAXBElement<?> c : b) {
                if(c.getName().toString().trim().equals(STRING_DESC))
            	{
            	String desc=c.getValue().toString().toLowerCase();
            	if(desc.contains(COUNTER_ID))
            	{
            		if(desc.contains(RBS_VECTOR))
            		{
            		counterName = attr.getName();
            		counterType=ECIM_VECTOR;
            		}
            		else if(desc.contains(RBS_CMVECTOR))
            		{
            			counterName = attr.getName();
                 		counterType=CM_VECTOR;
            		}
            		else{
            			counterName = attr.getName();
                 		counterType=ECIM_SIMPLE;

            		}
            		countersList.add(counterName+STRING_COMMA +counterType);
            		if(counterType!=null){
                        if(pmgroupMap.get(pmGroup)==null){
                     		pmgroupMap.put(pmGroup,countersList);
                     		}
                     		else{
                     			pmgroupMap.get(pmGroup).add(counterName+STRING_COMMA +counterType);
                     		}
            			}
            	}

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

@Override
public void ossParserService(String inputLocation, String ossSourceLocation, String outputlocation, String parserType,
		String parserOption, String ossParser) throws IOException, XmlException, InvalidFormatException {
	// TODO Auto-generated method stub

}
}
