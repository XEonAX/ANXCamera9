package bytedance.framwork.core.sdkmonitor;

import android.content.Context;
import android.content.SharedPreferences;
import android.content.SharedPreferences.Editor;
import android.content.pm.PackageInfo;
import android.os.Build;
import android.os.Build.VERSION;
import android.support.annotation.NonNull;
import android.support.annotation.VisibleForTesting;
import android.text.TextUtils;
import android.util.Log;
import bytedance.framwork.core.sdkmonitor.MonitorNetUtil.CompressType;
import com.bytedance.frameworks.baselib.log.LogLib;
import com.bytedance.frameworks.baselib.log.LogLib.ILogDelegate;
import com.bytedance.frameworks.core.monitor.MonitorCommonConstants;
import com.bytedance.frameworks.core.monitor.MonitorManager;
import com.bytedance.frameworks.core.monitor.MonitorManager.IHandleOnTimerEvent;
import com.bytedance.frameworks.core.monitor.config.IMonitorConfigure;
import com.bytedance.frameworks.core.monitor.config.MonitorConfigure;
import com.bytedance.frameworks.core.monitor.model.LocalVersionInfo;
import com.bytedance.frameworks.core.monitor.net.ISendLog;
import com.bytedance.frameworks.core.monitor.net.MonitorLogSender;
import com.bytedance.frameworks.core.monitor.net.NetResponse;
import com.bytedance.frameworks.core.thread.TTExecutor;
import com.bytedance.frameworks.core.thread.TTRunnable;
import com.ss.android.ugc.effectmanager.EffectConfiguration;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import org.json.JSONArray;
import org.json.JSONObject;

public class SDKMonitor implements IHandleOnTimerEvent, IMonitorConfigure, ISendLog {
    private static final int SDK_VERSION = 400;
    private String mAid;
    private volatile JSONObject mAllowService;
    private CacheData mCacheData;
    private HashMap<String, String> mCommonParams;
    private volatile boolean mConfigExit;
    private List<String> mConfigUrls = new ArrayList(Arrays.asList(new String[]{"http://mon.snssdk.com/monitor/appmonitor/v2/settings", "http://monsetting.toutiao.com/monitor/appmonitor/v2/settings"}));
    private Context mContext;
    private volatile long mFetchSettingInterval;
    private IGetCommonParams mGetCommonParams;
    private volatile boolean mHasInit;
    private JSONObject mHeaderInfo;
    private volatile boolean mIsEncrypt = true;
    private volatile long mLastFetchSettingTime = 0;
    private volatile boolean mLogRemoveNet;
    private volatile boolean mLogRemoveSwitch;
    private volatile int mLogSendSwitch = 1;
    private MonitorManager mMonitorManager;
    private volatile long mMonitorMaxRowCount;
    private volatile int mReportCount;
    private volatile int mReportFailBaseTime;
    private volatile int mReportFailRepeatCount;
    private volatile int mReportInterval;
    private List<String> mReportTypeList;
    private volatile List<String> mReportUrlList;
    private volatile long mStopCollectInterval = 0;
    private volatile long mStopCollectLogTime = 0;
    private volatile int mStopIntervalTimes = 0;
    private volatile long mStopMoreChannelInterval;
    private List<String> mUploadTypeListInDefaultReportType;

    public interface IGetCommonParams {
        String getSessionId();
    }

    public void setConfigUrl(List<String> list) {
        try {
            if (!(this.mHasInit || list == null || list.size() <= 0)) {
                this.mConfigUrls.clear();
                this.mConfigUrls.addAll(list);
            }
        } catch (Throwable th) {
            th.printStackTrace();
        }
    }

    protected SDKMonitor(Context context, String str, JSONObject jSONObject, IGetCommonParams iGetCommonParams) {
        this.mAid = str;
        this.mConfigExit = false;
        this.mCacheData = new CacheData();
        init(context, jSONObject, iGetCommonParams);
    }

    public boolean init(@NonNull Context context, @NonNull JSONObject jSONObject, @NonNull IGetCommonParams iGetCommonParams) {
        if (jSONObject == null || jSONObject.length() <= 0) {
            return false;
        }
        initMonitor(context, jSONObject, iGetCommonParams);
        if (this.mConfigExit) {
            this.mCacheData.handleCacheData(this);
        }
        return true;
    }

    private void initMonitor(Context context, JSONObject jSONObject, IGetCommonParams iGetCommonParams) {
        this.mHasInit = true;
        this.mContext = context.getApplicationContext();
        this.mHeaderInfo = jSONObject;
        if (TextUtils.isEmpty(this.mHeaderInfo.optString("package_name"))) {
            try {
                this.mHeaderInfo.put("package_name", context.getPackageName());
            } catch (Exception e) {
            }
        }
        try {
            this.mHeaderInfo.put(MonitorToutiaoConstants.KEY_AID, this.mAid);
            this.mHeaderInfo.put("os", "Android");
            this.mHeaderInfo.put(EffectConfiguration.KEY_DEVICE_PLATFORM, "android");
            this.mHeaderInfo.put("os_version", VERSION.RELEASE);
            this.mHeaderInfo.put("os_api", VERSION.SDK_INT);
            this.mHeaderInfo.put("device_model", Build.MODEL);
            this.mHeaderInfo.put("device_brand", Build.BRAND);
            this.mHeaderInfo.put("device_manufacturer", Build.MANUFACTURER);
            PackageInfo packageInfo = null;
            if (TextUtils.isEmpty(this.mHeaderInfo.optString(DBHelper.COL_VERSION_NAME))) {
                packageInfo = this.mContext.getPackageManager().getPackageInfo(this.mContext.getPackageName(), 1);
                this.mHeaderInfo.put(DBHelper.COL_VERSION_NAME, packageInfo.versionName);
            }
            if (TextUtils.isEmpty(this.mHeaderInfo.optString("version_code"))) {
                this.mHeaderInfo.put("version_code", packageInfo.versionCode);
            }
            this.mGetCommonParams = iGetCommonParams;
            if (this.mGetCommonParams == null) {
                this.mGetCommonParams = new IGetCommonParams() {
                    public String getSessionId() {
                        return null;
                    }
                };
            }
            if (this.mCommonParams == null) {
                this.mCommonParams = new HashMap();
            }
            this.mCommonParams.put(MonitorToutiaoConstants.KEY_AID, this.mAid);
            this.mCommonParams.put("device_id", this.mHeaderInfo.optString("device_id"));
            this.mCommonParams.put(EffectConfiguration.KEY_DEVICE_PLATFORM, "android");
            this.mCommonParams.put("package_name", this.mHeaderInfo.optString("package_name"));
            this.mCommonParams.put("channel", this.mHeaderInfo.optString("channel"));
            this.mCommonParams.put("app_version", this.mHeaderInfo.optString("app_version"));
            MonitorConfigure.setCommonConfig(this.mAid, this);
            MonitorLogSender.setISendLog(this.mAid, this);
            initLogLib();
            this.mMonitorManager = new MonitorManager(context.getApplicationContext(), this, this.mAid);
            initConfig();
            initLocalMonitorLog();
        } catch (Exception e2) {
        }
    }

    private void initConfig() {
        Context context = this.mContext;
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append(MonitorToutiaoConstants.MONITOR_CONFIG);
        stringBuilder.append(this.mAid);
        SharedPreferences sharedPreferences = context.getSharedPreferences(stringBuilder.toString(), 0);
        Object string = sharedPreferences.getString(MonitorToutiaoConstants.MONITOR_NET_CONFIG, null);
        this.mLastFetchSettingTime = sharedPreferences.getLong(MonitorToutiaoConstants.MONITOR_CONFIG_REFRESH_TIME, 0);
        if (!(string == null || TextUtils.isEmpty(string))) {
            try {
                this.mConfigExit = true;
                updateConfig(new JSONObject(string));
            } catch (Exception e) {
                Log.e(MonitorToutiaoConstants.MONITOR_CONFIG, "配置信息读取失败");
            }
        }
        updateConfigFromNet(false);
    }

    @VisibleForTesting
    void updateConfigFromNet(boolean z) {
        if (this.mFetchSettingInterval < 600) {
            this.mFetchSettingInterval = 600;
        }
        if ((z || needUpdateConfigFromNet()) && MonitorNetUtil.isNetworkAvailable(this.mContext)) {
            synchronized (SDKMonitor.class) {
                this.mLastFetchSettingTime = System.currentTimeMillis();
            }
            try {
                TTExecutor.getTTExecutor().executeApiTask(new TTRunnable() {
                    public void run() {
                        try {
                            if (SDKMonitor.this.mGetCommonParams != null) {
                                for (String access$200 : SDKMonitor.this.mConfigUrls) {
                                    String access$2002 = SDKMonitor.this.addParamsToURL(access$2002);
                                    StringBuilder stringBuilder = new StringBuilder();
                                    stringBuilder.append(access$2002);
                                    stringBuilder.append("&encrypt=close");
                                    byte[] request = MonitorNetUtil.getRequest(stringBuilder.toString(), null, SDKMonitor.this.mIsEncrypt);
                                    if (request != null) {
                                        SDKMonitor.this.updateToSP(new JSONObject(new String(request)));
                                        return;
                                    }
                                    return;
                                }
                            }
                        } catch (Throwable th) {
                            if (!SDKMonitor.this.mConfigExit) {
                                SDKMonitor.this.mConfigExit = true;
                                SDKMonitor.this.mCacheData.handleCacheData(SDKMonitor.this);
                            }
                            th.printStackTrace();
                        }
                    }
                });
            } catch (Throwable th) {
            }
        }
    }

    private boolean needUpdateConfigFromNet() {
        return (System.currentTimeMillis() - this.mLastFetchSettingTime) / 1000 > this.mFetchSettingInterval;
    }

    private void updateToSP(JSONObject jSONObject) {
        if (jSONObject != null && jSONObject.length() > 0) {
            try {
                updateConfig(jSONObject.getJSONObject("data"));
                Context context = this.mContext;
                StringBuilder stringBuilder = new StringBuilder();
                stringBuilder.append(MonitorToutiaoConstants.MONITOR_CONFIG);
                stringBuilder.append(this.mAid);
                Editor edit = context.getSharedPreferences(stringBuilder.toString(), 0).edit();
                edit.putLong(MonitorToutiaoConstants.MONITOR_CONFIG_REFRESH_TIME, System.currentTimeMillis());
                edit.putString(MonitorToutiaoConstants.MONITOR_NET_CONFIG, jSONObject.getJSONObject("data").toString());
                edit.apply();
                if (!this.mConfigExit) {
                    this.mConfigExit = true;
                    this.mCacheData.handleCacheData(this);
                }
            } catch (Throwable th) {
            }
        }
    }

    /* JADX WARNING: Missing block: B:31:0x00bd, code:
            return;
     */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    synchronized void updateConfig(JSONObject jSONObject) {
        if (jSONObject != null) {
            if (jSONObject.length() > 0) {
                List arrayList = new ArrayList();
                try {
                    JSONArray optJSONArray = jSONObject.optJSONArray("report_host_new");
                    if (optJSONArray != null && optJSONArray.length() > 0) {
                        int length = optJSONArray.length();
                        for (int i = 0; i < length; i++) {
                            Object string = optJSONArray.getString(i);
                            if (!TextUtils.isEmpty(string) && string.indexOf(46) > 0) {
                                arrayList.add(string);
                            }
                        }
                    }
                } catch (Exception e) {
                }
                if (arrayList.isEmpty()) {
                    this.mReportUrlList = null;
                } else {
                    this.mReportUrlList = arrayList;
                }
                this.mFetchSettingInterval = jSONObject.optLong("fetch_setting_interval", MonitorToutiaoConstants.FETCH_SETTING_INTERVAL);
                this.mReportInterval = jSONObject.optInt("polling_interval", 120);
                this.mReportCount = jSONObject.optInt("once_max_count", 100);
                this.mReportFailRepeatCount = jSONObject.optInt("max_retry_count", 4);
                this.mReportFailBaseTime = jSONObject.optInt("report_fail_base_time", 15);
                this.mLogSendSwitch = jSONObject.optInt("log_send_switch", 1);
                this.mStopMoreChannelInterval = jSONObject.optLong("more_channel_stop_interval", MonitorToutiaoConstants.STOP_MORE_CHANNEL_INTERVAL);
                this.mLogRemoveSwitch = jSONObject.optBoolean("log_remvove_switch", false);
                this.mAllowService = jSONObject.optJSONObject("allow_service_name");
                this.mIsEncrypt = jSONObject.optBoolean("monitor_encrypt_switch", true);
                this.mMonitorMaxRowCount = jSONObject.optLong("monitor_log_max_save_count", 40000);
                if (this.mMonitorManager != null) {
                    this.mMonitorManager.updateConfig();
                }
            }
        }
        this.mReportUrlList = null;
    }

    private void initLocalMonitorLog() {
        if (this.mMonitorManager != null) {
            try {
                this.mMonitorManager.setCurrentVersionInfo(new LocalVersionInfo(this.mHeaderInfo.optString("version_code"), this.mHeaderInfo.optString(DBHelper.COL_VERSION_NAME), this.mHeaderInfo.optString(DBHelper.COL_MANIFEST_VERSION_CODE), this.mHeaderInfo.optString(DBHelper.COL_UPDATE_VERSION_CODE)));
            } catch (Exception e) {
            }
        }
    }

    public MonitorManager getMonitorManager() {
        return this.mMonitorManager;
    }

    boolean getServiceSwitch(String str) {
        boolean z = false;
        if (this.mAllowService == null || TextUtils.isEmpty(str)) {
            return false;
        }
        if (this.mAllowService.opt(str) != null) {
            z = true;
        }
        return z;
    }

    boolean getLogSendSwitch() {
        return this.mLogSendSwitch == 1;
    }

    public int getNetWorkType() {
        return MonitorNetUtil.getNetworkType(this.mContext.getApplicationContext()).getValue();
    }

    public void handleEvent() {
        if (System.currentTimeMillis() - this.mStopCollectLogTime > this.mStopCollectInterval) {
            this.mLogRemoveNet = false;
            if (this.mMonitorManager != null) {
                this.mMonitorManager.setReportLogSwitch(getLogSendSwitch());
            }
        }
        if (this.mFetchSettingInterval > 0) {
            updateConfigFromNet(false);
        }
    }

    public boolean isLogSendSwitch() {
        return this.mLogSendSwitch == 1;
    }

    public int reportInterval() {
        if (this.mReportInterval <= 0) {
            return 120;
        }
        return this.mReportInterval;
    }

    public int reportCount() {
        if (this.mReportCount <= 0) {
            return 100;
        }
        return this.mReportCount;
    }

    public List<String> reportUrl(String str) {
        if (!TextUtils.isEmpty(str) && !TextUtils.equals(str, "monitor")) {
            return Collections.emptyList();
        }
        if (this.mReportUrlList == null || this.mReportUrlList.isEmpty()) {
            this.mReportUrlList = Arrays.asList(new String[]{"http://mon.snssdk.com/monitor/collect/", "http://mon.toutiao.com/monitor/collect/", "http://mon.toutiaocloud.com/monitor/collect/", "http://mon.toutiaocloud.net/monitor/collect/"});
        }
        return this.mReportUrlList;
    }

    public List<String> getReportTypeList() {
        if (this.mReportTypeList == null) {
            this.mReportTypeList = Arrays.asList(new String[]{"monitor"});
        }
        return this.mReportTypeList;
    }

    public List<String> getUploadTypeByReportType(String str) {
        if (!TextUtils.isEmpty(str) && !TextUtils.equals(str, "monitor")) {
            return null;
        }
        if (this.mUploadTypeListInDefaultReportType == null) {
            this.mUploadTypeListInDefaultReportType = Arrays.asList(new String[]{MonitorToutiaoConstants.MONITOR_TYPE_SERVICE_MONITOR});
        }
        return this.mUploadTypeListInDefaultReportType;
    }

    public String getReportTypeByUploadType(String str) {
        return "monitor";
    }

    public long getMonitorLogMaxSaveCount() {
        return this.mMonitorMaxRowCount;
    }

    public JSONObject reportJsonHeaderInfo() {
        return this.mHeaderInfo;
    }

    public int reportFailRepeatCount() {
        if (this.mReportFailRepeatCount <= 0) {
            return 4;
        }
        return this.mReportFailRepeatCount;
    }

    public int reportFailRepeatBaseTime() {
        if (this.mReportFailBaseTime <= 0) {
            return 15;
        }
        return this.mReportFailBaseTime;
    }

    public long stopMoreChannelInterval() {
        if (this.mStopMoreChannelInterval == 0) {
            return MonitorCommonConstants.LAST_STOP_INTERVAL;
        }
        return this.mStopMoreChannelInterval * 1000;
    }

    public boolean getRemoveSwitch() {
        return this.mLogRemoveNet ? this.mLogRemoveNet : this.mLogRemoveSwitch;
    }

    public NetResponse sendLog(long j, String str, byte[] bArr, int i, String str2) {
        JSONObject jSONObject;
        NetResponse netResponse = new NetResponse();
        try {
            byte[] excutePost;
            String addParamsToURL = addParamsToURL(str);
            if (i == 1) {
                excutePost = MonitorNetUtil.excutePost(j, addParamsToURL, bArr, CompressType.GZIP, str2, this.mIsEncrypt);
            } else {
                excutePost = MonitorNetUtil.excutePost(j, addParamsToURL, bArr, CompressType.NONE, str2, this.mIsEncrypt);
            }
            this.mStopIntervalTimes = 0;
            this.mStopCollectInterval = 0;
            netResponse.stateCode = 200;
            jSONObject = new JSONObject(new String(excutePost));
            handleResponseResult(jSONObject);
        } catch (Throwable th) {
            if (th instanceof HttpResponseException) {
                netResponse.stateCode = ((HttpResponseException) th).getStatusCode();
            } else {
                netResponse.stateCode = -1;
            }
            if (netResponse.stateCode == 503 || netResponse.stateCode == 509) {
                StringBuilder stringBuilder = new StringBuilder();
                stringBuilder.append("response code ");
                stringBuilder.append(netResponse.stateCode);
                Log.e("monitor_response_code", stringBuilder.toString());
                this.mLogRemoveNet = true;
                this.mStopCollectLogTime = System.currentTimeMillis();
                if (this.mMonitorManager != null) {
                    this.mMonitorManager.setReportLogSwitch(false);
                }
                if (this.mStopIntervalTimes == 0) {
                    this.mStopCollectInterval = MonitorCommonConstants.SECOND_STOP_INTERVAL;
                } else if (this.mStopIntervalTimes == 1) {
                    this.mStopCollectInterval = MonitorCommonConstants.THIRD_STOP_INTERVAL;
                } else {
                    this.mStopCollectInterval = MonitorCommonConstants.LAST_STOP_INTERVAL;
                }
                this.mStopIntervalTimes++;
            }
            return netResponse;
        }
        netResponse.responseMsg = jSONObject;
        return netResponse;
    }

    private void handleResponseResult(JSONObject jSONObject) {
    }

    private String addParamsToURL(String str) {
        if (TextUtils.isDigitsOnly(str) || this.mCommonParams == null) {
            return str;
        }
        StringBuilder stringBuilder;
        if (str.indexOf("?") < 0) {
            stringBuilder = new StringBuilder();
            stringBuilder.append(str);
            stringBuilder.append("?");
            str = stringBuilder.toString();
        }
        if (str.endsWith("?")) {
            stringBuilder = new StringBuilder();
            stringBuilder.append(str);
            stringBuilder.append(encode(EffectConfiguration.KEY_SDK_VERSION, "UTF-8"));
            stringBuilder.append("=");
            stringBuilder.append(encode(String.valueOf(400), "UTF-8"));
            str = stringBuilder.toString();
        } else {
            stringBuilder = new StringBuilder();
            stringBuilder.append(str);
            stringBuilder.append("&");
            stringBuilder.append(encode(EffectConfiguration.KEY_SDK_VERSION, "UTF-8"));
            stringBuilder.append("=");
            stringBuilder.append(encode(String.valueOf(400), "UTF-8"));
            str = stringBuilder.toString();
        }
        Map map = this.mCommonParams;
        if (map != null && map.size() > 0) {
            for (Entry entry : map.entrySet()) {
                if (map.get(entry.getKey()) != null) {
                    StringBuilder stringBuilder2;
                    if (str.endsWith("?")) {
                        stringBuilder2 = new StringBuilder();
                        stringBuilder2.append(str);
                        stringBuilder2.append(encode(entry.getKey().toString(), "UTF-8"));
                        stringBuilder2.append("=");
                        stringBuilder2.append(encode(((String) map.get(entry.getKey())).toString(), "UTF-8"));
                        str = stringBuilder2.toString();
                    } else {
                        stringBuilder2 = new StringBuilder();
                        stringBuilder2.append(str);
                        stringBuilder2.append("&");
                        stringBuilder2.append(encode(entry.getKey().toString(), "UTF-8"));
                        stringBuilder2.append("=");
                        stringBuilder2.append(encode(((String) map.get(entry.getKey())).toString(), "UTF-8"));
                        str = stringBuilder2.toString();
                    }
                }
            }
        }
        return str;
    }

    private static String encode(String str, String str2) {
        if (str2 == null) {
            try {
                str2 = "UTF-8";
            } catch (Throwable e) {
                throw new IllegalArgumentException(e);
            }
        }
        return URLEncoder.encode(str, str2);
    }

    private void initLogLib() {
        LogLib.init(new ILogDelegate() {
            public boolean isNetworkAvailable(Context context) {
                return MonitorNetUtil.isNetworkAvailable(context);
            }
        });
    }

    private String getSessionId() {
        if (this.mGetCommonParams != null) {
            return this.mGetCommonParams.getSessionId();
        }
        return null;
    }

    public void monitorStatusAndDuration(String str, int i, JSONObject jSONObject, JSONObject jSONObject2) {
        try {
            if (this.mConfigExit) {
                monitorService(str, i, jSONObject, jSONObject2);
            } else {
                this.mCacheData.insertServiceMonitorData(new SerViceMonitorData(str, i, jSONObject, jSONObject2));
            }
        } catch (Throwable th) {
        }
    }

    public void monitorStatusRate(String str, int i, JSONObject jSONObject) {
        monitorStatusAndDuration(str, i, null, jSONObject);
    }

    public void monitorDuration(String str, JSONObject jSONObject, JSONObject jSONObject2) {
        monitorStatusAndDuration(str, 0, jSONObject, jSONObject2);
    }

    private void monitorService(String str, int i, JSONObject jSONObject, JSONObject jSONObject2) {
        if (jSONObject2 == null) {
            try {
                jSONObject2 = new JSONObject();
            } catch (Throwable th) {
                return;
            }
        }
        jSONObject2.put("log_type", MonitorToutiaoConstants.MONITOR_TYPE_SERVICE_MONITOR);
        jSONObject2.put("service", str);
        jSONObject2.put("status", i);
        jSONObject2.put("network_type", getNetWorkType());
        jSONObject2.put("value", jSONObject);
        jSONObject2.put("timestamp", System.currentTimeMillis());
        if (!TextUtils.isEmpty(getSessionId())) {
            jSONObject2.put("session_id", getSessionId());
        }
        if (getMonitorManager() != null && getServiceSwitch(str)) {
            getMonitorManager().logSend(MonitorToutiaoConstants.MONITOR_TYPE_SERVICE_MONITOR, jSONObject2.toString(), true);
        }
    }
}
