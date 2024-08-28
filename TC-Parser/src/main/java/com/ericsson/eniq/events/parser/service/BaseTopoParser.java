package com.ericsson.eniq.events.parser.service;

import java.io.ByteArrayInputStream;
import java.io.IOException;

import javax.xml.bind.JAXBContext;
import javax.xml.bind.JAXBException;
import javax.xml.bind.Unmarshaller;

import org.xml.sax.EntityResolver;
import org.xml.sax.InputSource;
import org.xml.sax.SAXException;

import com.ericsson.eniq.events.topology.mo.EnodeBOutput;

public abstract class BaseTopoParser implements IParser<EnodeBOutput> {

    protected Unmarshaller u;//NOPMD
    protected JAXBContext jc;//NOPMD
    protected EntityResolver entityResolver;//NOPMD
    private int fullparserInstanceCount = 0;//NOPMD
    private int deltaParserInstanceCount = 0;//NOPMD

    BaseTopoParser(final String jaxbPackage) {
        if (JAXB_FULL_PACKAGE.equalsIgnoreCase(jaxbPackage)) {
            fullparserInstanceCount += 1;
        } else if (JAXB_DELTA_PACKAGE.equalsIgnoreCase(jaxbPackage)) {
            deltaParserInstanceCount += 1;
        }
        try {
            synchronized (JAXBContext.class) {
                jc = JAXBContext.newInstance(jaxbPackage);
            }
            u = jc.createUnmarshaller();
            entityResolver = new EntityResolver() {
                @Override
                public InputSource resolveEntity(final String publicId, final String systemId) throws SAXException, IOException {
                    final InputSource saxIs = new InputSource(new ByteArrayInputStream("".getBytes()));

                    return saxIs;
                }
            };

        } catch (final JAXBException jaxe) {
            jaxe.printStackTrace();
        } catch (final Exception e) {
            e.printStackTrace();
        }

    }


    @Override
    public void parseStream(final byte[] bytes, final Object out, final String inputFileName) throws Exception, CorruptedException {

    }
}
