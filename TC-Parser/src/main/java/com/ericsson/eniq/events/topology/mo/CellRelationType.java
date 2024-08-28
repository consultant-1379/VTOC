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

public enum CellRelationType {
    /*
     * LTE_INTRA_FREQ(0), //EUTRAN(4G) LTE_INTER_FREQ(1), //(EUTRAN) WCDMA(2), //_UTRAN GERAN(3), //2G TDSCDMA(5); //UTRAN(3G)
     */
    EUTRAN("EUtranCellRelation"), UTRAN("UtranCellRelation"), GERAN("GeranCellRelation");

    private final String relationName;

    private CellRelationType(final String s) {
        relationName = s;
    }

    public String getRelationName() {
        return relationName;
    }

    public boolean equalsName(final String otherName) {
        return (otherName == null) ? false : relationName.equals(otherName);
    }

    @Override
    public String toString() {
        return this.relationName;
    }

}
