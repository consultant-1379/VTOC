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

public class EnodeB {

    private String _fdn;
    private String _userLabel;
    private String _swVersion;

    public String get_fdn() {
        return _fdn;
    }

    public void set_fdn(final String _fdn) {
        this._fdn = _fdn;
    }

    public String get_userLabel() {
        return _userLabel;
    }

    public void set_userLabel(final String _userLabel) {
        this._userLabel = _userLabel;
    }

    public String get_swVersion() {
        return _swVersion;
    }

    public void set_swVersion(final String _swVersion) {
        this._swVersion = _swVersion;
    }

    @Override
    public String toString() {
        return "EnodeB [_fdn=" + _fdn + ", _userLabel=" + _userLabel + ", _swVersion=" + _swVersion + "]";
    }
}
