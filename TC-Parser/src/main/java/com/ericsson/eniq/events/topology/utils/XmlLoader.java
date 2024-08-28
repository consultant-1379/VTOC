package com.ericsson.eniq.events.topology.utils;

import java.io.InputStream;

import javax.xml.bind.JAXBContext;
import javax.xml.bind.JAXBException;
import javax.xml.bind.Unmarshaller;
import javax.xml.stream.XMLStreamReader;

public class XmlLoader {

    private JAXBContext jaxbContext;

    private Unmarshaller unmarshaller;

    public XmlLoader(final String packageName) {
        try {
            jaxbContext = JAXBContext.newInstance(packageName);
            unmarshaller = jaxbContext.createUnmarshaller();
        } catch (final JAXBException e) {
            throw new RuntimeException(e);
        }
    }

    @SuppressWarnings("unchecked")
    public <T> T loadXml(final XMLStreamReader istrm) {
        try {
            return (T) unmarshaller.unmarshal(istrm);
        } catch (final JAXBException e) {
            throw new RuntimeException(e);
        }
    }
}