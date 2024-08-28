package com.ericsson.eniq.events.parser.service;

import java.io.*;
import java.nio.file.*;
import java.util.*;

import javax.xml.bind.JAXBException;
import javax.xml.parsers.SAXParserFactory;
import javax.xml.transform.Source;
import javax.xml.transform.sax.SAXSource;

import org.apache.poi.openxml4j.exceptions.InvalidFormatException;
import org.apache.xmlbeans.XmlException;
import org.xml.sax.*;

import com.ericsson.eniq.events.topology.jaxb.full.*;
import com.ericsson.eniq.events.topology.mo.*;
import com.ericsson.eniq.events.topology.utils.FileUtils;

public class FullTopoParser extends BaseTopoParser {

    // NOPMD

    public FullTopoParser() {
        super(JAXB_FULL_PACKAGE);
    }

    /**
     * Parse a Stream
     *
     * @param stream
     *            - InputStream
     */
    @Override
    public void parseStream(final byte[] bytes, final Object out, final String inputFileName) throws Exception, CorruptedException {

        Model model = null;
        try {

            final InputStream is = new ByteArrayInputStream(bytes);
            final SAXParserFactory sax = SAXParserFactory.newInstance();
            sax.setNamespaceAware(true);
            final XMLReader xmlreader = sax.newSAXParser().getXMLReader();
            xmlreader.setEntityResolver(entityResolver);
            final InputSource input = new InputSource(is);
            final Source source = new SAXSource(xmlreader, input);
            model = (Model) u.unmarshal(source);
        } catch (final JAXBException e) {
            e.printStackTrace();
            throw new CorruptedException(e);
        } catch (final SAXException e) {
            e.printStackTrace();
            throw new CorruptedException(e);
        } catch (final Exception e) {
            e.printStackTrace();
            throw new CorruptedException(e);
        }
        final EnodeBOutput eNBOut = (EnodeBOutput) out;
        parseRequiredMo(inputFileName, model, eNBOut);

    }

    public void parseRequiredMo(final String inputFileName, final Model model, final NBRelationOutput out) throws Exception {
        try {
            final List<Mo> moList = model.getMo();
            final EnodeB eNB = geteNBInfo(moList, inputFileName);
            final EnodeBFunction eNBFunction = geteNBIdAndFdn(moList, inputFileName);
            final List<EUtranCell> listEUtranCell = getEUtranCellDetails(moList, eNBFunction);
            final List<CellRelations> listCellRelation = getCellRelationDetails(moList, listEUtranCell, eNBFunction);
            final List<TermPointToEnodeB> listTermPointToEnodeB = getTermPointToEnodeBs(moList, eNBFunction);
            final List<TermPointToMme> listTermPointToMme = getTermPointToMmes(moList, eNBFunction);
            final List<ProcessorLoad> listprocessorLoad = getProcessorLoadDetails(moList, eNBFunction);
            out.sendENodeB(eNB, eNBFunction, listEUtranCell, listCellRelation, listTermPointToEnodeB, listTermPointToMme, listprocessorLoad);
        } catch (final Exception e) {
            e.printStackTrace();
            throw new Exception(e);
        }
    }

    public List<TermPointToEnodeB> getTermPointToEnodeBs(final List<Mo> moList, final EnodeBFunction eNBFunction) {

        String lastFDN = null;
        String enbFDN = null;
        String fullFDN = null;
        String extFDN = null;
        final List<TermPointToEnodeB> listTermPointToEnodeB = new ArrayList<TermPointToEnodeB>();
        TermPointToEnodeB termPointToEnodeB = null;
        for (final Mo mo : moList) {
            lastFDN = getFDNType(mo);
            if ("TermPointToENB".equals(lastFDN)) {
                fullFDN = mo.getFdn();
                final int beginIndex = fullFDN.indexOf(MANAGEDELEMENT);
                enbFDN = fullFDN.substring(beginIndex);
                termPointToEnodeB = new TermPointToEnodeB();// NOPMD
                termPointToEnodeB.set_fdn(fullFDN);
                termPointToEnodeB.set_moid(enbFDN);
                final int extIndex = fullFDN.indexOf("TermPointToENB");
                extFDN = fullFDN.substring(0, extIndex - 1);
                termPointToEnodeB.set_externalENodeBFdn(extFDN);
                termPointToEnodeB.set_nodeFdn(eNBFunction.get_nodeName());
                final ExtENodeBFunction _extENodeBFnUDR = getExtENodeBFn(moList, extFDN);
                termPointToEnodeB.set_extENodeBFn(_extENodeBFnUDR);
                listTermPointToEnodeB.add(termPointToEnodeB);
            }
        }
        return listTermPointToEnodeB;
    }

    private List<TermPointToMme> getTermPointToMmes(final List<Mo> moList, final EnodeBFunction eNBFunction) {// NOPMD

        String lastFDN = null;
        String mmeFDN = null;
        final List<TermPointToMme> listTermPointToMme = new ArrayList<TermPointToMme>();
        TermPointToMme termPointToMme = null;
        for (final Mo mo : moList) {
            lastFDN = getFDNType(mo);
            if ("TermPointToMme".equals(lastFDN)) {
                final int beginIndex = mo.getFdn().indexOf(MANAGEDELEMENT);
                mmeFDN = mo.getFdn().substring(beginIndex);
                termPointToMme = new TermPointToMme();// NOPMD
                termPointToMme.set_fdn(mo.getFdn());
                termPointToMme.set_moid(mmeFDN);
                termPointToMme.set_nodeFdn(eNBFunction.get_nodeName());
                List<Integer> listCodes = null;
                for (final Attr childAttr : mo.getAttr()) {
                    if ("mmeCodeListLTERelated".equals(childAttr.getName())) {
                        listCodes = new ArrayList<Integer>();// NOPMD
                        Seq seq = null;// Seq

                        for (final Object obj : childAttr.getContent()) {
                            if (obj instanceof Seq) {
                                seq = (Seq) obj;
                            }
                        }
                        if (seq != null) {
                            for (final Item item : seq.getItem()) {
                                listCodes.add(new Integer(item.getContent().get(0).toString()));// NOPMD
                            }
                        }
                        termPointToMme.set_mmeCodeListLTERelated(listCodes);
                    }
                    List<PlmnId> _servedPlmnList = null;
                    if ("servedPlmnListLTERelated".equals(childAttr.getName())) {
                        _servedPlmnList = new ArrayList<PlmnId>();// NOPMD
                        PlmnId servedPlmnListLTERelated = null;
                        // /////////////////////////////////////////////////////////////
                        Seq seq = null;// Seq
                        for (final Object obj : childAttr.getContent()) {
                            if (obj instanceof Seq) {
                                seq = (Seq) obj;
                            }
                        }

                        if (seq != null) {
                            final List<Item> listItems = seq.getItem();// items
                            for (final Item item : listItems) {
                                Struct struct = null;
                                for (final Object obj : item.getContent()) {
                                    if (obj instanceof Struct) {
                                        struct = (Struct) obj;
                                    }
                                }

                                if (struct != null) {

                                    final List<Attr> servAttrs = struct.getAttr();

                                    servedPlmnListLTERelated = new PlmnId();// NOPM

                                    for (final Attr attrx : servAttrs) {

                                        setServedPlmnListLTERelatedUDRWithAttributes(servedPlmnListLTERelated, attrx);

                                    }
                                }
                                if (servedPlmnListLTERelated.mccMncNull) {
                                    System.out.println("The value of these fields are missing from full topology file(mcc,mnc,mncLength )"
                                            + "from  servedPlmnListLTERelatedUDR attribute.");
                                    System.out.println("The values into the object of full topology  are:" + servedPlmnListLTERelated);
                                    // Setting mnc value -1 in case of exception
                                    // as 0 is valid value for the mnc.
                                    if (servedPlmnListLTERelated.get_mnc() == "0") {
                                        servedPlmnListLTERelated.set_mnc("-1");
                                    }

                                }
                                _servedPlmnList.add(servedPlmnListLTERelated);

                            }

                        }
                        termPointToMme.set_servedPlmnList(_servedPlmnList);
                    }
                    List<Integer> listGIs = null;
                    if ("mmeGIListLTERelated".equals(childAttr.getName())) {
                        listGIs = new ArrayList<Integer>();// NOPMD
                        Seq seq = null;// Seq
                        for (final Object obj : childAttr.getContent()) {
                            if (obj instanceof Seq) {
                                seq = (Seq) obj;
                            }
                        }
                        if (seq != null) {
                            final List<Item> listItems = seq.getItem();// items
                            for (final Item item : listItems) {
                                listGIs.add(new Integer(item.getContent().get(0).toString()));// NOPMD
                            }
                        }

                        termPointToMme.set_mmeGIListLTERelated(listGIs);
                    }
                }
                listTermPointToMme.add(termPointToMme);
            }
        }
        return listTermPointToMme;
    }

    private void setServedPlmnListLTERelatedUDRWithAttributes(final PlmnId servedPlmnListLTERelatedUDR, final Attr inAttr) {

        try {

            if ("mcc".equalsIgnoreCase(inAttr.getName())) {
                servedPlmnListLTERelatedUDR.set_mcc(new Long(getValue(inAttr)).longValue());// NOPMD
            }
            if ("mnc".equalsIgnoreCase(inAttr.getName())) {
                servedPlmnListLTERelatedUDR.set_mnc(getValue(inAttr));// NOPMD
            }
            if ("mncLength".equalsIgnoreCase(inAttr.getName())) {
                servedPlmnListLTERelatedUDR.set_mncLength(new Long(getValue(inAttr)).longValue());// NOPMD
            }
        } catch (final Exception e) {
            e.printStackTrace();
            servedPlmnListLTERelatedUDR.mccMncNull = true;
        }
    }

    private ExtENodeBFunction getExtENodeBFn(final List<Mo> moList, final String extFDN) {// NOPMD

        ExtENodeBFunction extENodeBFnUDR = null;
        for (final Mo mo : moList) {
            if (extFDN != null && extFDN.equals(mo.getFdn())) {
                extENodeBFnUDR = new ExtENodeBFunction();// NOPMD
                extENodeBFnUDR.set_fdn(extFDN);
                final List<Attr> attrList = mo.getAttr();
                for (final Attr childAttr1 : attrList) {
                    if ("eNBId".equals(childAttr1.getName())) {
                        extENodeBFnUDR.set_externalENBId(getValue(childAttr1));
                    }
                    if ("eNodeBPlmnId".equals(childAttr1.getName())) {
                        final PlmnId eNodeBPlmnId = getPlmnId(childAttr1);
                        extENodeBFnUDR.set_eNodeBPlmnId(eNodeBPlmnId);
                    }
                }
            }
        }
        return extENodeBFnUDR;
    }

    private List<CellRelations> getCellRelationDetails(final List<Mo> moList, final List<EUtranCell> listEUtranCell,
                                                       final EnodeBFunction eNBFunction) {
        final List<CellRelations> listCellRelation = new ArrayList<CellRelations>();
        final Map<String, String> mapCellRelation = new HashMap<String, String>();
        CellRelations cellRelation = null;
        for (final EUtranCell eUtranCell : listEUtranCell) {
            mapCellRelation.put(eUtranCell.get_cellID(), eUtranCell.get_fdn());
        }
        final Map<String, List<Object[]>> nbrRelations = getNbrRefsForAllCellids(moList, mapCellRelation);
        List<NbrCell> nbrCellDetails = null;
        for (final String key : nbrRelations.keySet()) {// cellId
            cellRelation = new CellRelations();
            cellRelation.set_cellId(key);
            nbrCellDetails = new ArrayList<NbrCell>();
            String relFdn = null;
            NbrCell nbrCellUDR = null;
            for (final Object[] nbr : nbrRelations.get(key)) {
                nbrCellUDR = new NbrCell();// NOPMD
                nbrCellUDR.set_nbrCellID((String) nbr[0]);
                nbrCellUDR.set_nbrENodeBID((String) nbr[1]);
                nbrCellUDR.set_nbrENodeBFDN((String) nbr[2]);
                relFdn = (String) nbr[3]; //_fdn cellRelation
                nbrCellUDR.set_fdn(relFdn);
                final int beginIndex = relFdn.indexOf(MANAGEDELEMENT);
                nbrCellUDR.set_moid(relFdn.substring(beginIndex));
                nbrCellUDR.set_nbrEnodeBPlmnId((PlmnId) nbr[4]);
                if (nbr[4] != null) {
                    nbrCellUDR.set_nbrMccId((Long.toString(((PlmnId) nbr[4]).get_mcc())));
                    nbrCellUDR.set_nbrMncId(((PlmnId) nbr[4]).get_mnc());
                }
                nbrCellUDR.set_nbrCellREF((String) nbr[5]);
                nbrCellUDR.setCellRelationType((CellRelationType) nbr[6]);
                nbrCellDetails.add(nbrCellUDR);

            }
            cellRelation.set_listNbrCellDetails(nbrCellDetails);
            cellRelation.set_nodeFdn(eNBFunction.get_nodeName());
            listCellRelation.add(cellRelation);
        }
        return listCellRelation;
    }

    private EnodeB geteNBInfo(final List<Mo> moList, final String inputFileName) {
        final EnodeB eNB = new EnodeB();
        String lastFDN = null;
        for (final Mo mo : moList) {
            lastFDN = getFDNType(mo);
            if ((!inputFileName.contains(MANAGEDELEMENT) && MECONTEXT.equals(lastFDN))
                    || (inputFileName.contains(MANAGEDELEMENT) && MANAGEDELEMENT.equals(lastFDN))) {
                eNB.set_fdn(mo.getFdn());
                geteNBIdAndFdnWhenMeContextOrManagedElementLastFdn(eNB, mo);
                break;
            }
        }
        return eNB;
    }

    public EnodeBFunction geteNBIdAndFdn(final List<Mo> moList, final String inputFileName) {
        final EnodeBFunction eNBFunction = new EnodeBFunction();
        String lastFDN = null;
        for (final Mo mo : moList) {
            lastFDN = getFDNType(mo);
            if (ENODEBFUNCTION.equals(lastFDN)) {
                geteNBIdAndFdnWhenENODEBFUNCTIONLastFdn(eNBFunction, mo, inputFileName);
            }

        }
        return eNBFunction;
    }

    public List<EUtranCell> getEUtranCellDetails(final List<Mo> moList, final EnodeBFunction eNBFunction) {

        final List<EUtranCell> listEUtranCell = new ArrayList<EUtranCell>();
        EUtranCell eUtranCell = null;
        String cellId = null;
        String lastFDN = null;
        String cellFDN = null;
        String fullFDN = null;

        for (final Mo mo : moList) {
            lastFDN = getFDNType(mo);
            cellId = null;
            if ("EUtranCellFDD".equals(lastFDN) || "EUtranCellTDD".equals(lastFDN)) {
                eUtranCell = new EUtranCell();
                fullFDN = mo.getFdn();
                final int beginIndex = fullFDN.indexOf(MANAGEDELEMENT);

                cellFDN = fullFDN.substring(beginIndex);
                if (cellId == null) {
                    for (final Attr childAttr : mo.getAttr()) {
                        cellId = setAttrCellId(cellId, childAttr);
                        if (cellId != null) {
                            break;
                        }
                    }
                }
            }

            if (cellId != null && eUtranCell != null && eNBFunction != null) {
                eUtranCell.set_cellID(cellId);// NOPMD
                eUtranCell.set_moid(cellFDN);// ManagedElement=1,////
                eUtranCell.set_fdn(fullFDN);// ManagedElement=1,////
                eUtranCell.set_eNBId(eNBFunction.get_eNBId());
                eUtranCell.set_nodeFdn(eNBFunction.get_nodeName());
                listEUtranCell.add(eUtranCell);
            }
        }

        return listEUtranCell;
    }

    public List<ProcessorLoad> getProcessorLoadDetails(final List<Mo> moList, final EnodeBFunction eNBFuncton) {
        String lastFDN = null;
        String fullFDN = null;
        ProcessorLoad processorLoad = null;
        final List<ProcessorLoad> listProcessorLoad = new ArrayList<ProcessorLoad>();
        for (final Mo mo : moList) {
            lastFDN = getFDNType(mo);
            if ("ProcessorLoad".equals(lastFDN)) {
                processorLoad = new ProcessorLoad();// NOPMD
                fullFDN = mo.getFdn();
                final int beginIndex = fullFDN.indexOf(MANAGEDELEMENT);
                processorLoad.set_fdn(fullFDN);
                processorLoad.set_moid(fullFDN.substring(beginIndex));
                processorLoad.set_nodeFdn(eNBFuncton.get_nodeName());
                processorLoad.set_SlotId(fullFDN);
                listProcessorLoad.add(processorLoad);
            }
        }
        return listProcessorLoad;
    }

    private void geteNBIdAndFdnWhenENODEBFUNCTIONLastFdn(final EnodeBFunction eNBFunction, final Mo mo, final String inputFileName) {
        final int lastIndex;
        final String fullFdn = mo.getFdn();
        if (null != fullFdn) {
            if (!inputFileName.contains(MANAGEDELEMENT)) {
                lastIndex = fullFdn.indexOf(MANAGEDELEMENT);
            } else {
                lastIndex = fullFdn.indexOf(ENODEBFUNCTION);
            }
            eNBFunction.set_fdn(fullFdn);
            eNBFunction.set_moid(mo.getFdn().substring(mo.getFdn().indexOf(MANAGEDELEMENT)));
            eNBFunction.set_nodeName(mo.getFdn().substring(0, lastIndex - 1));

            boolean haseNBInfo = false, hasPlmnInfo = false;
            for (final Attr childAttr : mo.getAttr()) {
                if ("eNBId".equals(childAttr.getName())) {
                    eNBFunction.set_eNBId(getValue(childAttr));
                    haseNBInfo = true;
                }
                if ("eNodeBPlmnId".equals(childAttr.getName())) {
                    final PlmnId plmnId = getPlmnId(childAttr);
                    eNBFunction.set_eNodeBPlmnId(plmnId);
                    hasPlmnInfo = true;
                }

                if (haseNBInfo && hasPlmnInfo) {
                    break;
                }
            }
        }
    }

    public String getFDNType(final Mo mo) {
        final String fdn = mo.getFdn();
        final String eNB = fdn.substring(fdn.lastIndexOf(",") + 1, fdn.lastIndexOf("="));
        return eNB;
    }

    private void geteNBIdAndFdnWhenMeContextOrManagedElementLastFdn(final EnodeB eNB, final Mo mo) {
        for (final Attr childAttr : mo.getAttr()) {
            if ("userLabel".equals(childAttr.getName())) {
                eNB.set_userLabel(getValue(childAttr));
            }
            if ("swVersion".equals(childAttr.getName())) {
                eNB.set_swVersion(getValue(childAttr));
            }
        }
    }

    private String getValue(final Attr childAttrX) {
        String strValue = null;
        final List<Object> content = childAttrX.getContent();
        if (content != null && !content.isEmpty() && content.size() > 0 && content.get(0) != null) {
            strValue = content.get(0).toString();
        }
        return strValue;
    }

    private PlmnId getPlmnId(final Attr childAttr1) {
        final PlmnId eNodeBPlmnId = new PlmnId();
        Struct struct = null;
        for (final Object obj : childAttr1.getContent()) {
            if (obj instanceof Struct) {
                struct = (Struct) obj;
            }
        }
        if (struct != null) {
            for (final Attr attr : struct.getAttr()) {
                try {
                    if ("mcc".equalsIgnoreCase(attr.getName())) {
                        eNodeBPlmnId.set_mcc(new Long(getValue(attr)).longValue());// NOPMD
                    }
                    if ("mnc".equalsIgnoreCase(attr.getName())) {
                        eNodeBPlmnId.set_mnc(getValue(attr));// NOPMD
                    }
                    if ("mncLength".equalsIgnoreCase(attr.getName())) {
                        eNodeBPlmnId.set_mncLength(new Long(getValue(attr)).longValue());// NOPMD
                    }
                } catch (final Exception e) {
                    e.printStackTrace();
                    eNodeBPlmnId.mccMncNull = true;
                }
            }

        }
        if (eNodeBPlmnId.mccMncNull) {
            System.out
                    .println("The value of these fields are missing from full topology file(mcc,mnc,mncLength )" + "from eNodeBPlmnIdUDR attribute.");
            System.out.println("The values into the object of full topology are:" + eNodeBPlmnId);
            // Setting mnc value -1 in case of exception as 0 is valid value for
            // the mnc.
            if (eNodeBPlmnId.get_mnc() == "0") {
                eNodeBPlmnId.set_mnc("-1");
            }
        }
        return eNodeBPlmnId;

    }

    ///////////////////////////////////////////////////////////////
    //   Related to Cell Realtion
    ////   ///////////////////////////////////

    public Map<String, List<Object[]>> getNbrRefsForAllCellids(final List<Mo> moList, final Map<String, String> mapCellRelation) {// NOPMD
        String lastFDN = null;
        List<Object[]> neibors = null;
        Object[] nbrCellRef = null;
        final HashMap<String, List<Object[]>> cellNBrMap = new HashMap<String, List<Object[]>>();
        // for each cell get all neibors details
        for (final String cellId : mapCellRelation.keySet()) {
            neibors = new ArrayList<Object[]>();// NOPMD
            // find all neibors
            for (final Mo mo : moList) {
                lastFDN = getFDNType(mo);
                nbrCellRef = new Object[7];// NOPMD

                // for each neibor relation get details
                if ("EUtranCellRelation".equals(lastFDN)) {
                    final String fdn = mo.getFdn();
                    if (fdn.contains(mapCellRelation.get(cellId))) {
                        nbrCellRef[3] = fdn;// get nbrRelationFDN

                        for (final Attr childAttr : mo.getAttr()) {
                            if ("neighborCellRef".equals(childAttr.getName())) {
                                nbrCellRef[5] = getValue(childAttr);//get
                                // nbrRef
                                for (final Mo mo1 : moList) {
                                    if (mo1.getFdn().equals(getValue(childAttr))) {// matching cell node found

                                        getNbrCellDetails(moList, nbrCellRef, mo1);
                                        break;
                                    }
                                }
                            }
                        }
                        nbrCellRef[6] = CellRelationType.EUTRAN;
                        neibors.add(nbrCellRef);
                    }
                } else if ("GeranCellRelation".equals(lastFDN)) {
                    final String fdn = mo.getFdn();
                    if (fdn.contains(mapCellRelation.get(cellId))) {
                        nbrCellRef[3] = fdn;// get nbrRelationFDN
                        final List<Attr> AttrList = mo.getAttr();
                        for (final Attr childAttr : AttrList) {
                            if ("extGeranCellRef".equals(childAttr.getName())) {
                                nbrCellRef[5] = getValue(childAttr);//get
                                // nbrRef
                                for (final Mo mo1 : moList) {
                                    if (mo1.getFdn().equals(getValue(childAttr))) {// matching
                                        // cell
                                        // node
                                        // found
                                        getNbrCellDetails(moList, nbrCellRef, mo1);
                                        break;
                                    } // IF
                                } // FOR
                            }
                        }
                        nbrCellRef[6] = CellRelationType.GERAN;
                        neibors.add(nbrCellRef);
                    }
                } else if ("UtranCellRelation".equals(lastFDN)) {
                    final String fdn = mo.getFdn();
                    if (fdn.contains(mapCellRelation.get(cellId))) {
                        nbrCellRef[3] = fdn;// get nbrRelationFDN
                        final List<Attr> AttrList = mo.getAttr();
                        for (final Attr childAttr : AttrList) {
                            if ("externalUtranCellFDDRef".equals(childAttr.getName())) {
                                nbrCellRef[5] = getValue(childAttr);//get
                                // nbrRef
                                for (final Mo mo1 : moList) {
                                    if (mo1.getFdn().equals(getValue(childAttr))) {// matching
                                        // cell
                                        // node
                                        // found
                                        getNbrCellDetails(moList, nbrCellRef, mo1);
                                        break;
                                    } // IF
                                } // FOR
                            }
                        }
                        nbrCellRef[6] = CellRelationType.UTRAN;
                        neibors.add(nbrCellRef);
                    }
                }

            }
            cellNBrMap.put(cellId, neibors);
        }
        return cellNBrMap;
    }

    private void getNbrCellDetails(final List<Mo> moList, final Object[] nbrCellRef, final Mo mo1) {

        final String nbrCellfdn = mo1.getFdn();
        final String nbrlastFDN = getFDNType(mo1);
        if ("EUtranCellFDD".equals(nbrlastFDN)) {
            getCellFDD(moList, nbrCellRef, mo1, nbrCellfdn);
        } else if ("ExternalEUtranCellFDD".equals(nbrlastFDN)) {
            getExtCellFDD(moList, nbrCellRef, mo1, nbrCellfdn);
        } else if ("EUtranCellTDD".equals(nbrlastFDN)) {
            getCellTDD(moList, nbrCellRef, mo1, nbrCellfdn);
        } else if ("ExternalEUtranCellTDD".equals(nbrlastFDN)) {
            getExtCellTDD(moList, nbrCellRef, mo1, nbrCellfdn);
        } else if ("ExternalGeranCell".equals(nbrlastFDN)) {
            getExternalGeranCellDetails(moList, nbrCellRef, mo1, nbrCellfdn);
        } else if ("ExternalUtranCellFDD".equals(nbrlastFDN)) {
            getExternalUtranCellDetails(moList, nbrCellRef, mo1, nbrCellfdn);
        } else if ("ExternalUtranCellTDD".equals(nbrlastFDN)) {
            getExternalUtranCellDetails(moList, nbrCellRef, mo1, nbrCellfdn);
        }

    }

    private void getCellFDD(final List<Mo> moList, final Object[] nbrCellRef, final Mo mo1, final String nbrCellfdn) {
        final int end = nbrCellfdn.indexOf("EUtranCellFDD");
        final String eNBFDN = nbrCellfdn.substring(0, end - 1);
        for (final Mo mo2 : moList) {
            if ((mo2.getFdn()).equals(eNBFDN)) {
                nbrCellRef[2] = eNBFDN; // nbr_eNBFDN
                for (final Attr childAttr2 : mo2.getAttr()) {
                    if ("eNBId".equals(childAttr2.getName())) {
                        nbrCellRef[1] = getValue(childAttr2); // nbr_eNBId
                    }
                    if ("eNodeBPlmnId".equals(childAttr2.getName())) {
                        final PlmnId eNodeBPlmnId = getPlmnId(childAttr2);
                        nbrCellRef[4] = eNodeBPlmnId;// get PlmnIdUDR for NbrEnodeB
                    }

                }
                break;
            }
        }
        // getNbrcellId
        for (final Attr childAttr1 : mo1.getAttr()) {
            if ("cellId".equals(childAttr1.getName())) {
                nbrCellRef[0] = getValue(childAttr1); // get nbrCellid
                break;
            }
        }
    }

    private void getExtCellFDD(final List<Mo> moList, final Object[] nbrCellRef, final Mo mo1, final String nbrCellfdn) {
        final int end = nbrCellfdn.indexOf("ExternalEUtranCellFDD");
        final String eNBFDN = nbrCellfdn.substring(0, end - 1);
        for (final Mo mo2 : moList) {
            if ((mo2.getFdn()).equals(eNBFDN)) {
                nbrCellRef[2] = eNBFDN; // nbr_eNBFDN
                for (final Attr childAttr2 : mo2.getAttr()) {
                    if ("eNBId".equals(childAttr2.getName())) {
                        nbrCellRef[1] = getValue(childAttr2);
                        ; // nbr_eNBId
                          // break;
                    }
                    if ("eNodeBPlmnId".equals(childAttr2.getName())) {
                        final PlmnId eNodeBPlmnIdUDR = getPlmnId(childAttr2);
                        nbrCellRef[4] = eNodeBPlmnIdUDR;// get PlmnIdUDR for
                        // NbrEnodeB
                    }
                }
                break;
            }
        }
        // getNbrcellId
        for (final Attr childAttr1 : mo1.getAttr()) {
            if ("localCellId".equals(childAttr1.getName())) {
                nbrCellRef[0] = getValue(childAttr1); // get nbrCellid
                break;
            }
        }
    }

    /**
     * @param moList
     * @param nbrCellRef
     * @param mo1
     * @param nbrCellfdn
     */
    private void getCellTDD(final List<Mo> moList, final Object[] nbrCellRef, final Mo mo1, final String nbrCellfdn) {
        final List<Attr> AttrList1;
        final int end = nbrCellfdn.indexOf("EUtranCellTDD");
        final String eNBFDN = nbrCellfdn.substring(0, end - 1);
        for (final Mo mo2 : moList) {
            if ((mo2.getFdn()).equals(eNBFDN)) {
                nbrCellRef[2] = eNBFDN; // nbr_eNBFDN
                final List<Attr> AttrList2 = mo2.getAttr();
                for (final Attr childAttr2 : AttrList2) {
                    if ("eNBId".equals(childAttr2.getName())) {
                        nbrCellRef[1] = getValue(childAttr2);
                        ; // nbr_eNBId
                          // break;
                    }
                    if ("eNodeBPlmnId".equals(childAttr2.getName())) {
                        final PlmnId eNodeBPlmnId = getPlmnId(childAttr2);
                        nbrCellRef[4] = eNodeBPlmnId;// get PlmnIdUDR for
                        // NbrEnodeB
                    }

                }
                break;
            }
        }
        AttrList1 = mo1.getAttr(); // getNbrcellId
        for (final Attr childAttr1 : AttrList1) {
            if ("cellId".equals(childAttr1.getName())) {
                nbrCellRef[0] = getValue(childAttr1); // get nbrCellid
                break;
            }
        }
    }

    private void getExtCellTDD(final List<Mo> moList, final Object[] nbrCellRef, final Mo mo1, final String nbrCellfdn) {
        final List<Attr> AttrList1;
        final int end = nbrCellfdn.indexOf("ExternalEUtranCellTDD");
        final String eNBFDN = nbrCellfdn.substring(0, end - 1);
        for (final Mo mo2 : moList) {
            if ((mo2.getFdn()).equals(eNBFDN)) {
                nbrCellRef[2] = eNBFDN; // nbr_eNBFDN
                final List<Attr> AttrList2 = mo2.getAttr();
                for (final Attr childAttr2 : AttrList2) {
                    if ("eNBId".equals(childAttr2.getName())) {
                        nbrCellRef[1] = getValue(childAttr2);
                        ; // nbr_eNBId
                          // break;
                    }
                    if ("eNodeBPlmnId".equals(childAttr2.getName())) {
                        final PlmnId eNodeBPlmnIdUDR = getPlmnId(childAttr2);
                        nbrCellRef[4] = eNodeBPlmnIdUDR;// get PlmnIdUDR for
                        // NbrEnodeB
                    }
                }
                break;
            }
        }
        AttrList1 = mo1.getAttr(); // getNbrcellId
        for (final Attr childAttr1 : AttrList1) {
            if ("localCellId".equals(childAttr1.getName())) {
                nbrCellRef[0] = getValue(childAttr1); // get nbrCellid
                break;
            }
        }
    }

    private void getExternalGeranCellDetails(final List<Mo> moList, final Object[] nbrCellRef, final Mo mo1, final String nbrCellfdn) {
        List<Attr> AttrList1;
        AttrList1 = mo1.getAttr(); // getNbrcellId
        nbrCellRef[2] = mo1.getFdn();
        for (final Attr childAttr1 : AttrList1) {
            if ("lac".equals(childAttr1.getName())) {
                nbrCellRef[1] = getValue(childAttr1); // nbr_eNBId
            }
            if ("plmnIdentity".equals(childAttr1.getName())) {
                final PlmnId eNodeBPlmnIdUDR = getPlmnId(childAttr1);
                nbrCellRef[4] = eNodeBPlmnIdUDR;// get PlmnIdUDR for NbrEnodeB

            }
            if ("cellIdentity".equals(childAttr1.getName())) {
                nbrCellRef[0] = getValue(childAttr1); // get nbrCellid

            }
        }
    }

    private void getExternalUtranCellDetails(final List<Mo> moList, final Object[] nbrCellRef, final Mo mo1, final String nbrCellfdn) {
        List<Attr> AttrList1;
        AttrList1 = mo1.getAttr(); // getNbrcellId
        nbrCellRef[2] = mo1.getFdn();
        for (final Attr childAttr1 : AttrList1) {
            if ("plmnIdentity".equals(childAttr1.getName())) {
                final PlmnId eNodeBPlmnId = getPlmnId(childAttr1);
                nbrCellRef[4] = eNodeBPlmnId;// get PlmnIdUDR for NbrEnodeB
            }
            Struct struct = null;
            if ("cellIdentity".equals(childAttr1.getName())) {
                for (final Object obj : childAttr1.getContent()) {
                    if (obj instanceof Struct) {
                        struct = (Struct) obj;
                    }
                }
                if (struct != null) {
                    final List<Attr> listAttrs = struct.getAttr();
                    for (final Attr attr : listAttrs) {
                        if ("rncId".equalsIgnoreCase(attr.getName())) {
                            nbrCellRef[1] = getValue(attr);
                        } else if ("cId".equalsIgnoreCase(attr.getName())) {
                            nbrCellRef[0] = getValue(attr); // get nbrCellid
                        }
                    }
                }
            }
        }
    }

    private String setAttrCellId(String cellId, final Attr childAttr) {// NOPMD

        if (CELLID.equals(childAttr.getName())) {
            cellId = getValue(childAttr);
        }
        return cellId;
    }

    @Override
    public void parserService(final String inputLocation, final String outputLocation,final String parserType,final String parserOption) throws IOException {
        final Collection<File> fileList = org.apache.commons.io.FileUtils.listFiles(new File(inputLocation), new String[] { "xml" }, true);
        System.out.println(String.format("Total LTE Topology xml file in %s need to parse : %d", inputLocation, fileList.size()));
        System.out.println(String.format("Starting topology parsing ..."));
        for (final File file : fileList) {
            final Path path = Paths.get(file.getAbsolutePath());
            try {
                final byte[] data = Files.readAllBytes(path);
                final EnodeBOutput eNBout = new EnodeBOutput();
                eNBout.setOutputLocation(outputLocation);
                parseStream(data, eNBout, inputLocation);
            } catch (final CorruptedException e) {
                System.out.println(String.format("Topology file %s is corrupted.", path.getFileName()));
                e.printStackTrace();
            } catch (final Exception e) {
                e.printStackTrace();
            }

        }
        generateTableSchema(outputLocation);
        System.out.println(String.format("Finished parsing !!! "));

    }

    /**
     * @throws IOException
     */
    private void generateTableSchema(final String outputLocation) throws IOException {

        FileUtils.writeToFile(outputLocation);
    }

    @Override
    public String getParserType() {
        return "topology";
    }

	@Override
	public void ossParserService(String inputLocation, String ossSourceLocation, String outputlocation,
			String parserType, String parserOption, String ossParser)
			throws IOException, XmlException, InvalidFormatException {
		// TODO Auto-generated method stub
		
	}
}