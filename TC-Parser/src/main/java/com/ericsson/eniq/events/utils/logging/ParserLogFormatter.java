/**
 * 
 */
package com.ericsson.eniq.events.utils.logging;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.logging.Formatter;
import java.util.logging.LogRecord;

/**
 * @author xsantiw
 * 
 */
public class ParserLogFormatter extends Formatter {
    SimpleDateFormat sdf = new SimpleDateFormat("MM-dd-yyyy HH:mm:ss");

    @Override
    public String format(final LogRecord logRecord) {
        final StringBuilder res = new StringBuilder();

        res.append(sdf.format(new Date(logRecord.getMillis())));
        res.append(" ");
        res.append(logRecord.getThreadID());
        res.append(" ");
        res.append(logRecord.getLevel().getName());
        res.append(" ");
        res.append(logRecord.getLoggerName());
        res.append(" : ");
        res.append(logRecord.getMessage());
        res.append("\n");

        Throwable t = logRecord.getThrown();
        int inten = 3;

        while (t != null) {
            appendException(t, inten, res);
            inten += 3;

            t = t.getCause();
        }

        return res.toString();
    }

    private void appendException(final Throwable throwable, final int inten, final StringBuilder res) {
        if (throwable != null) {
            indent(res, inten);
            res.append(throwable.getClass().getName());
            res.append(": ");
            res.append(throwable.getMessage());
            res.append("\n");
            final StackTraceElement[] stackTrace = throwable.getStackTrace();
            for (final StackTraceElement aSte : stackTrace) {
                indent(res, inten + 5);
                res.append(aSte.getClassName());
                res.append(".");
                res.append(aSte.getMethodName());
                res.append("(");
                if (aSte.getFileName() == null) {
                    res.append("Unknown Source");
                } else {
                    res.append(aSte.getFileName());
                    res.append(":");
                    res.append(aSte.getLineNumber());
                }
                res.append(")");
                res.append("\n");
            }
        }
    }

    private void indent(final StringBuilder sBuilder, final int indentSize) {
        for (int i = 0; i < indentSize + 5; i++) {
            sBuilder.append(" ");
        }
    }

}
