package com.ericsson.eniq.events.utils.logging;

import java.io.*;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.logging.*;

public class ParserLoggingHandler extends Handler {

    private static final DateFormat LOGFILE_TSTAMP_FORMATTER = new SimpleDateFormat("yyyy_MM_dd");

    private static final String PARSER = "parser";
    /**
     * Default base log directory
     */
    private static final String DEFAULT_LOG_DIR = System.getProperty("user.dir") + File.separator + ".." + File.separator + "logs";
    /**
     * File Writer
     */
    private BufferedWriter logWriter = null;
    /**
     * Current timestamp.
     */
    private String timeStamp;

    // Backup logger is something in here fails.
    private static final Logger BACKUP_LOGGER = Logger.getLogger("");

    /**
     * Constructor
     */
    public ParserLoggingHandler() {
        setFormatter(new ParserLogFormatter());
    }

    String getLogDirectory() {
        final String baseLogDir = System.getProperty("LOG_DIR", DEFAULT_LOG_DIR);
        return baseLogDir + File.separator + PARSER;
    }

    /**
     * Flush any buffered output.
     */
    @Override
    public synchronized void flush() {
        if (logWriter != null) {
            try {
                logWriter.flush();
            } catch (final IOException e) {
                BACKUP_LOGGER.log(Level.WARNING, "flush failed", e);
            }
        }
    }

    @Override
    public synchronized void close() {
        if (logWriter != null) {
            try {
                logWriter.close();
            } catch (final IOException e) {
                BACKUP_LOGGER.log(Level.WARNING, "close failed", e);
            }
            logWriter = null;
        }
    }

    @Override
    public synchronized void publish(final LogRecord record) {
        if (!isLoggable(record)) {
            return;
        }
        try {
            final Date date = new Date(record.getMillis());
            final String dstamp = LOGFILE_TSTAMP_FORMATTER.format(date);
            if (logWriter == null || !dstamp.equals(timeStamp)) {
                logWriter = rotate(dstamp);
            }
            if (logWriter == null) {
                BACKUP_LOGGER.log(record.getLevel(), record.getMessage());
            } else {
                logWriter.write(getFormatter().format(record));
                logWriter.flush();
            }
        } catch (final Exception ex) {
            BACKUP_LOGGER.log(Level.WARNING, "public failed", ex);
        }
    }

    /**
     * Closed the current log file and start a new one
     * 
     * @param timestamp
     *            Date for the file name
     * @return A Write for the log file
     */
    protected BufferedWriter rotate(final String timestamp) {
        try {
            if (logWriter != null) {
                logWriter.close();
                logWriter = null;
            }
            final File dir = new File(getLogDirectory());
            if (!dir.exists()) {
                if (!dir.mkdirs()) {
                    BACKUP_LOGGER.log(Level.WARNING, "Failed to create the directory tree " + getLogDirectory());
                }
            }
            final File f = new File(dir, "tcparser-" + timestamp + ".log");
            logWriter = new BufferedWriter(new FileWriter(f, true));
            timeStamp = timestamp;
            logWriter.write(getFormatter().getHead(this));
            logWriter.flush();
        } catch (final Exception e) {
            BACKUP_LOGGER.log(Level.WARNING, "rotate failed", e);
            return null;
        }
        return logWriter;
    }
}
