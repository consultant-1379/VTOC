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

public class ExtENodeBFunction {

    /**
     * EXTERNAL fdn
     */
    private String _fdn;

    public String get_fdn() {
        return _fdn;
    }

    public void set_fdn(final String _fdn) {
        this._fdn = _fdn;
    }

    /**
     * EXTERNAL EnbId
     */
    private String _externalENBId;

    private PlmnId _eNodeBPlmnId;

    public PlmnId get_eNodeBPlmnId() {
        return _eNodeBPlmnId;
    }

    public void set_eNodeBPlmnId(final PlmnId _eNodeBPlmnId) {
        this._eNodeBPlmnId = _eNodeBPlmnId;
    }

    public String get_externalENBId() {
        return _externalENBId;
    }

    public void set_externalENBId(final String _externalENBId) {
        this._externalENBId = _externalENBId;
    }

    @Override
    public String toString() {
        return String.format("ExtENodeBFunction [_fdn=%s, _externalENBId=%s, _eNodeBPlmnId=%s]", _fdn, _externalENBId, _eNodeBPlmnId);
    }

}
