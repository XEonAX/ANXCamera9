package com.android.camera.data.data;

import android.support.annotation.DrawableRes;
import android.support.annotation.NonNull;
import android.support.annotation.StringRes;
import com.android.camera.Util;
import com.android.camera.log.Log;
import java.util.List;
import java.util.Locale;

public abstract class ComponentData {
    public List<ComponentDataItem> mItems;
    protected DataItemBase mParentDataItem;

    @NonNull
    public abstract String getDefaultValue(int i);

    @StringRes
    public abstract int getDisplayTitleString();

    public abstract List<ComponentDataItem> getItems();

    public abstract String getKey(int i);

    public <D extends DataItemBase> ComponentData(D d) {
        this.mParentDataItem = d;
    }

    protected boolean checkValueValid(String str) {
        return true;
    }

    protected void resetComponentValue(int i) {
    }

    public String getComponentValue(int i) {
        String defaultValue = getDefaultValue(i);
        String string = this.mParentDataItem.getString(getKey(i), defaultValue);
        if (string == null || string.equals(defaultValue) || checkValueValid(string)) {
            return string;
        }
        String simpleName = getClass().getSimpleName();
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("reset invalid value ");
        stringBuilder.append(string);
        Log.e(simpleName, stringBuilder.toString());
        resetComponentValue(i);
        return this.mParentDataItem.getString(getKey(i), defaultValue);
    }

    public void setComponentValue(int i, String str) {
        if (this.mParentDataItem.isTransient()) {
            this.mParentDataItem.putString(getKey(i), str);
        } else {
            this.mParentDataItem.editor().putString(getKey(i), str).apply();
        }
    }

    @StringRes
    public int getValueDisplayString(int i) {
        String componentValue = getComponentValue(i);
        for (ComponentDataItem componentDataItem : getItems()) {
            if (componentDataItem.mValue.equals(componentValue)) {
                return componentDataItem.mDisplayNameRes;
            }
        }
        String format = String.format(Locale.ENGLISH, "invalid value %1$s for %2$s", new Object[]{componentValue, getKey(i)});
        Log.e(getClass().getSimpleName(), format);
        if (!Util.isDebugOsBuild()) {
            return -2;
        }
        throw new IllegalArgumentException(format);
    }

    @DrawableRes
    public int getValueSelectedDrawable(int i) {
        String componentValue = getComponentValue(i);
        for (ComponentDataItem componentDataItem : getItems()) {
            if (componentDataItem.mValue.equals(componentValue)) {
                return componentDataItem.mIconSelectedRes;
            }
        }
        String format = String.format(Locale.ENGLISH, "invalid value %1$s for %2$s", new Object[]{componentValue, getKey(i)});
        Log.e(getClass().getSimpleName(), format);
        if (!Util.isDebugOsBuild()) {
            return -1;
        }
        throw new IllegalArgumentException(format);
    }

    public void reset(int i) {
        setComponentValue(i, getDefaultValue(i));
    }

    public int findIndexOfValue(String str) {
        List items = getItems();
        for (int i = 0; i < items.size(); i++) {
            if (str.equals(((ComponentDataItem) items.get(i)).mValue)) {
                return i;
            }
        }
        return -1;
    }

    public boolean isEmpty() {
        return this.mItems == null || this.mItems.isEmpty();
    }

    public boolean disableUpdate() {
        return false;
    }

    @StringRes
    public int getDisableReasonString() {
        return 0;
    }
}
