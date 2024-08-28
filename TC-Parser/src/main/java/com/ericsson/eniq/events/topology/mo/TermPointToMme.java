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

public class TermPointToMme {

    private String _fdn;
    private String _nodeFdn;
    private String _moid;

    private List<Integer> _mmeGIListLTERelated;
    private List<Integer> _mmeCodeListLTERelated;
    private List<PlmnId> _servedPlmnList;

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

    public List<Integer> get_mmeGIListLTERelated() {
        return _mmeGIListLTERelated;
    }

    public void set_mmeGIListLTERelated(final List<Integer> _mmeGIListLTERelated) {
        this._mmeGIListLTERelated = _mmeGIListLTERelated;
    }

    public List<Integer> get_mmeCodeListLTERelated() {
        return _mmeCodeListLTERelated;
    }

    public void set_mmeCodeListLTERelated(final List<Integer> _mmeCodeListLTERelated) {
        this._mmeCodeListLTERelated = _mmeCodeListLTERelated;
    }

    public List<PlmnId> get_servedPlmnList() {
        return _servedPlmnList;
    }

    public void set_servedPlmnList(final List<PlmnId> _servedPlmnList) {
        this._servedPlmnList = _servedPlmnList;
    }

    @Override
    public String toString() {
        return String.format(
                "TermPointToMme [_fdn=%s, _nodeFdn=%s, _moid=%s, _mmeGIListLTERelated=%s, _mmeCodeListLTERelated=%s, _servedPlmnList=%s]", _fdn,
                _nodeFdn, _moid, _mmeGIListLTERelated, _mmeCodeListLTERelated, _servedPlmnList);
    }

}
