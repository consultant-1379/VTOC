package com.ericsson.eniq.events.topology.utils;

import java.io.File;

import javax.xml.stream.*;
import javax.xml.transform.stream.StreamSource;

public class LoadCounterOutputXMLService {

    public static <T> T loadXmlToJavaObjects(final File xmlConfigFile, final String configJAXBpkgName) {
        System.out.println("xmlConfigFile==" + xmlConfigFile.getAbsolutePath());
        // Load of counters xml file
        //FileInputStream xmlConfigFis;
        final XMLInputFactory xif = XMLInputFactory.newInstance();
        //XMLInputFactory xif=XMLInputFactory.newFactory();
        xif.setProperty(XMLInputFactory.SUPPORT_DTD, false);
        XMLStreamReader xmlConfigFis;
        try {
            xmlConfigFis = xif.createXMLStreamReader(new StreamSource(xmlConfigFile));
        } catch (final XMLStreamException e) {
            throw new RuntimeException(String.format("Can't load XML file %s", xmlConfigFile.getName()), e);
        }
        XmlLoader xmlConfigLoader = null;
        xmlConfigLoader = new XmlLoader(configJAXBpkgName);

        return xmlConfigLoader.loadXml(xmlConfigFis);
    }
}
