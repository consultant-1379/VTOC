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
package com.ericsson.eniq.events.parser.service;

import java.io.IOException;

import org.apache.poi.openxml4j.exceptions.InvalidFormatException;
import org.apache.xmlbeans.XmlException;

import com.ericsson.eniq.events.topology.mo.EnodeBOutput;

public interface IParser<T> {

    String CELLID = "cellId";
    String CID = "cId";
    String CELLIDENTITY = "cellIdentity";
    String EUTRANCELLFDDID = "EUtranCellFDDId";
    String EUTRANCELLTDDID = "EUtranCellTDDId";
    String ENODEBFUNCTION = "ENodeBFunction";
    String MECONTEXT = "MeContext";
    String MANAGEDELEMENT = "ManagedElement";
    String JAXB_FULL_PACKAGE = "com.ericsson.eniq.events.topology.jaxb.full";
    String JAXB_DELTA_PACKAGE = "com.ericsson.eniq.events.topology.jaxb.delta";
    String UDR_CREATED = "Created";
    String UDR_MODIFIED = "Modified";
    String UDR_DELETED = "Deleted";

    public void parseStream(final byte[] bytes, final Object obj, String inputFileName) throws Exception, CorruptedException;// NOPMD

    public void parserService(final String inputLocation, final String outputLocation,final String parserType,final String parserOption) throws IOException, XmlException, InvalidFormatException;

    public void ossParserService(final String inputLocation,final String ossSourceLocation,final String outputlocation,final String parserType,final String parserOption,final String ossParser) throws IOException, XmlException, InvalidFormatException;

    public String getParserType();
}
