package com.ericsson.eniq.events.parser.service;

/**
 * 
 * CorruptedException to handle file corruption
 * 
 */
public class CorruptedException extends Exception {

    /**
     * @param cause
     */
    public CorruptedException(final Throwable cause) {
        super(cause);
    }

}
