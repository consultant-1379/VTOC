package com.ericsson.eniq.events.parser.launcher;

import java.io.IOException;

import org.apache.commons.cli.*;
import org.apache.xmlbeans.XmlException;

import com.ericsson.eniq.events.parser.factory.ParserFactory;
import com.ericsson.eniq.events.parser.factory.ParserType;
import com.ericsson.eniq.events.parser.service.IParser;
import com.ericsson.eniq.events.topology.utils.FileUtils;
import com.ericsson.eniq.events.utils.logging.ParserLogger;

public class ParserLauncher {

    private static final Options options;

    static {
        options = new Options();

        final Option sourceLocation = new Option("s", "source", true, "<Input Location> Input file source location.");
        sourceLocation.setRequired(true);

        final Option outputLocation = new Option("o", "output", true, "<Output Location> SQL output query file location.");
        outputLocation.setRequired(false);

        final Option ossSourceLocation = new Option("i", "osssource", true, "<Input of Netsim ECIM Mim Location> Input of Netsim Mim Location.");
        sourceLocation.setRequired(false);

        final Option pType = new Option("p", "parser", true, "Parser type used counter, topology, excel, ecim, cpp .");
        pType.setRequired(true);

        final Option pOpt = new Option("t", "type", true, "Counter file pasrsing using MIM.");
        pOpt.setRequired(false);

        final Option pOSS = new Option("n", "oss", true, "Parsing for One-PM solution");
        pOpt.setRequired(false);

        options.addOption(sourceLocation);
        options.addOption(ossSourceLocation);
        options.addOption(outputLocation);
        options.addOption(pType);
        options.addOption(pOpt);
        options.addOption(pOSS);

    }

    public static void main(final String... cmdArgs) throws Exception, XmlException {
        final CommandLineParser cmdparser = new GnuParser();
        CommandLine line = null;
        try {
            line = cmdparser.parse(options, cmdArgs);
            final String inputLocation = line.getOptionValue("source");
            String ossSourceLocation=null;
            if (line.hasOption("osssource")) {
            	ossSourceLocation = line.getOptionValue("osssource");
              }
            String outlocation;
            if (line.hasOption("output")) {
                outlocation = line.getOptionValue("output");
                FileUtils.cleanFolder(outlocation);
            } else {
                outlocation = FileUtils.getBasePath();
            }
            final String parserType = line.getOptionValue("parser");
            final IParser IParser = ParserFactory.parserBuilder(ParserType.getParserTypeValue(parserType));
            String parserOption=null;
            if (line.hasOption("type")) {
            parserOption = line.getOptionValue("type");
            }
            String ossParser=null;
            if (line.hasOption("oss")) {
            	ossParser = line.getOptionValue("oss");
              }
            try {
            	if(ossParser!=null)
            	{
            		IParser.ossParserService(inputLocation,ossSourceLocation,outlocation,parserType,parserOption,ossParser);
            	}
            	else
            	{
            		IParser.parserService(inputLocation, outlocation,parserType,parserOption);
            	}
            }
            	catch (final IOException e) {
                e.printStackTrace();
                ParserLogger.exception(ClassLoader.class.getName(), "main", "Exception in Parser Service", e);
            }
        } catch (final ParseException pex) {
            System.err.println(pex.getMessage());
            final HelpFormatter formatter = new HelpFormatter();
            formatter.printHelp("java -jar CounterParser-v1.0.jar  [options] ", options);
            System.exit(1);
        }
    }

}
