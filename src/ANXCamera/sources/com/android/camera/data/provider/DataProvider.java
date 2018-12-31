package com.android.camera.data.provider;

import android.support.v4.util.SimpleArrayMap;
import com.android.camera.data.cloud.DataCloud.CloudItem;
import com.android.camera.data.data.DataItemBase.ConcurrentEditor;

public interface DataProvider {

    public interface ProviderEditor {
        void apply();

        ProviderEditor clear();

        boolean commit();

        ProviderEditor putBoolean(String str, boolean z);

        ProviderEditor putFloat(String str, float f);

        ProviderEditor putInt(String str, int i);

        ProviderEditor putLong(String str, long j);

        ProviderEditor putString(String str, String str2);

        ProviderEditor remove(String str);
    }

    public interface ProviderEvent {
        SimpleArrayMap cloneValues();

        ConcurrentEditor concurrentEditor();

        boolean contains(String str);

        ProviderEditor editor();

        boolean getBoolean(String str, boolean z);

        float getFloat(String str, float f);

        int getInt(String str, int i);

        long getLong(String str, long j);

        String getString(String str, String str2);

        void injectCloud(CloudItem cloudItem);

        boolean isTransient();

        String provideKey();
    }

    <P extends ProviderEvent> P dataConfig();

    <P extends ProviderEvent> P dataConfig(int i);

    <P extends ProviderEvent> P dataConfig(int i, int i2);

    <P extends ProviderEvent> P dataFeature();

    <P extends ProviderEvent> P dataGlobal();

    <P extends ProviderEvent> P dataNormalConfig();

    <P extends ProviderEvent> P dataRunning();
}
