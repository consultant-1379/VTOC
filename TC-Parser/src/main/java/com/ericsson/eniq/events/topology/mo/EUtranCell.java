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

public class EUtranCell {

    private String _fdn;
    private String _eNBId; // string stringField (optional)
    private String _nodeFdn;
    private String _cellID;
    private String _moid;

    public String get_fdn() {
        return _fdn;
    }

    public void set_fdn(final String _fdn) {
        this._fdn = _fdn;
    }

    public String get_eNBId() {
        return _eNBId;
    }

    public void set_eNBId(final String _eNBId) {
        this._eNBId = _eNBId;
    }

    public String get_nodeFdn() {
        return _nodeFdn;
    }

    public void set_nodeFdn(final String _nodeFdn) {
        this._nodeFdn = _nodeFdn;
    }

    public String get_cellID() {
        return _cellID;
    }

    public void set_cellID(final String _cellID) {
        this._cellID = _cellID;
    }

    public String get_moid() {
        return _moid;
    }

    public void set_moid(final String _moid) {
        this._moid = _moid;
    }

    @Override
    public String toString() {
        return String.format("EUCell [_fdn=%s, _eNBId=%s, _nodeFdn=%s, _cellID=%s, _moid=%s]", _fdn, _eNBId, _nodeFdn, _cellID, _moid);
    }

}
