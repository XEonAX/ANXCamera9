package com.bytedance.frameworks.baselib.log;

import android.content.Context;
import android.text.TextUtils;
import java.util.List;

public abstract class LogHandler {
    protected IConfig mConfig;
    private long mLastStopTime;
    private String mLastSuccessChannel;
    protected LogQueue mLogQueue;
    private IResponseConfig mResponseConfig;
    private long mStopMoreChannelInterval;
    protected String mType;

    public interface IConfig {
        List<String> getChannels();

        long getLogExpireTime();

        String getLogType();

        int getMaxRetryCount();

        long getRetryInterval();
    }

    public static abstract class BaseConfig implements IConfig {
        public int getMaxRetryCount() {
            return 4;
        }

        public long getRetryInterval() {
            return 15000;
        }

        public long getLogExpireTime() {
            return 604800000;
        }
    }

    public interface IResponseConfig {
        boolean getMoreChannelSwitch();

        boolean getRemoveSwitch();

        int getStatusCode();

        long getStopInterval();

        long getStopMoreChannelInterval();
    }

    protected abstract boolean send(String str, byte[] bArr);

    public long getLastStopTime() {
        return this.mLastStopTime;
    }

    public void setLastStopTime(long j) {
        this.mLastStopTime = j;
    }

    public long getStopMoreChannelInterval() {
        return this.mStopMoreChannelInterval;
    }

    public void setStopMoreChannelInterval(long j) {
        this.mStopMoreChannelInterval = j;
    }

    public LogHandler(Context context, IConfig iConfig) {
        this.mConfig = iConfig;
        if (this.mConfig != null) {
            this.mType = iConfig.getLogType();
            if (TextUtils.isEmpty(this.mType)) {
                throw new IllegalArgumentException("type is empty.");
            }
            this.mLogQueue = LogQueue.getInstance(context);
            this.mLogQueue.registerLogHandler(this.mType, this);
            return;
        }
        throw new IllegalArgumentException("config is null.");
    }

    public LogHandler(Context context, IConfig iConfig, IResponseConfig iResponseConfig) {
        this.mConfig = iConfig;
        this.mResponseConfig = iResponseConfig;
        if (this.mConfig == null) {
            throw new IllegalArgumentException("config is null.");
        } else if (this.mResponseConfig != null) {
            this.mType = iConfig.getLogType();
            if (TextUtils.isEmpty(this.mType)) {
                throw new IllegalArgumentException("type is empty.");
            }
            this.mLogQueue = LogQueue.getInstance(context);
            this.mLogQueue.registerLogHandler(this.mType, this);
        } else {
            throw new IllegalArgumentException("responseConfig is null");
        }
    }

    public boolean enqueue(String str) {
        return enqueue(LogLib.safeGetBytes(str));
    }

    public boolean enqueue(byte[] bArr) {
        return this.mLogQueue.enqueue(this.mType, bArr);
    }

    public void updateConfig(IConfig iConfig) {
        if (iConfig != null) {
            this.mConfig = iConfig;
        }
    }

    protected void onLogSent(byte[] bArr, boolean z) {
    }

    String getType() {
        return this.mType;
    }

    IConfig getConfig() {
        return this.mConfig;
    }

    IResponseConfig getResponseConfig() {
        return this.mResponseConfig;
    }

    String getLastSuccessChannel() {
        return this.mLastSuccessChannel;
    }

    void setLastSuccessChannel(String str) {
        this.mLastSuccessChannel = str;
    }
}
