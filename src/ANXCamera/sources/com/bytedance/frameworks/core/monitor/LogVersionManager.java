package com.bytedance.frameworks.core.monitor;

import android.content.Context;
import android.util.Log;
import com.bytedance.frameworks.core.monitor.model.LocalVersionInfo;

public class LogVersionManager {
    private static LogVersionManager sLogVersionManager;
    private Context mContext;
    private long mCurrentVersionId;
    private LocalVersionInfo mCurrentVersionInfo;
    private LogStoreManager mLogStoreManager;

    protected LogVersionManager(Context context, LogStoreManager logStoreManager) {
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("LogVersionManager: ");
        stringBuilder.append(logStoreManager.getAid());
        stringBuilder.append(" , threadName: ");
        stringBuilder.append(Thread.currentThread().getName());
        Log.d("monitorlib", stringBuilder.toString());
        this.mContext = context.getApplicationContext();
        this.mLogStoreManager = logStoreManager;
    }

    public long getCurrentVersionId() {
        return this.mCurrentVersionId;
    }

    public void setCurrentVersionInfo(LocalVersionInfo localVersionInfo) {
        this.mCurrentVersionInfo = localVersionInfo;
        checkAndSaveVersion();
    }

    protected long checkAndSaveVersion() {
        if (this.mCurrentVersionInfo == null) {
            return 2147483647L;
        }
        LocalVersionInfo latestLocalVersion = this.mLogStoreManager.getLatestLocalVersion();
        if (latestLocalVersion == null || !latestLocalVersion.equals(this.mCurrentVersionInfo)) {
            this.mCurrentVersionId = this.mLogStoreManager.saveLocalVersion(this.mCurrentVersionInfo);
        } else {
            this.mCurrentVersionId = latestLocalVersion.id;
        }
        return this.mCurrentVersionId;
    }
}
