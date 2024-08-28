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

public class TermPointToEnodeB {

    private String _fdn;
    private String _nodeFdn;
    private String _moid;
    private String _externalENodeBFdn;
    private ExtENodeBFunction _extENodeBFn;

    public String get_fdn() {
        return _fdn;
    }

    public void set_fdn(final String _fdn) {
        this._fdn = _fdn;
    }

    public String get_nodeFdn() {
        return _nodeFdn;
    }

    public void set_nodeFdn(final String _nodeFdn) {
        this._nodeFdn = _nodeFdn;
    }

    public String get_moid() {
        return _moid;
    }

    public void set_moid(final String _moid) {
        this._moid = _moid;
    }

    public ExtENodeBFunction get_extENodeBFn() {
        return _extENodeBFn;
    }

    public void set_extENodeBFn(final ExtENodeBFunction extENodeBFn) {
        this._extENodeBFn = extENodeBFn;
    }

    public String get_externalENodeBFdn() {
        return _externalENodeBFdn;
    }

    public void set_externalENodeBFdn(final String _externalENodeBFdn) {
        this._externalENodeBFdn = _externalENodeBFdn;
    }

    @Override
    public String toString() {
        return String.format("TermPointToEnodeB [_fdn=%s, _nodeFdn=%s, _moid=%s, _externalENodeBFdn=%s, _extENodeBFn=%s]", _fdn, _nodeFdn, _moid,
                _externalENodeBFdn, _extENodeBFn);
    }

}
