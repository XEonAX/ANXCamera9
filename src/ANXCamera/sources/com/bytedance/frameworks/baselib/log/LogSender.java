package com.bytedance.frameworks.baselib.log;

import android.content.Context;
import android.text.TextUtils;
import com.bytedance.frameworks.baselib.log.LogHandler.IConfig;
import com.bytedance.frameworks.baselib.log.LogHandler.IResponseConfig;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import java.util.concurrent.atomic.AtomicBoolean;

final class LogSender extends Thread {
    private static final long CLEAN_LOG_INTERVAL = 600000;
    private static final long DEFAULT_SCAN_LOG_INTERVAL = 120000;
    static final String KEY_MAGIC_TAG = "magic_tag";
    static final String KEY_MESSAGE = "message";
    static final String MAGIC_TAG = "log_queue";
    private static final long MAX_EXPIRE_TIME = 864000000;
    static final String STATUS_OK = "success";
    private static final String TAG = "LogSender";
    private final Context mContext;
    private final LogDBHelper mDbHelper;
    private long mLastCleanTime = 0;
    private final Object mLock = new Object();
    private LogQueue mLogQueue;
    private long mMinLog = -1;
    private final LinkedList<LogItem> mPendingQueue;
    private long mScanLogInterval = DEFAULT_SCAN_LOG_INTERVAL;
    private final AtomicBoolean mStopFlag;

    LogSender(Context context, LogQueue logQueue, LinkedList<LogItem> linkedList, AtomicBoolean atomicBoolean) {
        super(TAG);
        this.mLogQueue = logQueue;
        this.mContext = context;
        this.mPendingQueue = linkedList;
        this.mStopFlag = atomicBoolean;
        this.mDbHelper = LogDBHelper.getInstance(this.mContext);
    }

    private void cleanLog() {
        if (!isStop()) {
            Map allLogHandler = this.mLogQueue.getAllLogHandler();
            if (allLogHandler != null && !allLogHandler.isEmpty()) {
                for (String str : allLogHandler.keySet()) {
                    if (isStop()) {
                        break;
                    }
                    LogHandler logHandler = (LogHandler) allLogHandler.get(str);
                    if (logHandler != null) {
                        IConfig config = logHandler.getConfig();
                        if (config != null) {
                            this.mDbHelper.cleanExpireLog(str, config.getMaxRetryCount(), config.getLogExpireTime());
                        }
                    }
                }
            }
            this.mDbHelper.cleanExpireLog(null, -1, MAX_EXPIRE_TIME);
        }
    }

    /* JADX WARNING: Missing block: B:15:0x002d, code:
            if (r0 == null) goto L_0x004e;
     */
    /* JADX WARNING: Missing block: B:18:0x0040, code:
            if (r6.mDbHelper.insertLog(r0.type, r0.value) < Long.MAX_VALUE) goto L_0x004e;
     */
    /* JADX WARNING: Missing block: B:19:0x0042, code:
            r6.mDbHelper.recreateTableQueue();
     */
    /* JADX WARNING: Missing block: B:21:0x0049, code:
            r6.mDbHelper.recreateTableQueue();
     */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    private boolean processPendingQueue() {
        boolean isEmpty;
        if (isStop()) {
            return false;
        }
        LogItem logItem = null;
        synchronized (this.mPendingQueue) {
            if (isStop()) {
                return false;
            }
            if (!this.mPendingQueue.isEmpty()) {
                logItem = (LogItem) this.mPendingQueue.poll();
            }
            isEmpty = this.mPendingQueue.isEmpty() ^ 1;
        }
        return isEmpty;
    }

    /* JADX WARNING: Removed duplicated region for block: B:146:0x022c  */
    /* JADX WARNING: Removed duplicated region for block: B:145:0x022b A:{RETURN} */
    /* JADX WARNING: Removed duplicated region for block: B:145:0x022b A:{RETURN} */
    /* JADX WARNING: Removed duplicated region for block: B:146:0x022c  */
    /* JADX WARNING: Removed duplicated region for block: B:146:0x022c  */
    /* JADX WARNING: Removed duplicated region for block: B:145:0x022b A:{RETURN} */
    /* JADX WARNING: Removed duplicated region for block: B:145:0x022b A:{RETURN} */
    /* JADX WARNING: Removed duplicated region for block: B:146:0x022c  */
    /* JADX WARNING: Removed duplicated region for block: B:146:0x022c  */
    /* JADX WARNING: Removed duplicated region for block: B:145:0x022b A:{RETURN} */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    private boolean scanAndSendLog() {
        Object th;
        String str;
        StringBuilder stringBuilder;
        StringBuilder stringBuilder2;
        if (isStop()) {
            return false;
        }
        if (this.mMinLog < 0 && System.currentTimeMillis() - this.mLastCleanTime > 600000) {
            this.mMinLog = 0;
            cleanLog();
            this.mLastCleanTime = System.currentTimeMillis();
        }
        if (LogLib.isNetworkAvailable(this.mContext)) {
            LogItem log = this.mDbHelper.getLog(this.mMinLog);
            String str2 = null;
            if (log != null) {
                IConfig iConfig;
                LogHandler logHandler;
                boolean z;
                boolean z2;
                if (this.mMinLog < log.id) {
                    this.mMinLog = log.id;
                } else {
                    this.mMinLog++;
                }
                if (log.value == null || log.value.length <= 0) {
                    iConfig = null;
                    logHandler = iConfig;
                    z = true;
                    z2 = false;
                } else {
                    logHandler = this.mLogQueue.getLogHandler(log.type);
                    if (logHandler == null) {
                        return true;
                    }
                    IConfig config = logHandler.getConfig();
                    IResponseConfig responseConfig = logHandler.getResponseConfig();
                    long currentTimeMillis = System.currentTimeMillis();
                    long retryInterval = config.getRetryInterval();
                    String lastSuccessChannel;
                    List<String> channels;
                    boolean z3;
                    if (responseConfig != null) {
                        if (responseConfig.getRemoveSwitch()) {
                            z = false;
                            z2 = true;
                            iConfig = config;
                        } else {
                            long stopInterval = responseConfig.getStopInterval();
                            long stopMoreChannelInterval = logHandler.getStopMoreChannelInterval();
                            if ((stopInterval > 0 && currentTimeMillis - logHandler.getLastStopTime() < stopInterval) || (stopMoreChannelInterval > 0 && currentTimeMillis - logHandler.getLastStopTime() < stopMoreChannelInterval)) {
                                return true;
                            }
                            logHandler.setLastStopTime(System.currentTimeMillis());
                            if (retryInterval > 0 && log.retry_count > 0 && currentTimeMillis - log.retry_time < retryInterval * ((long) log.retry_count)) {
                                return true;
                            }
                            lastSuccessChannel = logHandler.getLastSuccessChannel();
                            channels = config.getChannels();
                            if (channels == null) {
                                return true;
                            }
                            boolean z4;
                            try {
                                boolean z5;
                                if (TextUtils.isEmpty(lastSuccessChannel)) {
                                    z3 = false;
                                    z5 = false;
                                } else {
                                    z3 = sendLog(logHandler, lastSuccessChannel, log.value);
                                    z5 = true;
                                }
                                if (z3) {
                                    logHandler.setStopMoreChannelInterval(0);
                                    z4 = z3;
                                    str2 = lastSuccessChannel;
                                    z2 = z4;
                                } else {
                                    try {
                                        z4 = z3;
                                        int i = 0;
                                        for (String str3 : channels) {
                                            try {
                                                if (!responseConfig.getMoreChannelSwitch() && r4) {
                                                    break;
                                                } else if (isStop()) {
                                                    return true;
                                                } else {
                                                    if (TextUtils.isEmpty(str3) || str3.equals(lastSuccessChannel)) {
                                                        i++;
                                                    } else {
                                                        z5 = sendLog(logHandler, str3, log.value);
                                                        if (z5) {
                                                            z4 = z5;
                                                            lastSuccessChannel = str3;
                                                            break;
                                                        }
                                                        i++;
                                                        z4 = z5;
                                                        z5 = true;
                                                    }
                                                }
                                            } catch (Throwable th2) {
                                                th = th2;
                                                str = TAG;
                                                stringBuilder = new StringBuilder();
                                                stringBuilder.append("send log exception: ");
                                                stringBuilder.append(th);
                                                LogQueue.log(str, stringBuilder.toString());
                                                str2 = lastSuccessChannel;
                                                z2 = z4;
                                                iConfig = config;
                                                z = false;
                                                if (isStop()) {
                                                }
                                            }
                                        }
                                        if (i != channels.size() || channels.size() <= 1) {
                                            logHandler.setStopMoreChannelInterval(0);
                                        } else {
                                            logHandler.setStopMoreChannelInterval(responseConfig.getStopMoreChannelInterval());
                                        }
                                    } catch (Throwable th3) {
                                        th = th3;
                                        z4 = z3;
                                        str = TAG;
                                        stringBuilder = new StringBuilder();
                                        stringBuilder.append("send log exception: ");
                                        stringBuilder.append(th);
                                        LogQueue.log(str, stringBuilder.toString());
                                        str2 = lastSuccessChannel;
                                        z2 = z4;
                                        iConfig = config;
                                        z = false;
                                        if (isStop()) {
                                        }
                                    }
                                    str2 = lastSuccessChannel;
                                    z2 = z4;
                                }
                            } catch (Throwable th4) {
                                th = th4;
                                z4 = false;
                                str = TAG;
                                stringBuilder = new StringBuilder();
                                stringBuilder.append("send log exception: ");
                                stringBuilder.append(th);
                                LogQueue.log(str, stringBuilder.toString());
                                str2 = lastSuccessChannel;
                                z2 = z4;
                                iConfig = config;
                                z = false;
                                if (isStop()) {
                                }
                            }
                        }
                    } else if (retryInterval > 0 && log.retry_count > 0 && currentTimeMillis - log.retry_time < retryInterval * ((long) log.retry_count)) {
                        return true;
                    } else {
                        lastSuccessChannel = logHandler.getLastSuccessChannel();
                        channels = config.getChannels();
                        if (channels == null) {
                            return true;
                        }
                        String str4;
                        try {
                            if (TextUtils.isEmpty(lastSuccessChannel)) {
                                z3 = false;
                            } else {
                                z3 = sendLog(logHandler, lastSuccessChannel, log.value);
                            }
                            if (!z3) {
                                try {
                                    for (String str42 : channels) {
                                        if (isStop()) {
                                            return true;
                                        }
                                        if (!TextUtils.isEmpty(str42)) {
                                            if (!str42.equals(lastSuccessChannel)) {
                                                boolean sendLog = sendLog(logHandler, str42, log.value);
                                                if (sendLog) {
                                                    str2 = str42;
                                                    z2 = sendLog;
                                                    break;
                                                }
                                                z3 = sendLog;
                                            }
                                        }
                                    }
                                } catch (Throwable th5) {
                                    th = th5;
                                    str42 = TAG;
                                    stringBuilder2 = new StringBuilder();
                                    stringBuilder2.append("send log exception: ");
                                    stringBuilder2.append(th);
                                    LogQueue.log(str42, stringBuilder2.toString());
                                    str2 = lastSuccessChannel;
                                    z2 = z3;
                                    iConfig = config;
                                    z = false;
                                    if (isStop()) {
                                    }
                                }
                            }
                            str2 = lastSuccessChannel;
                            z2 = z3;
                        } catch (Throwable th6) {
                            th = th6;
                            z3 = false;
                            str42 = TAG;
                            stringBuilder2 = new StringBuilder();
                            stringBuilder2.append("send log exception: ");
                            stringBuilder2.append(th);
                            LogQueue.log(str42, stringBuilder2.toString());
                            str2 = lastSuccessChannel;
                            z2 = z3;
                            iConfig = config;
                            z = false;
                            if (isStop()) {
                            }
                        }
                    }
                    iConfig = config;
                    z = false;
                }
                if (isStop()) {
                    return true;
                }
                if (z) {
                    this.mDbHelper.onLogSent(log.id, true, 0, 0);
                } else {
                    if (z2) {
                        logHandler.setLastSuccessChannel(str2);
                    }
                    if (this.mDbHelper.onLogSent(log.id, z2, iConfig.getLogExpireTime(), iConfig.getMaxRetryCount())) {
                        long retryInterval2 = iConfig.getRetryInterval() * ((long) (log.retry_count + 1));
                        if (retryInterval2 > 0) {
                            this.mScanLogInterval = retryInterval2;
                        }
                        this.mScanLogInterval = Math.min(DEFAULT_SCAN_LOG_INTERVAL, this.mScanLogInterval);
                    } else {
                        this.mScanLogInterval = DEFAULT_SCAN_LOG_INTERVAL;
                    }
                    logHandler.onLogSent(log.value, z2);
                }
                return true;
            } else if (this.mMinLog == 0 && this.mDbHelper.getEventCount(null) == 0) {
                this.mScanLogInterval = 0;
                return false;
            } else {
                if (this.mMinLog == -1) {
                    this.mScanLogInterval = DEFAULT_SCAN_LOG_INTERVAL;
                }
                this.mMinLog = -1;
                return false;
            }
        }
        this.mScanLogInterval = DEFAULT_SCAN_LOG_INTERVAL;
        return false;
    }

    private boolean sendLog(LogHandler logHandler, String str, byte[] bArr) throws Throwable {
        if (bArr == null || bArr.length <= 0 || logHandler == null || TextUtils.isEmpty(str)) {
            return false;
        }
        return logHandler.send(str, bArr);
    }

    public void run() {
        LogQueue.log(TAG, "LogSender start");
        while (!isStop()) {
            boolean processPendingQueue = processPendingQueue();
            if (isStop()) {
                break;
            }
            Object obj = (scanAndSendLog() || processPendingQueue) ? 1 : null;
            if (isStop()) {
                break;
            } else if (obj == null) {
                synchronized (this.mLock) {
                    try {
                        if (this.mScanLogInterval == 0) {
                            this.mLock.wait();
                        } else {
                            this.mLock.wait(this.mScanLogInterval);
                        }
                    } catch (InterruptedException e) {
                    }
                }
            }
        }
        LogQueue.log(TAG, "LogSender quit");
    }

    private boolean isStop() {
        return this.mStopFlag.get();
    }

    void awaken() {
        synchronized (this.mLock) {
            this.mLock.notify();
        }
    }

    void quit() {
        awaken();
        this.mDbHelper.closeDatabase();
    }
}
