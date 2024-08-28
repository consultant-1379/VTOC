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

public class ProcessorLoad {

    private String _fdn;
    private String _nodeFdn;
    private String _moid;
    private String _processorLoadId;
    private String _slotId;

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

    public String get_processorLoadId() {
        return _processorLoadId;
    }

    public void set_processorLoadId(final String _processorLoadId) {
        this._processorLoadId = _processorLoadId;
    }

    public String get_SlotId() {
        return _slotId;
    }

    public void set_SlotId(final String managedFdn) {
        final String[] splittedFdn = managedFdn.split(",");
        for (final String partFdn : splittedFdn) {
            if (partFdn.startsWith("Slot=")) {
                final String[] splittedSlot = partFdn.split("=");
                if (splittedSlot.length > 0) {
                    _slotId = splittedSlot[1];
                    break;
                }
            }
        }
    }

    @Override
    public String toString() {
        return String.format("ProcessorLoad [_fdn=%s, _nodeFdn=%s, _moid=%s, _processorLoadId=%s, _slotId=%s]", _fdn, _nodeFdn, _moid,
                _processorLoadId, _slotId);
    }

}
