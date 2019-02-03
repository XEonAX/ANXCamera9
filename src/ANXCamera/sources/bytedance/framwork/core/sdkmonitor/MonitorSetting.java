package bytedance.framwork.core.sdkmonitor;

import java.util.List;
import org.json.JSONObject;

public class MonitorSetting {
    public JSONObject mAllowLogType;
    public JSONObject mAllowService;
    public long mFetchSettingInterval;
    public boolean mIsEncrypt;
    public long mLastFetchSettingTime = 0;
    public boolean mLogRemoveSwitch;
    public int mLogSendSwitch;
    public JSONObject mMetricType;
    public int mMonitorMaxRowCount;
    public int mReportCount;
    public int mReportFailBaseTime;
    public int mReportFailRepeatCount;
    public int mReportInterval;
    public List<String> mReportUrlList;
    public long mStopMoreChannelInterval;

    public MonitorSetting(long j, long j2, int i, int i2, int i3, int i4, JSONObject jSONObject, JSONObject jSONObject2, JSONObject jSONObject3, List<String> list, int i5, long j3, boolean z, boolean z2, int i6) {
        this.mLastFetchSettingTime = j;
        this.mFetchSettingInterval = j2;
        this.mReportInterval = i;
        this.mReportCount = i2;
        this.mReportFailRepeatCount = i3;
        this.mReportFailBaseTime = i4;
        this.mAllowLogType = jSONObject;
        this.mMetricType = jSONObject2;
        this.mAllowService = jSONObject3;
        this.mReportUrlList = list;
        this.mLogSendSwitch = i5;
        this.mStopMoreChannelInterval = j3;
        this.mLogRemoveSwitch = z;
        this.mIsEncrypt = z2;
        this.mMonitorMaxRowCount = i6;
    }
}
