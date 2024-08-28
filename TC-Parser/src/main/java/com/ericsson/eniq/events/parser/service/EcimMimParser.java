package com.ericsson.eniq.events.parser.service;

import static com.ericsson.eniq.events.utils.Constant.CONFIG_PACKAGE_NAME_FOR_JAXB_ECIM_MIM;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collection;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Hashtable;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.logging.Level;
import org.apache.poi.openxml4j.exceptions.InvalidFormatException;
import org.apache.xmlbeans.XmlException;
import com.ericsson.eniq.events.ecim.mim.parser.jaxb.Models;
import com.ericsson.eniq.events.ecim.mim.parser.jaxb.Models.Mim;
import com.ericsson.eniq.events.ecim.mim.parser.jaxb.Models.Mim.Relationship;
import com.ericsson.eniq.events.ecim.mim.parser.jaxb.Models.Mim.Relationship.Containment;
import com.ericsson.eniq.events.parser.factory.ParserType;
import com.ericsson.eniq.events.topology.utils.FileUtils;
import com.ericsson.eniq.events.topology.utils.LoadCounterOutputXMLService;
import com.ericsson.eniq.events.utils.Constant;
import com.ericsson.eniq.events.utils.logging.ParserLogger;

public class EcimMimParser implements IParser {

    private String outputLocation = "";
    @Override
    public void parseStream(final byte[] bytes, final java.lang.Object obj, final String inputFileName) throws Exception, CorruptedException {
        throw new IllegalAccessException("Stream data parse is not supported !!!!");
    }

    @Override
    public void parserService(final String inputLocation, final String outputLocation,final String parserType,final String parserOption) throws IOException {
            }
    @Override
	public void ossParserService(String inputLocation, String ossSourceLocation, String outlocation, String parserType,
			String parserOption, String ossParser) throws IOException, XmlException, InvalidFormatException {
		// TODO Auto-generated method stub

	}

	@Override
    public String getParserType() {
        return ParserType.ECIM_SCHEMA.name();
    }


    public void processFileOneByOne(final File file, final Map<String, Set<String>> pmgroupMap,final Map<String, Set<String>> pmGroupEsCounter,String outputLocation,Set<String> moSet) throws IOException {
		 List<String> parentList = new ArrayList<String>();
		 List<String> childList = new ArrayList<String>();
		final Object modelsObject = LoadCounterOutputXMLService.loadXmlToJavaObjects(file,CONFIG_PACKAGE_NAME_FOR_JAXB_ECIM_MIM);
		final Models models = modelsObject instanceof Models ? (Models) modelsObject : null;

       if (models == null)
       {
           throw new IllegalAccessError("Not a model object");
       }
       Mim mim = models.getMim();

       final List<Relationship> relationshipList = mim.getRelationship();
       for (final Relationship relationship:relationshipList)
       {

    	   if(!relationship.getName().contains(Constant.RESERVED_BY)){
    		   final Containment containment = relationship.getContainment();
    		   if(containment!=null)
        	   	{
        		   String parent="";
        		   String child="";
        		   if(containment.getParent().getHasClass().getName().contains(Constant.STRING_COLON))
        		   		{
		        		   parent=containment.getParent().getHasClass().getName().split(Constant.STRING_COLON)[1];
		        		   parentList.add(parent);
		        		   child=containment.getChild().getHasClass().getName().split(Constant.STRING_COLON)[1];
		        		   childList.add(child);
        		   		}
        		   else
        				{
	        			   parent=containment.getParent().getHasClass().getName();
	            		   parentList.add(parent);
	            		   child=containment.getChild().getHasClass().getName();
	            		   childList.add(child);
        				}
        		}
    	   }
       }

	 buildParentChildMap(parentList,childList,pmgroupMap,moSet);
	}

    public void buildParentChildMap(List<String> parentList,List<String> childList,Map<String, Set<String>> pmgroupMap,Set<String> moSet)
    {
       	List<String> pmGroupList=new ArrayList<String>();
       	final Map<String, Set<String>> parentChildMap = new LinkedHashMap<String, Set<String>>();
       	Set<String> tmpParentListNew=new HashSet<String>();
       	List<String> MOID=new ArrayList<String>();

       	for (Map.Entry<String, Set<String>> entry :pmgroupMap.entrySet())
       		{
			String key = entry.getKey();
			pmGroupList.add(key);
			}


       	//Create ParentChild Map for all the child node
    	  for(int i=0;i<childList.size();i++)
    	  	{
    		  String tempChild=childList.get(i);
    		  tmpParentListNew=new HashSet<String>();
    		  for (int j = 0; j < childList.size(); j++)
			   	{
     	        if(tempChild.equals(childList.get(j)))
     	          {
     	        	tmpParentListNew.add(parentList.get(j));
     	          }
			   	}
    		  parentChildMap.put(tempChild,tmpParentListNew);
    	  }
    	  //end of parentChild Map creation


    	  //Handling first level hierarchy for all child pmGroup
    	  for(String child:pmGroupList)
    	  {
            Set<String> parentsList= parentChildMap.get(child);
            	for(String parent:parentsList)
    				{
            			MOID.add(new String(Constant.STRING_COMMA+parent+Constant.STRING_COMMA+child));
    				}

          	}

    	  buildMOIDs(MOID,parentChildMap,moSet);
    }



    public void buildMOIDs(List<String> MOID,Map<String,Set<String>> parentChildMap,Set<String> moSet)
    	{
    	int count=0;
    	do{
    		count=0;
	        buildMultiParentMOIDs(MOID,parentChildMap);
	    	for(String mo:MOID)
	    		{
	    			if(mo.startsWith(Constant.STRING_COMMA+Constant.MANAGED_ELEMENT))
	    			{
	    			count++;
	    			}
	    		}
    	}while(count!=MOID.size());


        for(String mo:MOID)
    	 {
        	moSet.add(mo);
    	}
    }

    public List<String> buildMultiParentList(List<String> MOID,Map<String, Set<String>> parentChildMap,List<String> multiParentList)
    {

    	for(int i=0;i<MOID.size();i++)
        {
        	String tmpChild=MOID.get(i).split(Constant.STRING_COMMA)[1];
    		Set<String> parentsList= parentChildMap.get(tmpChild);
        	int size=0;
        	if(parentsList!=null)
        		{
        		 size=parentsList.size();
        		 if (size > 1)
        		 	{
        			 	multiParentList.add(MOID.get(i));
        		 	}
        		}
        	}
        return multiParentList;
    }

    public List<String> buildMultiParentMOIDs(List<String> MOID,Map<String,Set<String>> parentChildMap)
    {

    	List<String> multiParentList=new ArrayList<String>();
    	Set<String> tmpParentSet=null;
        buildMultiParentList(MOID,parentChildMap,multiParentList);
    	 for(String s:multiParentList)
    	  {
         	String tmpChild=s.split(Constant.STRING_COMMA)[1];
         	tmpParentSet= parentChildMap.get(tmpChild);
         	for(int k=0;k<tmpParentSet.size()-1;k++)
 			{
         		if(!tmpParentSet.contains(tmpChild))
         		{

 				MOID.add(new String(s));
         		}
 			}
          }

	    for(int i=0;i<MOID.size();i++)
	    	{
	    	tmpParentSet=new HashSet<String>();
			String tmpMOID="";
			Boolean b=false;
	    	if(!MOID.get(i).split(Constant.STRING_COMMA)[1].startsWith(Constant.MANAGED_ELEMENT))
	    		{
	    		String tmpChild=MOID.get(i).split(Constant.STRING_COMMA)[1];
	    		tmpParentSet= parentChildMap.get(tmpChild);
		        for(String tmpParent:tmpParentSet)
					{
						String tmpNewChild=MOID.get(i).split(Constant.STRING_COMMA)[1];
						Set<String> tmpNewParentSet=new HashSet<String>();
						tmpNewParentSet=parentChildMap.get(tmpNewChild);
						if(tmpNewParentSet.contains(tmpParent))
							{
								tmpMOID=Constant.STRING_COMMA+tmpParent+MOID.get(i);
			   					b=false;
			   					for(int j=0;j<MOID.size();j++)
			   						{
			   						if(!MOID.get(j).split(Constant.STRING_COMMA)[1].startsWith(Constant.MANAGED_ELEMENT))
			   			    			{
			   							if(MOID.get(j).contains(tmpMOID))
			   								{
			   								b=true;
			   								}
			   							}
			   						}
			   					if(!b)
			   						{
			   							MOID.set(i,tmpMOID);
			   						}
							}
	   					tmpMOID="";
					}
	    		}
	    	}

    return MOID;
    
    }
}
