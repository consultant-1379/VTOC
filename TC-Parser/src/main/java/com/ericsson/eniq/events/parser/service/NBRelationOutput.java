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

import java.util.List;

import com.ericsson.eniq.events.topology.mo.*;

public interface NBRelationOutput {
    public void sendENodeB(final EnodeB eNodeB, final EnodeBFunction eNBFunction, final List<EUtranCell> listEUCell,
                           final List<CellRelations> listCellRelation, final List<TermPointToEnodeB> listTermPointToEnodeB,
                           final List<TermPointToMme> listTermPointToMme, final List<ProcessorLoad> listProcessorLoad) throws Exception;
}
