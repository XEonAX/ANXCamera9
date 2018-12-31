package com.android.camera.preferences;

import android.content.Context;
import android.content.SharedPreferences.Editor;
import android.content.res.TypedArray;
import android.util.AttributeSet;
import android.util.TypedValue;
import com.android.camera.R;
import com.android.camera.Util;
import com.android.camera.log.Log;
import java.util.ArrayList;
import java.util.List;
import java.util.Objects;

public class ListPreference extends CameraPreference {
    private static final String TAG = "ListPreference";
    private final CharSequence[] mDefaultValues;
    private CharSequence[] mEntries;
    private CharSequence[] mEntryValues;
    private final boolean mHasPopup;
    private final String mKey;
    private String mValue;

    public ListPreference(Context context, AttributeSet attributeSet) {
        super(context, attributeSet);
        TypedArray obtainStyledAttributes = context.obtainStyledAttributes(attributeSet, R.styleable.ListPreference, 0, 0);
        this.mKey = (String) Util.checkNotNull(obtainStyledAttributes.getString(0));
        String string = obtainStyledAttributes.getString(4);
        this.mHasPopup = string == null ? false : Boolean.valueOf(string).booleanValue();
        TypedValue peekValue = obtainStyledAttributes.peekValue(1);
        if (peekValue == null || peekValue.type != 1) {
            this.mDefaultValues = new CharSequence[1];
            this.mDefaultValues[0] = obtainStyledAttributes.getString(1);
        } else {
            this.mDefaultValues = obtainStyledAttributes.getTextArray(1);
        }
        setEntries(obtainStyledAttributes.getTextArray(3));
        setEntryValues(obtainStyledAttributes.getTextArray(2));
        obtainStyledAttributes.recycle();
    }

    public String getKey() {
        return this.mKey;
    }

    public boolean hasPopup() {
        return this.mHasPopup;
    }

    public CharSequence[] getEntries() {
        return this.mEntries;
    }

    public CharSequence[] getEntryValues() {
        return this.mEntryValues;
    }

    public void setEntries(CharSequence[] charSequenceArr) {
        if (charSequenceArr == null) {
            charSequenceArr = new CharSequence[0];
        }
        this.mEntries = charSequenceArr;
    }

    public void setEntryValues(CharSequence[] charSequenceArr) {
        if (charSequenceArr == null) {
            charSequenceArr = new CharSequence[0];
        }
        this.mEntryValues = charSequenceArr;
    }

    public void setEntryValues(int i) {
        setEntryValues(this.mContext.getResources().getTextArray(i));
    }

    public String getValue() {
        this.mValue = getSharedPreferences().getString(this.mKey, findSupportedDefaultValue());
        return this.mValue;
    }

    public boolean isDefaultValue() {
        String findSupportedDefaultValue = findSupportedDefaultValue();
        this.mValue = getSharedPreferences().getString(this.mKey, findSupportedDefaultValue);
        return Objects.equals(findSupportedDefaultValue, this.mValue);
    }

    public String findSupportedDefaultValue() {
        for (int i = 0; i < this.mDefaultValues.length; i++) {
            for (Object equals : this.mEntryValues) {
                if (equals.equals(this.mDefaultValues[i])) {
                    return this.mDefaultValues[i].toString();
                }
            }
        }
        return null;
    }

    public void setValue(String str) {
        if (findIndexOfValue(str) >= 0) {
            this.mValue = str;
            persistStringValue(str);
            return;
        }
        throw new IllegalArgumentException();
    }

    public void setValueIndex(int i) {
        setValue(this.mEntryValues[i].toString());
    }

    public void filterValue() {
        if (findIndexOfValue(getValue()) < 0) {
            String str = TAG;
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.append("filterValue index < 0, value=");
            stringBuilder.append(getValue());
            Log.e(str, stringBuilder.toString());
            print();
            setValueIndex(0);
        }
    }

    public int findIndexOfValue(String str) {
        int length = this.mEntryValues.length;
        for (int i = 0; i < length; i++) {
            if (Util.equals(this.mEntryValues[i], str)) {
                return i;
            }
        }
        return -1;
    }

    public String getEntry() {
        int findIndexOfValue = findIndexOfValue(getValue());
        if (findIndexOfValue < 0) {
            String str = TAG;
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.append("getEntry index=");
            stringBuilder.append(findIndexOfValue);
            Log.e(str, stringBuilder.toString());
            print();
            setValue(findSupportedDefaultValue());
            findIndexOfValue = findIndexOfValue(getValue());
        }
        return this.mEntries[findIndexOfValue].toString();
    }

    protected void persistStringValue(String str) {
        Editor edit = getSharedPreferences().edit();
        edit.putString(this.mKey, str);
        edit.apply();
    }

    public void filterUnsupported(List<String> list) {
        ArrayList arrayList = new ArrayList();
        ArrayList arrayList2 = new ArrayList();
        int length = this.mEntryValues.length;
        for (int i = 0; i < length; i++) {
            if (list.indexOf(this.mEntryValues[i].toString()) >= 0) {
                arrayList.add(this.mEntries[i]);
                arrayList2.add(this.mEntryValues[i]);
            }
        }
        int size = arrayList.size();
        this.mEntries = (CharSequence[]) arrayList.toArray(new CharSequence[size]);
        this.mEntryValues = (CharSequence[]) arrayList2.toArray(new CharSequence[size]);
    }

    public void print() {
        int i;
        String str;
        StringBuilder stringBuilder;
        String str2 = TAG;
        StringBuilder stringBuilder2 = new StringBuilder();
        stringBuilder2.append("Preference key=");
        stringBuilder2.append(getKey());
        stringBuilder2.append(". value=");
        stringBuilder2.append(getValue());
        Log.v(str2, stringBuilder2.toString());
        int i2 = 0;
        for (i = 0; i < this.mEntryValues.length; i++) {
            str = TAG;
            stringBuilder = new StringBuilder();
            stringBuilder.append("entryValues[");
            stringBuilder.append(i);
            stringBuilder.append("]=");
            stringBuilder.append(this.mEntryValues[i]);
            Log.v(str, stringBuilder.toString());
        }
        for (i = 0; i < this.mEntries.length; i++) {
            str = TAG;
            stringBuilder = new StringBuilder();
            stringBuilder.append("mEntries[");
            stringBuilder.append(i);
            stringBuilder.append("]=");
            stringBuilder.append(this.mEntries[i]);
            Log.v(str, stringBuilder.toString());
        }
        while (i2 < this.mDefaultValues.length) {
            String str3 = TAG;
            StringBuilder stringBuilder3 = new StringBuilder();
            stringBuilder3.append("mDefaultValues[");
            stringBuilder3.append(i2);
            stringBuilder3.append("]=");
            stringBuilder3.append(this.mDefaultValues[i2]);
            Log.v(str3, stringBuilder3.toString());
            i2++;
        }
    }
}
