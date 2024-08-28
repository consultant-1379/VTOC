/**
 *
 */
package com.ericsson.eniq.events.parser.service;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.Calendar;
import java.util.Collection;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Map;
import java.util.Set;
import java.util.logging.Level;

import org.apache.poi.openxml4j.exceptions.InvalidFormatException;
import org.apache.poi.ss.formula.functions.T;
import org.apache.xmlbeans.XmlException;

import com.ericsson.eniq.events.topology.utils.FileUtils;
import com.ericsson.eniq.events.utils.Constant;
import com.ericsson.eniq.events.utils.Utility;
import com.ericsson.eniq.events.utils.logging.ParserLogger;

/**
 * @author Sanjay
 *
 */
public abstract class BaseCounterParser implements IParser<T> {

    protected Map<String, Summary> summaryDetailsMap = null;
    protected Map<String,String> mimColumnMap = new HashMap<String,String>();
    protected Summary summary = null;
    protected final String DATE_TIME_ID_FORMAT = "yyyy-MM-dd HH:mm:ss";

    abstract public void processFile(final File file);

    abstract public void sendENodeBCounters(final String outputLocation, final Map<String, Summary> summaryDetailsMap,final Map<String,String> mimColumnMap) throws FileNotFoundException;

    abstract public void sendOssCounters(final Map<String, Summary> summaryDetailsMap,Map<String,Set<String>> pmGroupEsCounter) throws FileNotFoundException;

    public void buildSummaryMap(final File file) {
        if (summary.getMoidCountersMap() == null) {
            summary.initializeMoidCountersMap();
        }
        processFile(file);
    }

    public void processFiles(final Collection<File> fileList) throws IOException {
        for (final File file : fileList) {
            summary = new Summary();
            buildSummaryMap(file);
            summaryDetailsMap.put(file.getName(), summary);
        }
    }

    public Map <String,String> processMimFiles(final Collection<File> fileList,String outputLocation,String parserType,Map <String,String> mimColumnMap) throws IOException {

        for (final File file : fileList) {
        	if(parserType.toUpperCase().contains(Constant.ECIM))
        	{
        		EcimParser ecim =new EcimParser();
        		if (file.getName().startsWith(Constant.PRBS))
        			{
        			ecim.processPRBSFileOneByOne(file,mimColumnMap,outputLocation);
        			}
        		else
        			{
        			ecim.processFileOneByOne(file,mimColumnMap,outputLocation);
        			}
        	}
        	else if(parserType.toUpperCase().contains(Constant.CPP))
        	{

        		CppParser cpp=new CppParser();
        		if (file.getName().startsWith(Constant.RBS))
        		{
        			cpp.processRBSFileOneByOne(file,mimColumnMap,outputLocation);
        		}
        		else
        		{
        			cpp.processFileOneByOne(file,mimColumnMap,outputLocation);
        		}
        	}
        }
        return mimColumnMap;
    }

    @Override
    public void ossParserService(final String inputLocation,final String ossSourceLocation,final String outputlocation,final String parserType,final String parserOption,final String ossParser) throws IOException, XmlException, InvalidFormatException
    {
    	//MIB File parsing to create Grit counters table<pmgroup,<counterName,counterType>> for ONE-PM Solution

    	final Collection<File> mibFileList = org.apache.commons.io.FileUtils.listFiles(new File(inputLocation), new String[] { Constant.FILE_EXT_XML }, true);
    	Map<String, Set<String>> pmgroupMap = new HashMap<String, Set<String>>();
    	Map<String,Set<String>> pmGroupEsCounter =new HashMap<String,Set<String>>();
    	Set<String> moSet=new HashSet<String>();

        if(mibFileList.size()>0){
        for (final File file:mibFileList){
        	if(file.getName().contains(Constant.STRING_EQUALS)){
        		System.out.println("XML files found are not MIBs");
            	System.exit(0);
        	}
        }
        for (final File file : mibFileList) {
        	if(parserType.toUpperCase().contains(Constant.ECIM))
        	{
        		EcimParser ecim =new EcimParser();
        		if (file.getName().startsWith(Constant.PRBS))
        		{
        			ecim.pmgroupPRBSDetails(file,pmgroupMap,outputlocation);
        		}
        		else
        		{
        			ecim.pmgroupDetails(file,pmgroupMap,outputlocation);
        		}

        	}
        	else if(parserType.toUpperCase().contains(Constant.CPP))
        	{
        		CppParser cpp =new CppParser();
        		if (file.getName().startsWith(Constant.RBS))
        		{
        			cpp.pmgroupRBSDetails(file,pmgroupMap,outputlocation);
        		}
        		else
        		{
        			cpp.pmgroupDetails(file,pmgroupMap,outputlocation);
        		}
        	}

        	}
        	}
        // end of mib parsing

        //PM File parsing to create Eniq Stats<moHierarchies,<counterName,counterType>> table to compare with grit counters table for ONE-PM Solution
        final Collection<File> files = org.apache.commons.io.FileUtils.listFiles(new File(inputLocation), new String[] { "gz" }, true);
        System.out.println(String.format("total zip file in %s  : %d", inputLocation, files.size()));
        ParserLogger.log(Level.INFO, String.format("total zip file in %s  : %d", inputLocation, files.size()));
        String unzippedLocation = "";
        FileUtils.cleanFolder(FileUtils.getUnzippedDirectory());
        FileUtils.createDirectry(FileUtils.getUnzippedDirectory());
        for (final File f : files) {
            final String file = f.getAbsolutePath();
            unzippedLocation = FileUtils.getUnzippedDirectory() + file.substring(file.lastIndexOf(File.separator) + 1, file.lastIndexOf("."));
            FileUtils.unzipFiles(file, unzippedLocation);
        }
        final Collection<File> fileList = org.apache.commons.io.FileUtils.listFiles(new File(FileUtils.getUnzippedDirectory()),
                new String[] { Constant.FILE_EXT_XML }, true);
        System.out.println(String.format("Total xml file is %s : %d", FileUtils.getUnzippedDirectory(), fileList.size()));
        ParserLogger.log(Level.INFO, String.format("Total xml file is %s : %d", FileUtils.getUnzippedDirectory(), fileList.size()));
        if(files.size() >0){
        	processFiles(fileList);
        }
        else{
        	System.out.println("No pm counter files found to parse.");
        	System.exit(0);
        }
        sendOssCounters(summaryDetailsMap,pmGroupEsCounter);
        System.out.println(String.format("Finished pm file parsing !!! "));

      //end of pm counter file parsing

        //ECIM Netsim file and CPP Mim file parsing to create GRIT moid hierarchies for ONE-PM solution-(In Progress)
        final Collection<File> netsimmimFileList = org.apache.commons.io.FileUtils.listFiles(new File(ossSourceLocation), new String[] { Constant.FILE_EXT_XML  }, true);
        if(netsimmimFileList.size()>0)
        	{
            for (final File file:netsimmimFileList)
            {
            	if(file.getName().contains(Constant.STRING_EQUALS)){
            		System.out.println("XML files found are not MIMs");
                	System.exit(0);
            	}
            }

            for (final File file : netsimmimFileList)
            	{
            		EcimMimParser ecimMim =new EcimMimParser();
            		ecimMim.processFileOneByOne(file,pmgroupMap,pmGroupEsCounter,outputlocation,moSet);
            	}
            }

        //end of mim file parsing

        FileUtils.writeToFile(outputlocation,ossParser);
        FileUtils.writeToFile(outputlocation,pmgroupMap,pmGroupEsCounter,moSet,ossParser);
        FileUtils.writeToFile(outputlocation,pmgroupMap,ossParser);
    	}


    @Override
    public void parserService(final String inputLocation, final String outputLocation,final String parserType,final String parserOption) throws IOException {
        final Collection<File> files = org.apache.commons.io.FileUtils.listFiles(new File(inputLocation), new String[] { "gz" }, true);
        System.out.println(String.format("total zip file in %s  : %d", inputLocation, files.size()));
        ParserLogger.log(Level.INFO, String.format("total zip file in %s  : %d", inputLocation, files.size()));
        String unzippedLocation = "";
        FileUtils.cleanFolder(FileUtils.getUnzippedDirectory());
        FileUtils.createDirectry(FileUtils.getUnzippedDirectory());
        for (final File f : files) {
            final String file = f.getAbsolutePath();
            unzippedLocation = FileUtils.getUnzippedDirectory() + file.substring(file.lastIndexOf(File.separator) + 1, file.lastIndexOf("."));
            FileUtils.unzipFiles(file, unzippedLocation);
        }
        final Collection<File> fileList = org.apache.commons.io.FileUtils.listFiles(new File(FileUtils.getUnzippedDirectory()),
                new String[] { Constant.FILE_EXT_XML  }, true);
        System.out.println(String.format("Total xml file is %s : %d", FileUtils.getUnzippedDirectory(), fileList.size()));
        ParserLogger.log(Level.INFO, String.format("Total xml file is %s : %d", FileUtils.getUnzippedDirectory(), fileList.size()));
        if(files.size() >0){
        processFiles(fileList);
        }
        else{
        	System.out.println("No pm counter files found to parse.");
        	System.exit(0);
        }
        final Collection<File> mimFileList = org.apache.commons.io.FileUtils.listFiles(new File(inputLocation), new String[] { Constant.FILE_EXT_XML  }, true);
        if(parserOption!=null)
        {
        if(mimFileList.size()>0){
        for (final File i:mimFileList){
        	if(i.getName().contains(Constant.STRING_EQUALS)){
        		System.out.println("XML files found are not MIMs");
            	System.exit(0);
        	}
        }

        processMimFiles(mimFileList,outputLocation,parserType,mimColumnMap);
        }
        else
        {
        	System.out.println("No MIM files found");
        	System.exit(0);
        }
        }

        sendENodeBCounters(outputLocation, summaryDetailsMap,mimColumnMap);

        System.out.println(String.format("Finished parsing !!! "));
    }
}
