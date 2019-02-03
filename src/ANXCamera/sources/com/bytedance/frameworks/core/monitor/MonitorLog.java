package com.bytedance.frameworks.core.monitor;

import android.text.TextUtils;
import android.util.Log;
import com.bytedance.frameworks.core.monitor.model.CountInfo;
import com.bytedance.frameworks.core.monitor.model.DebugRealLog;
import com.bytedance.frameworks.core.monitor.model.InitialLogInfo;
import com.bytedance.frameworks.core.monitor.model.LocalLog;
import com.bytedance.frameworks.core.monitor.model.TimerInfo;
import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;
import java.util.Map.Entry;
import org.json.JSONObject;

public class MonitorLog {
    private static final int MAX_QUEUE_SIZE = 2000;
    private static final String TAG = "monitorLog";
    private static MonitorLog sMonLog;
    private final int WAIT_INSERT_DB_LOG_SIZE = 5;
    private final int WAIT_INSERT_DB_TIME = 120000;
    private final HashMap<String, CountInfo> mCountInfo = new HashMap();
    private long mLastInsertDBTime = 0;
    private LogStoreManager mLoalStoreManager;
    private LogVersionManager mLogVersionManager;
    private final LinkedList<LocalLog> mPendingQueue = new LinkedList();
    private final HashMap<String, TimerInfo> mTimerInfo = new HashMap();
    private int reportInterval = 120;

    public MonitorLog(LogStoreManager logStoreManager, LogVersionManager logVersionManager) {
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("MonitorLog: ");
        stringBuilder.append(logStoreManager.getAid());
        stringBuilder.append(" , threadName: ");
        stringBuilder.append(Thread.currentThread().getName());
        Log.d("monitorlib", stringBuilder.toString());
        this.mLoalStoreManager = logStoreManager;
        this.mLogVersionManager = logVersionManager;
    }

    public void handleCount(InitialLogInfo initialLogInfo) {
        if (initialLogInfo != null) {
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.append(initialLogInfo.key);
            stringBuilder.append(initialLogInfo.type);
            stringBuilder.append(initialLogInfo.type2);
            String stringBuilder2 = stringBuilder.toString();
            long currentTimeMillis = System.currentTimeMillis() / 1000;
            CountInfo countInfo = (CountInfo) this.mCountInfo.get(stringBuilder2);
            if (countInfo == null) {
                countInfo = new CountInfo(initialLogInfo.key, initialLogInfo.type, 0.0f, currentTimeMillis).setType2(initialLogInfo.type2);
                this.mCountInfo.put(stringBuilder2, countInfo);
            }
            boolean z = countInfo.isSampled || initialLogInfo.isSampled;
            countInfo.isSampled = z;
            countInfo.count += initialLogInfo.value;
        }
    }

    protected void handleTimer(InitialLogInfo initialLogInfo) {
        if (initialLogInfo != null) {
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.append(initialLogInfo.key);
            stringBuilder.append(initialLogInfo.type);
            stringBuilder.append(initialLogInfo.type2);
            String stringBuilder2 = stringBuilder.toString();
            long currentTimeMillis = System.currentTimeMillis() / 1000;
            TimerInfo timerInfo = (TimerInfo) this.mTimerInfo.get(stringBuilder2);
            if (timerInfo == null) {
                timerInfo = new TimerInfo(initialLogInfo.key, initialLogInfo.type, 0, 0.0f, currentTimeMillis).setType2(initialLogInfo.type2);
                this.mTimerInfo.put(stringBuilder2, timerInfo);
            }
            boolean z = timerInfo.isSampled || initialLogInfo.isSampled;
            timerInfo.isSampled = z;
            timerInfo.value += initialLogInfo.value;
            timerInfo.times++;
        }
    }

    protected void enqueue(String str, String str2, boolean z) {
        enqueue(str, "", str2, z);
    }

    protected void enqueue(LocalLog localLog) {
        if (this.mPendingQueue.size() >= 2000) {
            this.mPendingQueue.poll();
        }
        this.mPendingQueue.add(localLog);
    }

    protected void saveDBImmediate(LocalLog localLog) {
        if (this.mLoalStoreManager != null) {
            try {
                this.mLoalStoreManager.insertLocalLog(localLog);
            } catch (Exception e) {
            }
        }
    }

    protected void enqueue(String str, String str2, String str3, boolean z) {
        if (!TextUtils.isEmpty(str3) && !TextUtils.isEmpty(str)) {
            enqueue(new LocalLog().setType(str).setType2(str2).setData(str3).setIsSampled(z).setTimestamp(System.currentTimeMillis() / 1000).setVersionId(this.mLogVersionManager.getCurrentVersionId()));
        }
    }

    protected void handleDebug(DebugRealLog debugRealLog) {
        if (debugRealLog != null) {
            JSONObject jSONObject = new JSONObject();
            try {
                jSONObject.put("log_type", MonitorCommonConstants.DEBUG_REAL_TYPE);
                jSONObject.put("value", debugRealLog.value);
                jSONObject.put("trace_code", debugRealLog.traceCode);
                enqueue(MonitorCommonConstants.DEBUG_REAL_TYPE, jSONObject.toString(), true);
            } catch (Exception e) {
            }
        }
    }

    protected void directSendCount(InitialLogInfo initialLogInfo) {
        if (initialLogInfo != null) {
            JSONObject jSONObject = new JSONObject();
            try {
                jSONObject.put("type", initialLogInfo.type);
                jSONObject.put("key", initialLogInfo.key);
                jSONObject.put("value", (double) initialLogInfo.value);
                enqueue(MonitorCommonConstants.COUNT_TYPE, initialLogInfo.type2, jSONObject.toString(), initialLogInfo.isSampled);
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }

    protected void directSendTimer(InitialLogInfo initialLogInfo) {
        if (initialLogInfo != null) {
            JSONObject jSONObject = new JSONObject();
            try {
                jSONObject.put("type", initialLogInfo.type);
                jSONObject.put("key", initialLogInfo.key);
                jSONObject.put("value", (double) initialLogInfo.value);
                enqueue(MonitorCommonConstants.TIMER_TYPE, "", jSONObject.toString(), initialLogInfo.isSampled);
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }

    protected void handleLogToQueue() {
        try {
            Iterator it;
            JSONObject packStatEntry;
            long currentTimeMillis = System.currentTimeMillis() / 1000;
            if (!this.mCountInfo.isEmpty()) {
                it = this.mCountInfo.entrySet().iterator();
                while (it.hasNext()) {
                    CountInfo countInfo = (CountInfo) ((Entry) it.next()).getValue();
                    if (currentTimeMillis - countInfo.firstTime > ((long) this.reportInterval)) {
                        it.remove();
                        packStatEntry = packStatEntry(MonitorCommonConstants.COUNT_TYPE, countInfo, null);
                        if (packStatEntry != null) {
                            enqueue(MonitorCommonConstants.COUNT_TYPE, countInfo.type2, packStatEntry.toString(), countInfo.isSampled);
                        }
                    }
                }
            }
            if (!this.mTimerInfo.isEmpty()) {
                it = this.mTimerInfo.entrySet().iterator();
                while (it.hasNext()) {
                    TimerInfo timerInfo = (TimerInfo) ((Entry) it.next()).getValue();
                    if (currentTimeMillis - timerInfo.firstTime > ((long) this.reportInterval)) {
                        it.remove();
                        packStatEntry = packStatEntry(MonitorCommonConstants.TIMER_TYPE, null, timerInfo);
                        if (packStatEntry != null) {
                            enqueue(MonitorCommonConstants.TIMER_TYPE, timerInfo.type2, packStatEntry.toString(), timerInfo.isSampled);
                        }
                    }
                }
            }
        } catch (Exception e) {
            String str = TAG;
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.append("handleLogToQueue function failed :");
            stringBuilder.append(e.toString());
            Log.e(str, stringBuilder.toString());
        }
    }

    private JSONObject packStatEntry(String str, CountInfo countInfo, TimerInfo timerInfo) {
        JSONObject jSONObject = new JSONObject();
        if (MonitorCommonConstants.COUNT_TYPE.equals(str)) {
            try {
                jSONObject.put("type", countInfo.type);
                jSONObject.put("key", countInfo.key);
                jSONObject.put("value", (double) countInfo.count);
                return jSONObject;
            } catch (Exception e) {
                return null;
            }
        } else if (!MonitorCommonConstants.TIMER_TYPE.equals(str)) {
            return null;
        } else {
            try {
                jSONObject.put("type", timerInfo.type);
                jSONObject.put("key", timerInfo.key);
                jSONObject.put("value", (double) (timerInfo.value / ((float) timerInfo.times)));
                return jSONObject;
            } catch (Exception e2) {
                String str2 = TAG;
                StringBuilder stringBuilder = new StringBuilder();
                stringBuilder.append("packStatEntry json failed");
                stringBuilder.append(e2.toString());
                Log.e(str2, stringBuilder.toString());
                return null;
            }
        }
    }

    protected void quit() {
        synchronized (MonitorLog.class) {
            if (sMonLog == null) {
                return;
            }
            sMonLog.stop();
            sMonLog = null;
        }
    }

    public void stop() {
        this.mPendingQueue.clear();
        this.mPendingQueue.notifyAll();
        if (this.mLoalStoreManager != null) {
            this.mLoalStoreManager.closeDB();
        }
    }

    public boolean processPendingQueue(boolean z) {
        long currentTimeMillis = System.currentTimeMillis();
        int size = this.mPendingQueue.size();
        if (size <= 0 || (!z && size < 5 && currentTimeMillis - this.mLastInsertDBTime <= 120000)) {
            return false;
        }
        this.mLastInsertDBTime = currentTimeMillis;
        List linkedList = new LinkedList(this.mPendingQueue);
        this.mPendingQueue.clear();
        try {
            this.mLoalStoreManager.insertLocalLogBatch(linkedList);
        } catch (Exception e) {
        }
        return true;
    }
}
