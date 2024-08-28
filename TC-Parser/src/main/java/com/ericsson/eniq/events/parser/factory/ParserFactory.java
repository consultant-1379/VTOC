/**
 *
 */
package com.ericsson.eniq.events.parser.factory;

import com.ericsson.eniq.events.parser.service.*;

/**
 * @author Sanjay
 * 
 */
public class ParserFactory {

    @SuppressWarnings("rawtypes")
    public static IParser parserBuilder(final ParserType parserType) {

        IParser parser = null;
        switch (parserType) {
            case COUNTER:
                parser = new CounterParser();
                break;
            case TOPOLOGY:
                parser = new FullTopoParser();
                break;
            case EXCEL:
                parser = new ExcelParser();
                break;
            case CPP:
                parser = new CppParser();
                break;
            case ECIM_SCHEMA:
            	parser = new EcimParser();
                break;
            case ECIM_COUNTER_DATA:
                parser = new EcimCounterParser();
                break;
            case CPP_COUNTER_DATA:
                parser = new CppCounterParser();
                break;
            default:
                System.err.println("Invalid argument for summary");

        }
        return parser;

    }

}
