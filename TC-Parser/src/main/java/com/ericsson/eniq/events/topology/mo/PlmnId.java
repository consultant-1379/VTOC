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

public class PlmnId {

    public boolean mccMncNull = false;

    private long _mcc;

    private String _mnc;

    private long _mncLength;

    public long get_mcc() {
        return _mcc;
    }

    public void set_mcc(final long _mcc) {
        this._mcc = _mcc;
    }

    public String get_mnc() {
        return _mnc;
    }

    public void set_mnc(final String _mnc) {
        this._mnc = _mnc;
    }

    public long get_mncLength() {
        return _mncLength;
    }

    public void set_mncLength(final long _mncLegth) {
        this._mncLength = _mncLegth;
    }

    @Override
    public String toString() {
        return "PlmnId [mccMncNull=" + mccMncNull + ", _mcc=" + _mcc + ", _mnc=" + _mnc + ", _mncLength=" + _mncLength + "]";
    }

}
