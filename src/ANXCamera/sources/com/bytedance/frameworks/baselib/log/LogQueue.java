package com.bytedance.frameworks.baselib.log;

import android.content.Context;
import java.util.LinkedList;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.atomic.AtomicBoolean;

public final class LogQueue {
    static final boolean DEBUG = false;
    private static final int MAX_QUEUE_SIZE = 2000;
    static final String TAG = "LogQueue";
    private static LogQueue sLogQueue;
    private final Context mContext;
    private final Map<String, LogHandler> mLogHandlers;
    private final LogSender mLogSender;
    private final LinkedList<LogItem> mPendingQueue = new LinkedList();
    private final AtomicBoolean mStopFlag = new AtomicBoolean(false);

    public static LogQueue getInstance(Context context) {
        if (sLogQueue == null) {
            synchronized (LogQueue.class) {
                if (sLogQueue == null) {
                    sLogQueue = new LogQueue(context);
                }
            }
        }
        return sLogQueue;
    }

    public static void quit() {
        synchronized (LogQueue.class) {
            if (sLogQueue != null) {
                sLogQueue.stop();
            }
        }
    }

    static void log(String str) {
    }

    static void log(String str, String str2) {
    }

    private LogQueue(Context context) {
        this.mContext = context.getApplicationContext();
        this.mLogHandlers = new ConcurrentHashMap();
        this.mLogSender = new LogSender(this.mContext, this, this.mPendingQueue, this.mStopFlag);
        this.mLogSender.start();
    }

    public void registerLogHandler(String str, LogHandler logHandler) {
        if (!isStop() && logHandler != null) {
            this.mLogHandlers.put(str, logHandler);
        }
    }

    public void unregisterLogHandler(LogHandler logHandler) {
        if (!isStop() && logHandler != null) {
            this.mLogHandlers.remove(logHandler.getType());
        }
    }

    LogHandler getLogHandler(String str) {
        return (LogHandler) this.mLogHandlers.get(str);
    }

    Map<String, LogHandler> getAllLogHandler() {
        return this.mLogHandlers;
    }

    /* JADX WARNING: Missing block: B:24:0x0045, code:
            return false;
     */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    boolean enqueue(String str, byte[] bArr) {
        if (isStop() || bArr == null || bArr.length <= 0 || getLogHandler(str) == null) {
            return false;
        }
        synchronized (this.mPendingQueue) {
            if (this.mStopFlag.get()) {
                return false;
            }
            if (this.mPendingQueue.size() >= 2000) {
                this.mPendingQueue.poll();
            }
            boolean add = this.mPendingQueue.add(new LogItem(str, bArr));
            this.mLogSender.awaken();
            return add;
        }
    }

    boolean isStop() {
        return this.mStopFlag.get();
    }

    void stop() {
        synchronized (this.mPendingQueue) {
            this.mPendingQueue.clear();
        }
        this.mStopFlag.set(true);
        this.mLogSender.quit();
    }
}
