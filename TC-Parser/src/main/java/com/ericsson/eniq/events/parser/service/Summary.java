/*------------------------------------------------------------------------------
 *******************************************************************************
 * COPYRIGHT Ericsson 2013
 *
 * The copyright to the computer program(s) herein is the property of
 * Ericsson Inc. The programs may be used and/or copied only with written
 * permission from Ericsson Inc. or in accordance with the terms and
 * conditions stipulated in the agreement/contract under which the
 * program(s) have been supplied.
 *******************************************************************************
 *----------------------------------------------------------------------------*/
package com.ericsson.eniq.events.parser.service;

import java.util.*;

public class Summary {
    String fdn = null;
    String swVersion = null;
    String userLabel = null;
    String ropTime = null;
    String date = null;
    int dayId;
    int hourId;
    int minId;

    Map<String, List<Counter>> moidCountersMap;

    /**
     * @return the fdn
     */
    public String getFdn() {
        return fdn;
    }

    /**
     * @param fdn
     *            the fdn to set
     */
    public void setFdn(final String fdn) {
        this.fdn = fdn;
    }

    /**
     * @return the swVersion
     */
    public String getSwVersion() {
        return swVersion;
    }

    /**
     * @param swVersion
     *            the swVersion to set
     */
    public void setSwVersion(final String swVersion) {
        this.swVersion = swVersion;
    }

    /**
     * @return the userLabel
     */
    public String getUserLabel() {
        return userLabel;
    }

    /**
     * @param userLabel
     *            the userLabel to set
     */
    public void setUserLabel(final String userLabel) {
        this.userLabel = userLabel;
    }

    /**
     * @return the ropTime
     */
    public String getRopTime() {
        return ropTime;
    }

    /**
     * @param ropTime
     *            the ropTime to set
     */
    public void setRopTime(final String ropTime) {
        this.ropTime = ropTime;
    }

    /**
     * @return the dayId
     */
    public int getDayId() {
        return dayId;
    }

    /**
     * @param dayId
     *            the dayId to set
     */
    public void setDayId(final int dayId) {
        this.dayId = dayId;
    }

    /**
     * @return the hourId
     */
    public int getHourId() {
        return hourId;
    }

    /**
     * @param hourId
     *            the hourId to set
     */
    public void setHourId(final int hourId) {
        this.hourId = hourId;
    }

    /**
     * @return the minId
     */
    public int getMinId() {
        return minId;
    }

    /**
     * @param minId
     *            the minId to set
     */
    public void setMinId(final int minId) {
        this.minId = minId;
    }

    /**
     * @return the moidCountersMap
     */

    public Map<String, List<Counter>> getMoidCountersMap() {
        return moidCountersMap;
    }

    /**
     * @return the date
     */
    public String getDate() {
        return date;
    }

    /**
     * @param date
     *            the date to set
     */
    public void setDate(final String date) {
        this.date = date;
    }

    /**
     * @param summaryMap
     *            the moidCountersMap to set
     */
    public void initializeMoidCountersMap() {
        if (moidCountersMap == null) {
            moidCountersMap = new HashMap<String, List<Counter>>();
        }
    }

    @Override
    public String toString() {
        return String.format("Summary [fdn=%s, swVersion=%s, userLabel=%s, ropTime=%s, moidCountersMap=%s]", fdn, swVersion, userLabel, ropTime,
                moidCountersMap);
    }
}
