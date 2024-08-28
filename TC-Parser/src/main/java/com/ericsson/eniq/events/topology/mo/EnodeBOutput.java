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
package com.ericsson.eniq.events.topology.mo;

import java.util.List;

import com.ericsson.eniq.events.parser.service.NBRelationOutput;
import com.ericsson.eniq.events.topology.utils.FileUtils;

public class EnodeBOutput implements NBRelationOutput {

    private long _fullTimeStamp;
    private String outputLocation = "";

    public String getOutputLocation() {
        return outputLocation;
    }

    public void setOutputLocation(final String outputLocation) {
        this.outputLocation = outputLocation;
    }

    public long get_fullTimeStamp() {
        return _fullTimeStamp;
    }

    public void set_fullTimeStamp(final long _fullTimeStamp) {
        this._fullTimeStamp = _fullTimeStamp;
    }

    EnodeB eNodeB;
    EnodeBFunction eNBFunction;
    List<EUtranCell> listEUCell;
    List<CellRelations> listCellRelation;
    List<TermPointToEnodeB> listTermPointToEnodeB;
    List<TermPointToMme> listTermPointToMme;
    List<ProcessorLoad> listProcessorLoad;

    public EnodeB geteNodeB() {
        return eNodeB;
    }

    public void seteNodeB(final EnodeB eNodeB) {
        this.eNodeB = eNodeB;
    }

    public EnodeBFunction geteNBFunction() {
        return eNBFunction;
    }

    public void seteNBFunction(final EnodeBFunction eNBFunction) {
        this.eNBFunction = eNBFunction;
    }

    public List<EUtranCell> getListEUCell() {
        return listEUCell;
    }

    public void setListEUCell(final List<EUtranCell> listEUCell) {
        this.listEUCell = listEUCell;
    }

    public List<CellRelations> getListCellRelation() {
        return listCellRelation;
    }

    public void setListCellRelation(final List<CellRelations> listCellRelation) {
        this.listCellRelation = listCellRelation;
    }

    public List<TermPointToEnodeB> getListTermPointToEnodeB() {
        return listTermPointToEnodeB;
    }

    public void setListTermPointToEnodeB(final List<TermPointToEnodeB> listTermPointToEnodeB) {
        this.listTermPointToEnodeB = listTermPointToEnodeB;
    }

    public List<TermPointToMme> getListTermPointToMme() {
        return listTermPointToMme;
    }

    public void setListTermPointToMme(final List<TermPointToMme> listTermPointToMme) {
        this.listTermPointToMme = listTermPointToMme;
    }

    public List<ProcessorLoad> getListProcessorLoad() {
        return listProcessorLoad;
    }

    public void setListProcessorLoad(final List<ProcessorLoad> listProcessorLoad) {
        this.listProcessorLoad = listProcessorLoad;
    }

    @Override
    public void sendENodeB(final EnodeB eNodeB, final EnodeBFunction eNBFunction, final List<EUtranCell> listEUCell,
                           final List<CellRelations> listCellRelation, final List<TermPointToEnodeB> listTermPointToEnodeB,
                           final List<TermPointToMme> listTermPointToMme, final List<ProcessorLoad> listProcessorLoad) throws Exception {

        seteNodeB(eNodeB);
        seteNBFunction(eNBFunction);
        setListEUCell(listEUCell);
        setListCellRelation(listCellRelation);
        setListTermPointToEnodeB(listTermPointToEnodeB);
        setListTermPointToMme(listTermPointToMme);
        setListProcessorLoad(listProcessorLoad);
        FileUtils.writeToFile(outputLocation, this);

    }

    @Override
    public String toString() {
        return String
                .format("EnodeBOutput [_fullTimeStamp=%s, outputLocation=%s, eNodeB=%s, eNBFunction=%s, listEUCell=%s, listCellRelation=%s, listTermPointToEnodeB=%s, listTermPointToMme=%s, listProcessorLoad=%s]",
                        _fullTimeStamp, outputLocation, eNodeB, eNBFunction, listEUCell, listCellRelation, listTermPointToEnodeB, listTermPointToMme,
                        listProcessorLoad);
    }

}
