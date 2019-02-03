package com.bytedance.frameworks.core.monitor;

import android.content.Context;
import android.os.Handler;
import android.os.Looper;
import android.os.Message;
import bytedance.framwork.core.sdkmonitor.MonitorToutiaoConstants;
import com.bytedance.frameworks.core.monitor.model.DebugRealLog;
import com.bytedance.frameworks.core.monitor.model.InitialLogInfo;
import com.bytedance.frameworks.core.monitor.model.LocalLog;
import com.bytedance.frameworks.core.monitor.model.LocalVersionInfo;
import com.bytedance.frameworks.core.monitor.model.UploadLogLegacyCommand;
import com.bytedance.frameworks.core.monitor.util.TimeUtils;
import org.json.JSONObject;

public class MonitorLogHandler extends Handler {
    private volatile String mAid;
    private volatile Context mContext;
    private LogReportManager mLogReportManager;
    private LogStoreManager mLogStoreManager;
    private LogVersionManager mLogVersionManager;
    private MonitorLog mMonitorLog;

    public MonitorLogHandler(Looper looper, Context context, String str) {
        super(looper);
        this.mContext = context;
        this.mAid = str;
    }

    private void init() {
        this.mLogStoreManager = new LogStoreManager(this.mContext, this.mAid);
        this.mLogVersionManager = new LogVersionManager(this.mContext, this.mLogStoreManager);
        this.mLogReportManager = new LogReportManager(this.mContext, this.mAid, this.mLogStoreManager);
        this.mMonitorLog = new MonitorLog(this.mLogStoreManager, this.mLogVersionManager);
    }

    public void handleMessage(Message message) {
        switch (message.what) {
            case 1:
                init();
                return;
            case 2:
                initVersionInfo(message);
                return;
            case 3:
                handleCount(message);
                return;
            case 4:
                handleTimer(message);
                return;
            case 5:
                handleDebugReal(message);
                return;
            case 6:
                handleDirectTimer(message);
                return;
            case 7:
                handleDirectCount(message);
                return;
            case 8:
                handleUpdateConfig();
                return;
            case 9:
                handleUpdateCollectLogSwitch(message);
                return;
            case 10:
                handleLogSend(message);
                return;
            case 11:
                handleUploadLegacy(message);
                return;
            case 12:
                handleFlushBuffer();
                return;
            case 13:
                handleLogTimedTask();
                return;
            case 14:
                handlePackAndSendLog();
                return;
            case 15:
                handleReportLogCountDaily(message);
                return;
            case 16:
                handleCleanExpiredLog(message);
                return;
            default:
                return;
        }
    }

    private void initVersionInfo(Message message) {
        if (this.mLogVersionManager != null && message.obj != null && (message.obj instanceof LocalVersionInfo)) {
            this.mLogVersionManager.setCurrentVersionInfo((LocalVersionInfo) message.obj);
        }
    }

    private void handleCount(Message message) {
        if (this.mMonitorLog != null && message.obj != null && (message.obj instanceof InitialLogInfo)) {
            this.mMonitorLog.handleCount((InitialLogInfo) message.obj);
        }
    }

    private void handleTimer(Message message) {
        if (this.mMonitorLog != null && message.obj != null && (message.obj instanceof InitialLogInfo)) {
            this.mMonitorLog.handleTimer((InitialLogInfo) message.obj);
        }
    }

    private void handleDirectCount(Message message) {
        if (this.mMonitorLog != null && message.obj != null && (message.obj instanceof InitialLogInfo)) {
            this.mMonitorLog.directSendCount((InitialLogInfo) message.obj);
        }
    }

    private void handleDirectTimer(Message message) {
        if (this.mMonitorLog != null && message.obj != null && (message.obj instanceof InitialLogInfo)) {
            this.mMonitorLog.directSendTimer((InitialLogInfo) message.obj);
        }
    }

    private void handleDebugReal(Message message) {
        if (this.mMonitorLog != null && message.obj != null && (message.obj instanceof DebugRealLog)) {
            this.mMonitorLog.handleDebug((DebugRealLog) message.obj);
        }
    }

    private void handleUpdateConfig() {
        if (this.mLogReportManager != null) {
            this.mLogReportManager.updateConfig();
        }
        if (this.mLogStoreManager != null) {
            this.mLogStoreManager.updateConfig();
        }
    }

    private void handleUpdateCollectLogSwitch(Message message) {
        if (this.mLogReportManager != null && message.obj != null && (message.obj instanceof Boolean)) {
            this.mLogReportManager.setCollectLogSwitch(((Boolean) message.obj).booleanValue());
        }
    }

    private void handleLogSend(Message message) {
        if (this.mMonitorLog != null && message.obj != null && (message.obj instanceof LocalLog)) {
            LocalLog localLog = (LocalLog) message.obj;
            localLog.createTime = System.currentTimeMillis() / 1000;
            localLog.versionId = this.mLogVersionManager.getCurrentVersionId();
            if (message.arg1 == 1) {
                this.mMonitorLog.saveDBImmediate(localLog);
            } else {
                this.mMonitorLog.enqueue(localLog);
            }
        }
    }

    private void handleUploadLegacy(Message message) {
        if (this.mLogReportManager != null && message.obj != null && (message.obj instanceof UploadLogLegacyCommand)) {
            this.mLogReportManager.uploadLegacyLog((UploadLogLegacyCommand) message.obj);
        }
    }

    private void handleFlushBuffer() {
        if (this.mMonitorLog != null) {
            this.mMonitorLog.processPendingQueue(true);
        }
    }

    private void handleLogTimedTask() {
        if (this.mMonitorLog != null) {
            this.mMonitorLog.handleLogToQueue();
            this.mMonitorLog.processPendingQueue(false);
        }
    }

    private void handlePackAndSendLog() {
        if (this.mLogReportManager != null) {
            this.mLogReportManager.packAndSendLog();
        }
    }

    private void handleReportLogCountDaily(Message message) {
        if (this.mLogStoreManager != null) {
            long logCountInTime = this.mLogStoreManager.getLogCountInTime(TimeUtils.getYesterdayStart(), TimeUtils.getYesterdayEnd());
            if (logCountInTime > 0) {
                try {
                    int dBSizeInMB = this.mLogStoreManager.getDBSizeInMB();
                    int dBJournalSizeInKB = this.mLogStoreManager.getDBJournalSizeInKB();
                    JSONObject jSONObject = new JSONObject();
                    jSONObject.put("log_type", MonitorToutiaoConstants.MONITOR_TYPE_SERVICE_MONITOR);
                    jSONObject.put("service", "local_monitor_count_day");
                    JSONObject jSONObject2 = new JSONObject();
                    jSONObject2.put("dayCount", logCountInTime);
                    jSONObject2.put("totalCount", this.mLogStoreManager.getLogTotalCount());
                    jSONObject2.put("dbSize", dBSizeInMB);
                    jSONObject2.put("dbJournalSize", dBJournalSizeInKB);
                    jSONObject.put("value", jSONObject2);
                    jSONObject.put("timestamp", System.currentTimeMillis());
                    MonitorLog monitorLog = this.mMonitorLog;
                    String str = MonitorToutiaoConstants.MONITOR_TYPE_SERVICE_MONITOR;
                    String str2 = "disk";
                    String jSONObject3 = jSONObject.toString();
                    boolean z = true;
                    if (message.arg1 != 1) {
                        z = false;
                    }
                    monitorLog.enqueue(str, str2, jSONObject3, z);
                } catch (Exception e) {
                }
            }
        }
    }

    private void handleCleanExpiredLog(Message message) {
        if (this.mLogStoreManager != null) {
            this.mLogStoreManager.cleanExpiredLog((long) message.arg1);
        }
    }
}
