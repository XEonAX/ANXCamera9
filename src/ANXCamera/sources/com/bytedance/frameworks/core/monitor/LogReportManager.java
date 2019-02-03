package com.bytedance.frameworks.core.monitor;

import android.content.Context;
import android.text.TextUtils;
import android.util.Log;
import com.bytedance.frameworks.core.monitor.config.MonitorConfigure;
import com.bytedance.frameworks.core.monitor.model.LocalLog;
import com.bytedance.frameworks.core.monitor.model.LocalVersionInfo;
import com.bytedance.frameworks.core.monitor.model.UploadLogLegacyCommand;
import com.bytedance.frameworks.core.monitor.net.DefaultLogSendImpl;
import com.bytedance.frameworks.core.monitor.net.MonitorLogSender;
import com.bytedance.frameworks.core.monitor.util.JsonUtil;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map.Entry;
import org.json.JSONArray;
import org.json.JSONObject;

public class LogReportManager {
    private static final String TAG = "LogReportManager";
    private String mAid;
    private volatile boolean mCollectLogSwitch = true;
    private JSONObject mHeaderInfo;
    private int mInterval = 120;
    private long mLastPackTime = 0;
    private LogStoreManager mLogStoreManager;
    private int mReportCount = 100;

    protected LogReportManager(Context context, String str, LogStoreManager logStoreManager) {
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("LogReportManager: ");
        stringBuilder.append(logStoreManager.getAid());
        stringBuilder.append(" , threadName: ");
        stringBuilder.append(Thread.currentThread().getName());
        Log.d("monitorlib", stringBuilder.toString());
        this.mAid = str;
        this.mLogStoreManager = logStoreManager;
        MonitorLogSender.setImpl(str, "monitor", new DefaultLogSendImpl(context, str, "monitor"));
    }

    private LogStoreManager getLocalStore() {
        return this.mLogStoreManager;
    }

    protected void packAndSendLog() {
        if (this.mCollectLogSwitch) {
            long currentTimeMillis = System.currentTimeMillis();
            if (getLocalStore().getLogSampledCount() > ((long) this.mReportCount) || (currentTimeMillis - this.mLastPackTime) / 1000 > ((long) this.mInterval)) {
                this.mLastPackTime = currentTimeMillis;
                List<String> reportTypeList = MonitorConfigure.getReportTypeList(this.mAid);
                if (reportTypeList != null) {
                    for (String str : reportTypeList) {
                        packOneReportType(str, MonitorConfigure.getUploadTypeByReportType(this.mAid, str), 100);
                    }
                }
            }
        }
    }

    /* JADX WARNING: Removed duplicated region for block: B:37:0x00bf A:{Catch:{ Exception -> 0x00d1 }} */
    /* JADX WARNING: Removed duplicated region for block: B:39:0x00c6 A:{Catch:{ Exception -> 0x00d1 }} */
    /* JADX WARNING: Removed duplicated region for block: B:38:0x00c2 A:{Catch:{ Exception -> 0x00d1 }} */
    /* JADX WARNING: Removed duplicated region for block: B:37:0x00bf A:{Catch:{ Exception -> 0x00d1 }} */
    /* JADX WARNING: Removed duplicated region for block: B:39:0x00c6 A:{Catch:{ Exception -> 0x00d1 }} */
    /* JADX WARNING: Removed duplicated region for block: B:38:0x00c2 A:{Catch:{ Exception -> 0x00d1 }} */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    public void packOneReportType(String str, List<String> list, int i) {
        List<LocalLog> logSampled = getLocalStore().getLogSampled(list, i);
        if (logSampled != null && logSampled.size() > 0) {
            try {
                JSONArray jSONArray = new JSONArray();
                JSONArray jSONArray2 = new JSONArray();
                JSONArray jSONArray3 = new JSONArray();
                StringBuilder stringBuilder = new StringBuilder();
                long j = -1;
                Object obj = null;
                JSONArray jSONArray4 = jSONArray;
                JSONArray jSONArray5 = jSONArray2;
                JSONArray jSONArray6 = jSONArray3;
                long j2 = -1;
                int i2 = 0;
                Object obj2 = 1;
                for (LocalLog localLog : logSampled) {
                    Object obj3;
                    long j3;
                    if (j2 == j) {
                        obj3 = obj2;
                        j2 = localLog.versionId;
                    } else {
                        if (localLog.versionId != j2) {
                            obj2 = (!sendLog(str, jSONArray4, jSONArray5, jSONArray6, j2, false) || obj2 == null) ? null : 1;
                            j3 = localLog.versionId;
                            jSONArray3 = new JSONArray();
                            jSONArray4 = new JSONArray();
                            j2 = j3;
                            jSONArray6 = new JSONArray();
                            jSONArray5 = jSONArray4;
                            jSONArray4 = jSONArray3;
                        }
                        obj3 = obj2;
                    }
                    j3 = localLog.id;
                    String str2 = localLog.type;
                    String str3 = localLog.data;
                    if (i2 == 0) {
                        stringBuilder.append(j3);
                    } else {
                        stringBuilder.append(",");
                        stringBuilder.append(j3);
                    }
                    try {
                        Object obj4;
                        JSONObject jSONObject = new JSONObject(str3);
                        int hashCode = str2.hashCode();
                        if (hashCode != 94851343) {
                            if (hashCode == 110364485 && str2.equals(MonitorCommonConstants.TIMER_TYPE)) {
                                obj4 = 1;
                                switch (obj4) {
                                    case null:
                                        jSONArray5.put(jSONObject);
                                        break;
                                    case 1:
                                        jSONArray6.put(jSONObject);
                                        break;
                                    default:
                                        jSONObject.put("log_id", j3);
                                        jSONArray4.put(jSONObject);
                                        break;
                                }
                                i2++;
                                obj2 = obj3;
                                j = -1;
                            }
                        } else if (str2.equals(MonitorCommonConstants.COUNT_TYPE)) {
                            obj4 = null;
                            switch (obj4) {
                                case null:
                                    break;
                                case 1:
                                    break;
                                default:
                                    break;
                            }
                            i2++;
                            obj2 = obj3;
                            j = -1;
                        }
                        obj4 = -1;
                        switch (obj4) {
                            case null:
                                break;
                            case 1:
                                break;
                            default:
                                break;
                        }
                    } catch (Exception e) {
                    }
                    i2++;
                    obj2 = obj3;
                    j = -1;
                }
                if (sendLog(str, jSONArray4, jSONArray5, jSONArray6, j2, false) && obj2 != null) {
                    obj = 1;
                }
                if (obj != null) {
                    getLocalStore().deleteLocalLogByIds(stringBuilder.toString());
                }
            } catch (Throwable e2) {
                String str4 = TAG;
                StringBuilder stringBuilder2 = new StringBuilder();
                stringBuilder2.append("json resolve failed:");
                stringBuilder2.append(Log.getStackTraceString(e2));
                Log.e(str4, stringBuilder2.toString());
            }
        }
    }

    private boolean sendLog(String str, JSONArray jSONArray, JSONArray jSONArray2, JSONArray jSONArray3, long j, boolean z) {
        try {
            JSONObject jSONObject = new JSONObject();
            if (JsonUtil.hasData(jSONArray)) {
                jSONObject.put("data", jSONArray);
            }
            if (JsonUtil.hasData(jSONArray2)) {
                jSONObject.put(MonitorCommonConstants.COUNT_TYPE, jSONArray2);
            }
            if (JsonUtil.hasData(jSONArray3)) {
                jSONObject.put(MonitorCommonConstants.TIMER_TYPE, jSONArray3);
            }
            if (!JsonUtil.hasData(jSONObject) || this.mHeaderInfo == null) {
                return true;
            }
            JSONObject jSONObject2 = new JSONObject(this.mHeaderInfo.toString());
            LocalVersionInfo localVersionById = getLocalStore().getLocalVersionById(j);
            if (localVersionById != null) {
                if (!TextUtils.isEmpty(localVersionById.versionCode)) {
                    jSONObject2.put("version_code", localVersionById.versionCode);
                }
                if (!TextUtils.isEmpty(localVersionById.versionName)) {
                    jSONObject2.put(DBHelper.COL_VERSION_NAME, localVersionById.versionName);
                }
                if (!TextUtils.isEmpty(localVersionById.manifestVersionCode)) {
                    jSONObject2.put(DBHelper.COL_MANIFEST_VERSION_CODE, localVersionById.manifestVersionCode);
                }
                if (!TextUtils.isEmpty(localVersionById.updateVersionCode)) {
                    jSONObject2.put(DBHelper.COL_UPDATE_VERSION_CODE, localVersionById.updateVersionCode);
                }
            }
            jSONObject2.put("debug_fetch", z);
            jSONObject.put("header", jSONObject2);
            return MonitorLogSender.send(this.mAid, str, jSONObject.toString());
        } catch (Throwable th) {
            return false;
        }
    }

    public void uploadLegacyLog(UploadLogLegacyCommand uploadLogLegacyCommand) {
        UploadLogLegacyCommand uploadLogLegacyCommand2 = uploadLogLegacyCommand;
        try {
            long j = uploadLogLegacyCommand2.startTime;
            long j2 = uploadLogLegacyCommand2.endTime;
            List<String> uploadTypeList = uploadLogLegacyCommand.getUploadTypeList();
            HashMap hashMap = new HashMap();
            if (uploadTypeList == null || uploadTypeList.size() == 0) {
                uploadTypeList = MonitorConfigure.getReportTypeList(this.mAid);
                if (uploadTypeList != null) {
                    for (String str : uploadTypeList) {
                        hashMap.put(str, MonitorConfigure.getUploadTypeByReportType(this.mAid, str));
                    }
                } else {
                    return;
                }
            }
            for (String str2 : uploadTypeList) {
                CharSequence reportTypeByUploadType = MonitorConfigure.getReportTypeByUploadType(this.mAid, str2);
                if (!TextUtils.isEmpty(reportTypeByUploadType)) {
                    List list;
                    if (hashMap.containsKey(reportTypeByUploadType)) {
                        list = (List) hashMap.get(reportTypeByUploadType);
                        list.add(str2);
                        hashMap.put(reportTypeByUploadType, list);
                    } else {
                        list = new ArrayList();
                        list.add(str2);
                        hashMap.put(reportTypeByUploadType, list);
                    }
                }
            }
            Object obj = 1;
            int i = 0;
            Object obj2 = null;
            for (Entry entry : hashMap.entrySet()) {
                long j3;
                List list2 = (List) entry.getValue();
                String str3 = (String) entry.getKey();
                int i2 = i;
                Object obj3 = obj2;
                Object obj4 = obj;
                while (true) {
                    LogStoreManager localStore = getLocalStore();
                    StringBuilder stringBuilder = new StringBuilder();
                    stringBuilder.append(i2);
                    stringBuilder.append(",");
                    stringBuilder.append(MonitorCommonConstants.MAX_COUNT_UPLOAD_SINGLE_TIME);
                    String stringBuilder2 = stringBuilder.toString();
                    int i3 = MonitorCommonConstants.MAX_COUNT_UPLOAD_SINGLE_TIME;
                    List localLog = localStore.getLocalLog(j, j2, list2, stringBuilder2);
                    if (localLog == null || localLog.size() <= 0) {
                        j3 = j;
                        i2 = i2;
                        i = 0;
                    } else {
                        StringBuilder stringBuilder3;
                        int i4;
                        int size = localLog.size();
                        JSONArray jSONArray = new JSONArray();
                        Iterator it = localLog.iterator();
                        StringBuilder stringBuilder4 = new StringBuilder();
                        JSONArray jSONArray2 = jSONArray;
                        Object obj5 = obj4;
                        long j4 = -1;
                        int i5 = 0;
                        while (it.hasNext()) {
                            Iterator it2;
                            try {
                                JSONArray jSONArray3;
                                LocalLog localLog2 = (LocalLog) it.next();
                                if (j4 == -1) {
                                    j4 = localLog2.versionId;
                                    stringBuilder3 = stringBuilder4;
                                    it2 = it;
                                    j3 = j;
                                    jSONArray3 = jSONArray2;
                                    i4 = i2;
                                } else if (localLog2.versionId != j4) {
                                    stringBuilder3 = stringBuilder4;
                                    it2 = it;
                                    j3 = j;
                                    i4 = i2;
                                    try {
                                        obj2 = (!sendLog(str3, jSONArray2, null, null, j4, true) || obj5 == null) ? null : 1;
                                        try {
                                            long j5 = localLog2.versionId;
                                            try {
                                                jSONArray3 = new JSONArray();
                                                obj5 = obj2;
                                                j4 = j5;
                                            } catch (Exception e) {
                                                obj5 = obj2;
                                                j4 = j5;
                                            }
                                        } catch (Exception e2) {
                                            obj5 = obj2;
                                        }
                                    } catch (Exception e3) {
                                    }
                                } else {
                                    stringBuilder3 = stringBuilder4;
                                    it2 = it;
                                    j3 = j;
                                    i4 = i2;
                                    jSONArray3 = jSONArray2;
                                }
                                try {
                                    long j6 = localLog2.id;
                                    if (i5 == 0) {
                                        stringBuilder3.append(j6);
                                    } else {
                                        stringBuilder3.append(",");
                                        stringBuilder3.append(j6);
                                    }
                                    i5++;
                                    jSONArray3.put(new JSONObject(localLog2.data));
                                    jSONArray2 = jSONArray3;
                                } catch (Exception e4) {
                                    jSONArray2 = jSONArray3;
                                }
                            } catch (Exception e5) {
                                stringBuilder3 = stringBuilder4;
                                it2 = it;
                                j3 = j;
                                i4 = i2;
                            }
                            i2 = i4;
                            stringBuilder4 = stringBuilder3;
                            it = it2;
                            j = j3;
                        }
                        stringBuilder3 = stringBuilder4;
                        j3 = j;
                        i4 = i2;
                        Object obj6 = (!sendLog(str3, jSONArray2, null, null, j4, true) || obj5 == null) ? null : 1;
                        if (obj6 != null) {
                            if (getLocalStore().deleteLocalLogByIds(stringBuilder3.toString()) <= 0) {
                                obj3 = 1;
                            }
                        } else {
                            obj3 = 1;
                        }
                        if (obj3 != null) {
                            i2 = i4 + MonitorCommonConstants.MAX_COUNT_UPLOAD_SINGLE_TIME;
                            obj4 = obj6;
                        } else {
                            obj4 = obj6;
                            i2 = i4;
                        }
                        i = size;
                    }
                    if (i != 400) {
                        break;
                    }
                    j = j3;
                }
                obj = obj4;
                i = i2;
                obj2 = obj3;
                j = j3;
            }
        } catch (Throwable th) {
            th.printStackTrace();
        }
    }

    protected void updateConfig() {
        setReportInterval(MonitorConfigure.getReportInterval(this.mAid));
        setReportCount(MonitorConfigure.getReportCount(this.mAid));
        setHeaderInfo(MonitorConfigure.getReportJsonHeaderInfo(this.mAid));
    }

    private void setReportInterval(int i) {
        if (i > 0) {
            this.mInterval = i;
        }
    }

    private void setReportCount(int i) {
        if (i > 0) {
            this.mReportCount = i;
        }
    }

    private void setHeaderInfo(JSONObject jSONObject) {
        this.mHeaderInfo = jSONObject;
    }

    public void setCollectLogSwitch(boolean z) {
        this.mCollectLogSwitch = z;
    }
}
