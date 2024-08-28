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

public class NbrCell {

    private String _fdn;
    private String _moid;
    private String _nbrCellID;

    private String _nbrREF;
    private String _nbrENodeBID;

    private String _nbrENodeBFDN;
    private PlmnId _nbrEnodeBPlmnId;
    private String _mcc;
    private String _mnc;
    private CellRelationType cellRelationType;

    public String get_fdn() {
        return _fdn;
    }

    public void set_fdn(final String _fdn) {
        this._fdn = _fdn;
    }

    public String get_moid() {
        return _moid;
    }

    public void set_moid(final String _moid) {
        this._moid = _moid;
    }

    public String get_nbrCellID() {
        return _nbrCellID;
    }

    public void set_nbrCellID(final String _nbrCellID) {
        this._nbrCellID = _nbrCellID;
    }

    public String get_nbrENodeBID() {
        return _nbrENodeBID;
    }

    public void set_nbrENodeBID(final String value) {
        _nbrENodeBID = value;
    }

    public String get_nbrENodeBFDN() {
        return _nbrENodeBFDN;
    }

    public void set_nbrENodeBFDN(final String value) {
        _nbrENodeBFDN = value;
    }

    public String get_nbrCellREF() {
        return _nbrREF;
    }

    public void set_nbrCellREF(final String value) {
        _nbrREF = value;
    }

    public PlmnId get_nbrEnodeBPlmnId() {
        return _nbrEnodeBPlmnId;
    }

    public void set_nbrEnodeBPlmnId(final PlmnId _eNodeBPlmnId) {
        this._nbrEnodeBPlmnId = _eNodeBPlmnId;
    }

    public String get_nbrMccId() {
        return _mcc;
    }

    public void set_nbrMccId(final String _mcc) {
        this._mcc = _mcc;
    }

    public String get_nbrMncId() {
        return _mnc;
    }

    public void set_nbrMncId(final String _mnc) {
        this._mnc = _mnc;
    }

    /**
     * @return the cellRelationType
     */
    public CellRelationType getCellRelationType() {
        return cellRelationType;
    }

    /**
     * @param cellRelationType
     *            the cellRelationType to set
     */
    public void setCellRelationType(final CellRelationType cellRelationType) {
        this.cellRelationType = cellRelationType;
    }

    @Override
    public String toString() {
        return String
                .format("NbrCell [_fdn=%s, _moid=%s, _nbrCellID=%s, _nbrREF=%s, _nbrENodeBID=%s, _nbrENodeBFDN=%s, _nbrEnodeBPlmnId=%s, _mcc=%s, _mnc=%s, cellRelationType=%s]",
                        _fdn, _moid, _nbrCellID, _nbrREF, _nbrENodeBID, _nbrENodeBFDN, _nbrEnodeBPlmnId, _mcc, _mnc, cellRelationType);
    }

}
