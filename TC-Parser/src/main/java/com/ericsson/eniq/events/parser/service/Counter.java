package com.ericsson.eniq.events.parser.service;

public class Counter {

    String counterName = null;
    //long counterValue = 0L;
    String counterValue = null;
    int counterIndex = 0;
    long lteesCounterValue;

    /**
     * @return the counterName
     */
    public String getCounterName() {
        return counterName;
    }

    /**
     * @param counterName
     *            the counterName to set
     */
    public void setCounterName(final String counterName) {
        this.counterName = counterName;
    }

    /**
     * @return the counterValue
     */
    //public long getCounterValue() {
    public String getCounterValue() {
        return counterValue;
    }

    /**
     * @param counterValue
     *            the counterValue to set
     */
    //public void setCounterValue(final long counterValue) {
    public void setCounterValue(final String counterValue) {

        this.counterValue = counterValue;
    }

    /**
     * @return the counterIndex
     */
    public int getCounterIndex() {
        return counterIndex;
    }

    /**
     * @param counterIndex
     *            the counterIndex to set
     */
    public void setCounterIndex(final int counterIndex) {
        this.counterIndex = counterIndex;
    }

    /**
     * @return the lteesCounterValue
     */
    public long getlteesCounterValue() {
        return lteesCounterValue;
    }

    /**
     * @param lteesCounterValue
     *            the lteesCounterValue to set
     */
    public void setlteesCounterValue(final long lteesCounterValue) {
        this.lteesCounterValue = lteesCounterValue;
    }

    public void updateCounterValue(final String counterValue) {
        this.counterValue = counterValue;// + counterValue;
    }

    public void updateCounterValue(final Long counterValue) {

        // this.counterValue = (Long.parseLong(this.counterValue) + counterValue) + "";
        this.counterValue = (Long.parseLong(this.counterValue) + counterValue) + "";
    }

    public void updatelteesCounterValue(final Long lteesCounterValue) {

        // this.counterValue = (Long.parseLong(this.counterValue) + counterValue) + "";
        this.lteesCounterValue = this.lteesCounterValue + lteesCounterValue;
    }

}
