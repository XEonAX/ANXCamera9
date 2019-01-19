package com.android.camera.data.cloud;

import android.app.Application;
import android.content.SharedPreferences.Editor;
import android.os.Build;
import android.provider.MiuiSettings.SettingsCloudData;
import android.text.TextUtils;
import android.util.SparseArray;
import com.android.camera.CameraAppImpl;
import com.android.camera.CameraSettings;
import com.android.camera.data.DataRepository;
import com.android.camera.data.cloud.DataCloud.CloudFeature;
import com.android.camera.data.cloud.DataCloud.CloudItem;
import com.android.camera.data.cloud.DataCloud.CloudManager;
import com.android.camera.log.Log;
import com.android.camera.network.util.NetworkUtils;
import com.android.camera.sensitive.SensitiveFilter;
import io.reactivex.Completable;
import io.reactivex.CompletableEmitter;
import io.reactivex.CompletableOnSubscribe;
import io.reactivex.android.schedulers.AndroidSchedulers;
import io.reactivex.annotations.NonNull;
import io.reactivex.schedulers.Schedulers;
import java.io.File;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

public class DataCloudMgr implements CloudManager {
    private static final String CLOUD_DATA_MODULE_NAME = "camera_settings_v3";
    private static final long CLOUD_DATA_UPDATE_INTERVAL = 86400000;
    private static final String FEA_SENSI_WORD = "pref_senstive_words";
    private static final String KEY_CLOUD_DATA_DEVICE_VERSION = "cloud_data_device_version";
    private static final String KEY_CLOUD_DATA_LAST_UPDATE = "cloud_data_last_update";
    private static final String KEY_CLOUD_DATA_VERSION = "cloud_data_version";
    private static final String TAG = "DataCloudMgr";
    private static final String VALUE = "value";
    private static final String VERSION = "version";
    private DataCloudFeatureController mDataCloudFeatureController;
    private DataCloudItemGlobal mDataCloudGlobal = new DataCloudItemGlobal();
    private SparseArray<DataCloudItemConfig> mDataCloudItemConfigs = new SparseArray(2);

    public CloudItem provideDataCloudGlobal() {
        if (this.mDataCloudGlobal == null) {
            this.mDataCloudGlobal = new DataCloudItemGlobal();
        }
        return this.mDataCloudGlobal;
    }

    public CloudItem provideDataCloudConfig(int i) {
        DataCloudItemConfig dataCloudItemConfig = (DataCloudItemConfig) this.mDataCloudItemConfigs.get(i);
        if (dataCloudItemConfig != null) {
            return dataCloudItemConfig;
        }
        CloudItem dataCloudItemConfig2 = new DataCloudItemConfig(i);
        this.mDataCloudItemConfigs.put(i, dataCloudItemConfig2);
        return dataCloudItemConfig2;
    }

    public CloudFeature DataCloudFeature() {
        if (this.mDataCloudFeatureController == null) {
            this.mDataCloudFeatureController = new DataCloudFeatureController();
        }
        return this.mDataCloudFeatureController;
    }

    private static void checkLastUpdateTimeFormat() {
        try {
            getCloudDataLastUpdateTime();
        } catch (Exception e) {
            Log.w(TAG, "get cloud_data_last_update long value failed, try String type");
            try {
                Object string = DataRepository.dataItemGlobal().getString(KEY_CLOUD_DATA_LAST_UPDATE, "0");
                Log.i(TAG, "try to convert the string value type to long for field [cloud_data_last_update]");
                DataRepository.dataItemGlobal().editor().remove(KEY_CLOUD_DATA_LAST_UPDATE).putLong(KEY_CLOUD_DATA_LAST_UPDATE, TextUtils.isEmpty(string) ? 0 : Long.parseLong(string)).commit();
            } catch (Exception e2) {
                Log.w(TAG, "get cloud_data_last_update string value failed");
            }
        }
    }

    public void fillCloudValues() {
        long currentTimeMillis = System.currentTimeMillis();
        checkLastUpdateTimeFormat();
        if (currentTimeMillis - getCloudDataLastUpdateTime() < CLOUD_DATA_UPDATE_INTERVAL) {
            this.mDataCloudGlobal.setReady(true);
            DataCloudFeature().setReady(true);
            provideDataCloudConfig(1).setReady(true);
            provideDataCloudConfig(0).setReady(true);
            return;
        }
        setCloudDataLastUpdateTime(currentTimeMillis);
        Completable.create(new CompletableOnSubscribe() {
            public void subscribe(@NonNull CompletableEmitter completableEmitter) throws Exception {
                DataCloudMgr.this.fillPreference();
            }
        }).subscribeOn(Schedulers.io()).observeOn(AndroidSchedulers.mainThread()).subscribe();
    }

    private void fillPreference() {
        CloudItem provideDataCloudConfig = provideDataCloudConfig(1);
        CloudItem provideDataCloudConfig2 = provideDataCloudConfig(0);
        getCloudSensitiveWords();
        String cloudDataString = getCloudDataString(CLOUD_DATA_MODULE_NAME, "version", null);
        String cloudDataCommonVersion = getCloudDataCommonVersion();
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("camera_settings_v3_");
        stringBuilder.append(Build.DEVICE);
        String cloudDataString2 = getCloudDataString(stringBuilder.toString(), "version", null);
        String cloudDataDeviceVersion = getCloudDataDeviceVersion();
        this.mDataCloudGlobal.setReady(false);
        DataCloudFeature().setReady(false);
        provideDataCloudConfig.setReady(false);
        provideDataCloudConfig2.setReady(false);
        if (!((cloudDataString == null || cloudDataString.equals(cloudDataCommonVersion)) && (cloudDataString2 == null || cloudDataString2.equals(cloudDataDeviceVersion)))) {
            this.mDataCloudGlobal.editor().clear().apply();
            DataCloudFeature().editor().clear().apply();
            provideDataCloudConfig.editor().clear().apply();
            provideDataCloudConfig2.editor().clear().apply();
            String str = TAG;
            StringBuilder stringBuilder2 = new StringBuilder();
            stringBuilder2.append("updateSettingsFromCloudData common version ");
            stringBuilder2.append(cloudDataCommonVersion);
            stringBuilder2.append(" -> ");
            stringBuilder2.append(cloudDataString);
            Log.d(str, stringBuilder2.toString());
            setCloudDataCommonVersion(cloudDataString);
            updateSettingsFromCloudData(CLOUD_DATA_MODULE_NAME);
            str = TAG;
            StringBuilder stringBuilder3 = new StringBuilder();
            stringBuilder3.append("updateSettingsFromCloudData device version ");
            stringBuilder3.append(cloudDataDeviceVersion);
            stringBuilder3.append(" -> ");
            stringBuilder3.append(cloudDataString2);
            Log.d(str, stringBuilder3.toString());
            setCloudDataDeviceVersion(cloudDataString2);
            StringBuilder stringBuilder4 = new StringBuilder();
            stringBuilder4.append("camera_settings_v3_");
            stringBuilder4.append(Build.DEVICE);
            updateSettingsFromCloudData(stringBuilder4.toString());
        }
        this.mDataCloudGlobal.setReady(true);
        DataCloudFeature().setReady(true);
        provideDataCloudConfig.setReady(true);
        provideDataCloudConfig2.setReady(true);
    }

    private void getCloudSensitiveWords() {
        Object cloudDataString = getCloudDataString(CLOUD_DATA_MODULE_NAME, FEA_SENSI_WORD, "");
        if (!TextUtils.isEmpty(cloudDataString)) {
            try {
                JSONObject jSONObject = new JSONObject(cloudDataString);
                updateSensitiveWords(jSONObject.optInt("version"), jSONObject.optString(VALUE));
            } catch (JSONException e) {
                e.printStackTrace();
            }
        }
    }

    private void updateSettingsFromCloudData(String str) {
        try {
            Object cloudDataString = getCloudDataString(str, "content", null);
            int i = 0;
            if (!TextUtils.isEmpty(cloudDataString)) {
                JSONArray jSONArray = new JSONArray(cloudDataString);
                for (int i2 = 0; i2 < jSONArray.length(); i2++) {
                    String string;
                    DataCloudItemBase dataCloudItemBase = this.mDataCloudGlobal;
                    JSONObject jSONObject = jSONArray.getJSONObject(i2);
                    if (jSONObject.has("type")) {
                        string = jSONObject.getString("type");
                        if (string.equals("front")) {
                            dataCloudItemBase = (DataCloudItemBase) this.mDataCloudItemConfigs.get(1);
                        } else if (string.equals("back")) {
                            dataCloudItemBase = (DataCloudItemBase) this.mDataCloudItemConfigs.get(0);
                        }
                    }
                    string = jSONObject.getString("key");
                    Editor editor = dataCloudItemBase.editor();
                    Object obj = jSONObject.get(VALUE);
                    if (obj instanceof Boolean) {
                        editor.putBoolean(string, ((Boolean) obj).booleanValue());
                    } else if (obj instanceof Integer) {
                        editor.putInt(string, ((Integer) obj).intValue());
                    } else if (obj instanceof Long) {
                        editor.putLong(string, ((Long) obj).longValue());
                    } else if (obj instanceof Float) {
                        editor.putFloat(string, ((Float) obj).floatValue());
                    } else if (obj instanceof String) {
                        editor.putString(string, (String) obj);
                    } else {
                        String str2 = TAG;
                        StringBuilder stringBuilder = new StringBuilder();
                        stringBuilder.append("Wrong camera setting type ");
                        stringBuilder.append(string);
                        stringBuilder.append(": ");
                        stringBuilder.append(obj);
                        Log.e(str2, stringBuilder.toString());
                    }
                    editor.apply();
                }
            }
            Object cloudDataString2 = getCloudDataString(str, "feature", null);
            if (!TextUtils.isEmpty(cloudDataString2)) {
                Editor editor2 = DataCloudFeature().editor();
                JSONArray jSONArray2 = new JSONArray(cloudDataString2);
                while (i < jSONArray2.length()) {
                    JSONObject jSONObject2 = jSONArray2.getJSONObject(i);
                    editor2.putBoolean(jSONObject2.getString("key"), jSONObject2.getBoolean(VALUE));
                    i++;
                }
                editor2.apply();
            }
        } catch (Throwable e) {
            Log.e(TAG, "JSONException when get camera settings !", e);
        }
    }

    private static final String getCloudDataString(String str, String str2, String str3) {
        return SettingsCloudData.getCloudDataString(CameraAppImpl.getAndroidContext().getContentResolver(), str, str2, str3);
    }

    private static final int getCloudDataInt(String str, String str2, int i) {
        return SettingsCloudData.getCloudDataInt(CameraAppImpl.getAndroidContext().getContentResolver(), str, str2, i);
    }

    private static String getCloudDataCommonVersion() {
        return DataRepository.dataItemGlobal().getString(KEY_CLOUD_DATA_VERSION, null);
    }

    private static String getCloudDataDeviceVersion() {
        return DataRepository.dataItemGlobal().getString(KEY_CLOUD_DATA_DEVICE_VERSION, null);
    }

    private static void setCloudDataCommonVersion(String str) {
        DataRepository.dataItemGlobal().editor().putString(KEY_CLOUD_DATA_VERSION, str).apply();
    }

    private static void setCloudDataDeviceVersion(String str) {
        DataRepository.dataItemGlobal().editor().putString(KEY_CLOUD_DATA_DEVICE_VERSION, str).apply();
    }

    private static long getCloudDataLastUpdateTime() {
        return DataRepository.dataItemGlobal().getLong(KEY_CLOUD_DATA_LAST_UPDATE, 0);
    }

    private static void setCloudDataLastUpdateTime(long j) {
        DataRepository.dataItemGlobal().editor().putLong(KEY_CLOUD_DATA_LAST_UPDATE, j).apply();
    }

    private void updateSensitiveWords(int i, String str) {
        str = CameraSettings.getKeyCloudSenstiveWordsPath(str);
        File file = new File(SensitiveFilter.CLOUD_FILE_PATH);
        if (i > CameraSettings.getLocalWordsVersion() || !(file.exists() || i == 0)) {
            NetworkUtils.bind((Application) CameraAppImpl.getAndroidContext());
            if (NetworkUtils.isNetworkConnected() && SensitiveFilter.loadSensitiveWords(str, SensitiveFilter.LOCAL_FILE_PATH)) {
                CameraSettings.setLocalWordsVersion(i);
            }
        }
    }
}
