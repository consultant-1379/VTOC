package com.ericsson.eniq.events.parser.factory;

import org.apache.commons.cli.ParseException;

public enum ParserType {

    COUNTER("counter"), TOPOLOGY("topology"), EXCEL("excel"), CPP("cpp"), ECIM_SCHEMA("ecim"), ECIM_COUNTER_DATA("ecimcounter"), CPP_COUNTER_DATA(
            "cppcounter");

    private String value;

    private ParserType(final String value) {
        this.value = value;
    }

    public String parserType() {
        return value;
    }

    public static ParserType getParserTypeValue(final String parseOption) throws ParseException {

        for (final ParserType parser : ParserType.values()) {
            if (parser.value.equalsIgnoreCase(parseOption)) {
                return parser;
            }
        }
        throw new ParseException("Parser type must be counter or topology or excel");
    }
}
