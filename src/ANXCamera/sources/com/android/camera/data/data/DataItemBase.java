package com.android.camera.data.data;

import android.content.SharedPreferences;
import android.content.SharedPreferences.Editor;
import android.support.v4.util.SimpleArrayMap;
import com.android.camera.CameraAppImpl;
import com.android.camera.data.cloud.DataCloud.CloudItem;
import com.android.camera.data.provider.DataProvider.ProviderEditor;
import com.android.camera.data.provider.DataProvider.ProviderEvent;

public abstract class DataItemBase implements ProviderEditor, ProviderEvent {
    private CloudItem mDataCloudItem;
    private Editor mEditor;
    private final Object mLock = new Object();
    private SharedPreferences mPreferences;
    private SimpleArrayMap<String, Object> mValues = new SimpleArrayMap();

    public final class ConcurrentEditor implements ProviderEditor {
        private boolean mIsClear;
        private SimpleArrayMap<String, Object> mModified = new SimpleArrayMap();
        private Editor mPreferenceEditor;

        public ConcurrentEditor(Editor editor) {
            this.mPreferenceEditor = editor;
        }

        public ProviderEditor putString(String str, String str2) {
            this.mModified.put(str, str2);
            if (this.mPreferenceEditor != null) {
                this.mPreferenceEditor.putString(str, str2);
            }
            return this;
        }

        public ProviderEditor putBoolean(String str, boolean z) {
            this.mModified.put(str, Boolean.valueOf(z));
            if (this.mPreferenceEditor != null) {
                this.mPreferenceEditor.putBoolean(str, z);
            }
            return this;
        }

        public ProviderEditor putInt(String str, int i) {
            this.mModified.put(str, Integer.valueOf(i));
            if (this.mPreferenceEditor != null) {
                this.mPreferenceEditor.putInt(str, i);
            }
            return this;
        }

        public ProviderEditor putLong(String str, long j) {
            this.mModified.put(str, Long.valueOf(j));
            if (this.mPreferenceEditor != null) {
                this.mPreferenceEditor.putLong(str, j);
            }
            return this;
        }

        public ProviderEditor putFloat(String str, float f) {
            this.mModified.put(str, Float.valueOf(f));
            if (this.mPreferenceEditor != null) {
                this.mPreferenceEditor.putFloat(str, f);
            }
            return this;
        }

        public ProviderEditor remove(String str) {
            this.mModified.put(str, null);
            if (this.mPreferenceEditor != null) {
                this.mPreferenceEditor.remove(str);
            }
            return this;
        }

        public ProviderEditor clear() {
            this.mIsClear = true;
            if (this.mPreferenceEditor != null) {
                this.mPreferenceEditor.clear();
            }
            return this;
        }

        public boolean commit() {
            return false;
        }

        public void apply() {
            synchronized (DataItemBase.this.mLock) {
                if (this.mPreferenceEditor != null) {
                    this.mPreferenceEditor.apply();
                }
                if (this.mIsClear) {
                    DataItemBase.this.mValues.clear();
                    this.mIsClear = false;
                }
                DataItemBase.this.mValues.putAll(this.mModified);
                this.mModified.clear();
                this.mModified = null;
                this.mPreferenceEditor = null;
            }
        }
    }

    public String getString(String str, String str2) {
        if (this.mDataCloudItem != null) {
            str2 = this.mDataCloudItem.getCloudStringDefault(str, str2);
        }
        synchronized (this.mLock) {
            String str3 = (String) this.mValues.get(str);
            if (str3 != null || isTransient()) {
                str = str3;
            } else {
                str = getSharedPreferences().getString(str, str2);
            }
            if (str == null) {
                str = str2;
            }
        }
        return str;
    }

    public boolean getBoolean(String str, boolean z) {
        if (this.mDataCloudItem != null) {
            z = this.mDataCloudItem.getCloudBooleanDefault(str, z);
        }
        synchronized (this.mLock) {
            Boolean bool = (Boolean) this.mValues.get(str);
            if (bool == null && !isTransient()) {
                bool = Boolean.valueOf(getSharedPreferences().getBoolean(str, z));
            }
            if (bool != null) {
                z = bool.booleanValue();
            }
        }
        return z;
    }

    public int getInt(String str, int i) {
        if (this.mDataCloudItem != null) {
            i = this.mDataCloudItem.getCloudIntDefault(str, i);
        }
        synchronized (this.mLock) {
            Integer num = (Integer) this.mValues.get(str);
            if (num == null && !isTransient()) {
                num = Integer.valueOf(getSharedPreferences().getInt(str, i));
            }
            if (num != null) {
                i = num.intValue();
            }
        }
        return i;
    }

    public long getLong(String str, long j) {
        if (this.mDataCloudItem != null) {
            j = this.mDataCloudItem.getCloudLongDefault(str, j);
        }
        synchronized (this.mLock) {
            Long l = (Long) this.mValues.get(str);
            if (l == null && !isTransient()) {
                l = Long.valueOf(getSharedPreferences().getLong(str, j));
            }
            if (l != null) {
                j = l.longValue();
            }
        }
        return j;
    }

    public float getFloat(String str, float f) {
        if (this.mDataCloudItem != null) {
            f = this.mDataCloudItem.getCloudFloatDefault(str, f);
        }
        synchronized (this.mLock) {
            Float f2 = (Float) this.mValues.get(str);
            if (f2 == null && !isTransient()) {
                f2 = Float.valueOf(getSharedPreferences().getFloat(str, f));
            }
            if (f2 != null) {
                f = f2.floatValue();
            }
        }
        return f;
    }

    public double getDoubleFromValues(String str, double d) {
        synchronized (this.mLock) {
            Double d2 = (Double) this.mValues.get(str);
            if (d2 != null) {
                d = d2.doubleValue();
            }
        }
        return d;
    }

    public boolean contains(String str) {
        return getSharedPreferences().contains(str);
    }

    public ProviderEditor editor() {
        synchronized (this.mLock) {
            if (isMutable()) {
                if (!isTransient() && this.mEditor == null) {
                    this.mEditor = getSharedPreferences().edit();
                }
            } else {
                throw new RuntimeException("not allowed to modify");
            }
        }
        return this;
    }

    public ConcurrentEditor concurrentEditor() {
        if (isMutable()) {
            return new ConcurrentEditor(isTransient() ? null : getSharedPreferences().edit());
        }
        throw new RuntimeException("not allowed to modify");
    }

    public ProviderEditor putString(String str, String str2) {
        synchronized (this.mLock) {
            this.mValues.put(str, str2);
            if (this.mEditor != null) {
                this.mEditor.putString(str, str2);
            }
        }
        return this;
    }

    public ProviderEditor putBoolean(String str, boolean z) {
        synchronized (this.mLock) {
            this.mValues.put(str, Boolean.valueOf(z));
            if (this.mEditor != null) {
                this.mEditor.putBoolean(str, z);
            }
        }
        return this;
    }

    public ProviderEditor putInt(String str, int i) {
        synchronized (this.mLock) {
            this.mValues.put(str, Integer.valueOf(i));
            if (this.mEditor != null) {
                this.mEditor.putInt(str, i);
            }
        }
        return this;
    }

    public ProviderEditor putLong(String str, long j) {
        synchronized (this.mLock) {
            this.mValues.put(str, Long.valueOf(j));
            if (this.mEditor != null) {
                this.mEditor.putLong(str, j);
            }
        }
        return this;
    }

    public ProviderEditor putFloat(String str, float f) {
        synchronized (this.mLock) {
            this.mValues.put(str, Float.valueOf(f));
            if (this.mEditor != null) {
                this.mEditor.putFloat(str, f);
            }
        }
        return this;
    }

    public ProviderEditor remove(String str) {
        synchronized (this.mLock) {
            this.mValues.remove(str);
            if (this.mEditor != null) {
                this.mEditor.remove(str);
            }
        }
        return this;
    }

    public ProviderEditor clear() {
        synchronized (this.mLock) {
            this.mValues.clear();
            if (this.mEditor != null) {
                this.mEditor.clear();
            }
        }
        return this;
    }

    public boolean commit() {
        synchronized (this.mLock) {
            if (this.mEditor != null) {
                boolean commit = this.mEditor.commit();
                return commit;
            }
            return false;
        }
    }

    public void apply() {
        if (isTransient()) {
            throw new RuntimeException("Transient data！");
        }
        synchronized (this.mLock) {
            if (this.mEditor != null) {
                this.mEditor.apply();
            } else {
                throw new RuntimeException("Editor null！");
            }
        }
    }

    private SharedPreferences getSharedPreferences() {
        if (this.mPreferences == null) {
            initPreferences();
        }
        return this.mPreferences;
    }

    private void initPreferences() {
        if (!isTransient()) {
            this.mPreferences = CameraAppImpl.getAndroidContext().getSharedPreferences(provideKey(), 0);
        }
    }

    protected SimpleArrayMap<String, Object> getValues() {
        SimpleArrayMap<String, Object> simpleArrayMap;
        synchronized (this.mLock) {
            simpleArrayMap = this.mValues;
        }
        return simpleArrayMap;
    }

    public void clearArrayMap() {
        synchronized (this.mLock) {
            this.mValues.clear();
        }
    }

    public void restoreArrayMap(SimpleArrayMap<String, Object> simpleArrayMap) {
        synchronized (this.mLock) {
            this.mValues.clear();
            this.mValues.putAll(simpleArrayMap);
        }
    }

    public SimpleArrayMap cloneValues() {
        SimpleArrayMap simpleArrayMap;
        synchronized (this.mLock) {
            simpleArrayMap = new SimpleArrayMap();
            simpleArrayMap.putAll(this.mValues);
        }
        return simpleArrayMap;
    }

    public void injectCloud(CloudItem cloudItem) {
        this.mDataCloudItem = cloudItem;
    }

    protected boolean isMutable() {
        return true;
    }
}
