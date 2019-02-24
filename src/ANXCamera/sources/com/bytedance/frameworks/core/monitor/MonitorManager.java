package com.bytedance.frameworks.core.monitor;

import android.content.Context;
import android.text.TextUtils;
import com.bytedance.frameworks.core.monitor.LogTaskManager.IInactiveMonitor;
import com.bytedance.frameworks.core.monitor.model.LocalVersionInfo;
import com.bytedance.frameworks.core.monitor.model.UploadLogLegacyCommand;

public class MonitorManager implements IInactiveMonitor {
    private static final String TAG = "MonitorManager";
    private LogTaskManager mLogTaskManager;
    private IHandleOnTimerEvent sIHandleOnTimeEvent;

    public interface IHandleOnTimerEvent {
        void handleEvent();
    }

    public void handleEvent() {
        if (this.sIHandleOnTimeEvent != null) {
            this.sIHandleOnTimeEvent.handleEvent();
        }
    }

    public MonitorManager(Context context, IHandleOnTimerEvent iHandleOnTimerEvent) {
        this(context, iHandleOnTimerEvent, "default");
    }

    public MonitorManager(Context context, IHandleOnTimerEvent iHandleOnTimerEvent, String str) {
        if (str == null) {
            str = "default";
        }
        this.mLogTaskManager = new LogTaskManager(context, str);
        this.sIHandleOnTimeEvent = iHandleOnTimerEvent;
        if (this.sIHandleOnTimeEvent != null) {
            this.mLogTaskManager.registerInactiveMonitor(this);
        }
    }

    public void setCurrentVersionInfo(LocalVersionInfo localVersionInfo) {
        if (this.mLogTaskManager != null) {
            this.mLogTaskManager.initCurrentVersionInfo(localVersionInfo);
        }
    }

    public void onCount(String str, String str2, String str3, boolean z) {
        onCount(str, str2, str3, 1.0f, z);
    }

    public void onCount(String str, String str2, String str3, float f, boolean z) {
        if (this.mLogTaskManager != null && !TextUtils.isEmpty(str) && !TextUtils.isEmpty(str3)) {
            this.mLogTaskManager.handleCount(str, str2, str3, f, z);
        }
    }

    public void onTimer(String str, String str2, String str3, float f, boolean z) {
        if (this.mLogTaskManager != null && !TextUtils.isEmpty(str) && !TextUtils.isEmpty(str3)) {
            this.mLogTaskManager.handleTimer(str, str2, str3, f, z);
        }
    }

    public void onDebug(String str) {
        onDebug(str, "");
    }

    public void onDebug(String str, String str2) {
        if (this.mLogTaskManager != null && !TextUtils.isEmpty(str)) {
            this.mLogTaskManager.handleDebug(str, str2);
        }
    }

    public void directOnCount(String str, String str2, String str3, float f, boolean z) {
        if (this.mLogTaskManager != null && !TextUtils.isEmpty(str) && !TextUtils.isEmpty(str3)) {
            this.mLogTaskManager.handleDirectCount(str, str2, str3, f, z);
        }
    }

    public void directOnTimer(String str, String str2, float f, boolean z) {
        if (this.mLogTaskManager != null && !TextUtils.isEmpty(str) && !TextUtils.isEmpty(str2)) {
            this.mLogTaskManager.handleDirectTimer(str, str2, f, z);
        }
    }

    public void logSend(String str, String str2, boolean z) {
        logSend(str, str, str2, z);
    }

    public void logSend(String str, String str2, String str3, boolean z) {
        logSend(str, str2, str3, z, false);
    }

    public void logSend(String str, String str2, String str3, boolean z, boolean z2) {
        if (this.mLogTaskManager != null && !TextUtils.isEmpty(str) && !TextUtils.isEmpty(str3)) {
            this.mLogTaskManager.logSend(str, str2, str3, z, z2);
        }
    }

    public void uploadLegacyLog(UploadLogLegacyCommand uploadLogLegacyCommand) {
        if (this.mLogTaskManager != null) {
            this.mLogTaskManager.uploadLogLegacy(uploadLogLegacyCommand);
        }
    }

    public void reportLogCountDaily(boolean z) {
        if (this.mLogTaskManager != null) {
            this.mLogTaskManager.reportLogCountDaily(z);
        }
    }

    public void cleanExpiredLog(long j) {
        if (this.mLogTaskManager != null) {
            this.mLogTaskManager.cleanExpiredLog(j);
        }
    }

    public void updateConfig() {
        if (this.mLogTaskManager != null) {
            this.mLogTaskManager.handleUpdateConfig();
        }
    }

    public void stopMonitor() {
        if (this.mLogTaskManager != null) {
            this.mLogTaskManager.quit();
        }
    }

    public void setReportLogSwitch(boolean z) {
        if (this.mLogTaskManager != null) {
            this.mLogTaskManager.setReportLogSwitch(z);
        }
    }

    public void flushBuffer2DB() {
        if (this.mLogTaskManager != null) {
            this.mLogTaskManager.flushBuffer2DB();
        }
    }
}
