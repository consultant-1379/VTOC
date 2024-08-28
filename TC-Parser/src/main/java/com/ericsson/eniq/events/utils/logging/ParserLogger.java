/**
 *
 */
package com.ericsson.eniq.events.utils.logging;

import java.io.File;
import java.io.PrintWriter;
import java.io.StringWriter;
import java.util.logging.ConsoleHandler;
import java.util.logging.Handler;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 * @author xsantiw
 *
 */
public class ParserLogger extends LoadLoggerProperties {

    private static final String NEWLINE = "\n\t";

    private static final String SEMICOLON = "; ";

    public static final String TOOL_LOGGER_NAME = "TC-Parser";

    private static boolean redirectToStdout = false;

    private static final Logger TOOL_LOGGER = Logger.getLogger(TOOL_LOGGER_NAME);

    static {

        initializePropertiesAndLoggers();
    }

    public static void initializePropertiesAndLoggers() {
        resetHandlers();
        TOOL_LOGGER.setUseParentHandlers(false);
        redirectToStdout = Boolean.valueOf(STDOUT_REDIRECT);
        if (redirectToStdout) {
            final Handler consoleHandler = new ConsoleHandler();
            consoleHandler.setLevel(Level.FINEST);
            TOOL_LOGGER.addHandler(consoleHandler);
        }
    }

    static void resetHandlers() {
        for (final Handler handler : TOOL_LOGGER.getHandlers()) {
            TOOL_LOGGER.removeHandler(handler);
        }
        final Handler handler = new ParserLoggingHandler();
        TOOL_LOGGER.addHandler(handler);
        getLevel(handler, FHANDLER_LOG_LEVEL);
    }

    public static void getLevel(final Handler handler, final String logLevel) {
        if (logLevel.equalsIgnoreCase("INFO")) {
            handler.setLevel(Level.INFO);
        } else if (logLevel.equalsIgnoreCase("WARNING")) {
            handler.setLevel(Level.WARNING);
        } else if (logLevel.equalsIgnoreCase("DETAILED")) {
            handler.setLevel(Level.FINEST);
        }
    }
    public static void log(final Level level, final String msg) {
        TOOL_LOGGER.log(level, msg);

    }

    public static void log(final Level level, final String msg, final Object param) {
        TOOL_LOGGER.log(level, msg, param);
    }

    static String getLogDirectory() {
        final String baseLogDir = System.getProperty("user.dir");//LOG_DIR", DEFAULT_LOG_DIR);
        return baseLogDir + File.separator;
    }

    /**
     * Log an exception which has been caught.
     *
     * @param className
     *            the class where the exception was caught
     * @param methodName
     *            the method where the exception was caught
     * @param info
     *            Information about the exception
     * @param th
     *            the Throwable which was caught
     */
    public static void exception(final String className, final String methodName, final String info, final Throwable th) {
        final StringBuilder sb = new StringBuilder(info);
        sb.append(NEWLINE);
        final StringWriter stkString = new StringWriter();
        th.printStackTrace(new PrintWriter(stkString));
        sb.append(stkString);
        log(Level.SEVERE, className, methodName, sb.toString());
    }

    private static void log(final Level level, final String className, final String methodName, final String infoMessage) {
        final StringBuilder sb = new StringBuilder();
        if (isLevelActive(level)) {
            sb.append(Thread.currentThread().getName());
            sb.append(SEMICOLON);
            sb.append("{").append(System.currentTimeMillis()).append("}");
            sb.append(SEMICOLON);
            sb.append(className);
            sb.append(SEMICOLON);
            sb.append(methodName);
            sb.append(SEMICOLON);
            sb.append(infoMessage);
            TOOL_LOGGER.log(level, sb.toString());
        }
    }

    public static boolean isLevelActive(final Level level) {
        return TOOL_LOGGER.isLoggable(level);
    }

    public static void main(final String args[]) {
        ParserLogger.log(Level.WARNING, "Regular expression is : ");

    }

}
