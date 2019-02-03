package bytedance.framwork.core.sdkmonitor;

import java.util.List;
import org.json.JSONObject;

public class MonitorSettingBuilder {
    private JSONObject mAllowLogType;
    private JSONObject mAllowService;
    private long mFetchSettingInterval;
    private boolean mIsEncrypt;
    private long mLastFetchSettingTime;
    private boolean mLogRemoveSwitch;
    private int mLogSendSwitch;
    private JSONObject mMetricType;
    private int mMonitorMaxRowCount;
    private int mReportCount;
    private int mReportFailBaseTime;
    private int mReportFailRepeatCount;
    private int mReportInterval;
    private List<String> mReportUrlList;
    private long mStopMoreChannelInterval;

    public MonitorSettingBuilder setLastFetchSettingTime(long j) {
        this.mLastFetchSettingTime = j;
        return this;
    }

    public MonitorSettingBuilder setFetchSettingInterval(long j) {
        this.mFetchSettingInterval = j;
        return this;
    }

    public MonitorSettingBuilder setReportInterval(int i) {
        this.mReportInterval = i;
        return this;
    }

    public MonitorSettingBuilder setReportCount(int i) {
        this.mReportCount = i;
        return this;
    }

    public MonitorSettingBuilder setReportFailRepeatCount(int i) {
        this.mReportFailRepeatCount = i;
        return this;
    }

    public MonitorSettingBuilder setReportFailBaseTime(int i) {
        this.mReportFailBaseTime = i;
        return this;
    }

    public MonitorSettingBuilder setAllowLogType(JSONObject jSONObject) {
        this.mAllowLogType = jSONObject;
        return this;
    }

    public MonitorSettingBuilder setMetricType(JSONObject jSONObject) {
        this.mMetricType = jSONObject;
        return this;
    }

    public MonitorSettingBuilder setAllowService(JSONObject jSONObject) {
        this.mAllowService = jSONObject;
        return this;
    }

    public MonitorSettingBuilder setReportUrlList(List<String> list) {
        this.mReportUrlList = list;
        return this;
    }

    public MonitorSettingBuilder setLogSendSwitch(int i) {
        this.mLogSendSwitch = i;
        return this;
    }

    public MonitorSettingBuilder setStopMoreChannelInterval(long j) {
        this.mStopMoreChannelInterval = j;
        return this;
    }

    public MonitorSettingBuilder setLogRemoveSwitch(boolean z) {
        this.mLogRemoveSwitch = z;
        return this;
    }

    public MonitorSettingBuilder setIsEncrypt(boolean z) {
        this.mIsEncrypt = z;
        return this;
    }

    public MonitorSettingBuilder setMonitorMaxRowCount(int i) {
        this.mMonitorMaxRowCount = i;
        return this;
    }

    public MonitorSetting createMonitorSetting() {
        long j = this.mLastFetchSettingTime;
        long j2 = this.mFetchSettingInterval;
        int i = this.mReportInterval;
        int i2 = this.mReportCount;
        int i3 = this.mReportFailRepeatCount;
        int i4 = this.mReportFailBaseTime;
        JSONObject jSONObject = this.mAllowLogType;
        JSONObject jSONObject2 = this.mMetricType;
        JSONObject jSONObject3 = this.mAllowService;
        List list = this.mReportUrlList;
        int i5 = this.mLogSendSwitch;
        long j3 = this.mStopMoreChannelInterval;
        boolean z = this.mLogRemoveSwitch;
        boolean z2 = z;
        return new MonitorSetting(j, j2, i, i2, i3, i4, jSONObject, jSONObject2, jSONObject3, list, i5, j3, z2, this.mIsEncrypt, this.mMonitorMaxRowCount);
    }
}
