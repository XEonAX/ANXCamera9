package com.android.camera.data.cloud;

import android.content.SharedPreferences;
import android.content.SharedPreferences.Editor;
import android.util.Log;
import com.android.camera.CameraAppImpl;
import com.android.camera.data.cloud.DataCloud.CloudFeature;
import com.android.camera.data.data.config.SupportedConfigFactory;
import com.android.camera.data.data.config.SupportedConfigs;
import java.util.Collection;

public class DataCloudFeatureController implements CloudFeature {
    public static final String KEY = "cloud_feature";
    private static final String TAG = DataCloudFeatureController.class.getSimpleName();
    private SharedPreferences mPreferences;
    private boolean mReady;

    private SharedPreferences getSharedPreferences() {
        if (this.mPreferences == null) {
            initPreferences();
        }
        return this.mPreferences;
    }

    private void initPreferences() {
        this.mPreferences = CameraAppImpl.getAndroidContext().getSharedPreferences(provideKey(), 0);
    }

    public SupportedConfigs filterFeature(SupportedConfigs supportedConfigs) {
        if (!this.mReady) {
            return supportedConfigs;
        }
        SupportedConfigs supportedConfigs2 = new SupportedConfigs();
        SharedPreferences sharedPreferences = getSharedPreferences();
        for (int i = 0; i < supportedConfigs.getLength(); i++) {
            int config = supportedConfigs.getConfig(i);
            boolean z = true;
            try {
                z = sharedPreferences.getBoolean(SupportedConfigFactory.getConfigKey(config), true);
            } catch (RuntimeException e) {
                String str = TAG;
                StringBuilder stringBuilder = new StringBuilder();
                stringBuilder.append("unknown config ");
                stringBuilder.append(config);
                Log.w(str, stringBuilder.toString());
            }
            if (z) {
                supportedConfigs2.add(config);
            }
        }
        return supportedConfigs2;
    }

    public Collection<String> getAllDisabledFeatures() {
        return getSharedPreferences().getAll().keySet();
    }

    public Editor editor() {
        return getSharedPreferences().edit();
    }

    public void setReady(boolean z) {
        this.mReady = z;
    }

    public String provideKey() {
        return KEY;
    }
}
