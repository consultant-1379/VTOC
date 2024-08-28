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

public class CellRelations {

    private String _nodeFdn;
    private String _cellId;

    private List<NbrCell> _listNbrCellDetails;

    public String get_cellId() {
        return _cellId;
    }

    public void set_cellId(final String _cellId) {
        this._cellId = _cellId;
    }

    public String get_nodeFdn() {
        return _nodeFdn;
    }

    public void set_nodeFdn(final String _nodeFdn) {
        this._nodeFdn = _nodeFdn;
    }

    public List<NbrCell> get_listNbrCellDetails() {
        return _listNbrCellDetails;
    }

    public void set_listNbrCellDetails(final List<NbrCell> _listNbrCellDetails) {
        this._listNbrCellDetails = _listNbrCellDetails;
    }

    @Override
    public String toString() {
        return String.format("CellRelations [_nodeFdn=%s, _cellId=%s, _listNbrCellDetails=%s]", _nodeFdn, _cellId, _listNbrCellDetails);
    }

}
