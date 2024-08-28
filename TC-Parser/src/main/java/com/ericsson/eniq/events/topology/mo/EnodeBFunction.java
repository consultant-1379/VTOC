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

public class EnodeBFunction {

    private String _fdn; //complete fdn
    private String _nodeName; // derived from fdn, LDN upto MeContext(G1) and ManagedElement(G2)  
    private String _moid; // derived from fdn, LDN after ManagedElement
    private String _eNBId;
    private PlmnId _eNodeBPlmnId;

    public String get_fdn() {
        return _fdn;
    }

    public void set_fdn(final String _fdn) {
        this._fdn = _fdn;
    }

    public String get_nodeName() {
        return _nodeName;
    }

    public void set_nodeName(final String _nodeName) {
        this._nodeName = _nodeName;
    }

    public String get_moid() {
        return _moid;
    }

    public void set_moid(final String _moid) {
        this._moid = _moid;
    }

    public String get_eNBId() {
        return _eNBId;
    }

    public void set_eNBId(final String _eNBId) {
        this._eNBId = _eNBId;
    }

    public PlmnId get_eNodeBPlmnId() {
        return _eNodeBPlmnId;
    }

    public void set_eNodeBPlmnId(final PlmnId _eNodeBPlmnId) {
        this._eNodeBPlmnId = _eNodeBPlmnId;
    }

    @Override
    public String toString() {
        return String.format("EnodeBFunction [_fdn=%s, _nodeName=%s, _moid=%s, _eNBId=%s, _eNodeBPlmnId=%s]", _fdn, _nodeName, _moid, _eNBId,
                _eNodeBPlmnId.toString());
    }

}
