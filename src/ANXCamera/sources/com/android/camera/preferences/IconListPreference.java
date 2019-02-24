package com.android.camera.preferences;

import android.content.Context;
import android.content.res.Resources;
import android.content.res.TypedArray;
import android.util.AttributeSet;
import com.android.camera.IntArray;
import com.android.camera.R;
import java.util.List;

public class IconListPreference extends ListPreference {
    private boolean mEnabled = true;
    private int[] mIconIds;
    private int[] mImageIds;
    private int[] mLargeIconIds;
    private int mSingleIconId;

    public IconListPreference(Context context, AttributeSet attributeSet) {
        super(context, attributeSet);
        TypedArray obtainStyledAttributes = context.obtainStyledAttributes(attributeSet, R.styleable.IconListPreference, 0, 0);
        Resources resources = context.getResources();
        this.mSingleIconId = obtainStyledAttributes.getResourceId(1, 0);
        this.mIconIds = getIds(resources, obtainStyledAttributes.getResourceId(0, 0));
        this.mLargeIconIds = getIds(resources, obtainStyledAttributes.getResourceId(2, 0));
        this.mImageIds = getIds(resources, obtainStyledAttributes.getResourceId(3, 0));
        obtainStyledAttributes.recycle();
    }

    public int getSingleIcon() {
        return this.mSingleIconId;
    }

    public int[] getIconIds() {
        return this.mIconIds;
    }

    public int[] getLargeIconIds() {
        return this.mLargeIconIds;
    }

    public int[] getImageIds() {
        return this.mImageIds;
    }

    public void setIconIds(int[] iArr) {
        this.mIconIds = iArr;
    }

    public void setIconRes(int i) {
        this.mIconIds = getIds(this.mContext.getResources(), i);
    }

    public void setLargeIconIds(int[] iArr) {
        this.mLargeIconIds = iArr;
    }

    public void setEnable(boolean z) {
        this.mEnabled = z;
    }

    public boolean getEnable() {
        return this.mEnabled;
    }

    private int[] getIds(Resources resources, int i) {
        if (i == 0) {
            return null;
        }
        TypedArray obtainTypedArray = resources.obtainTypedArray(i);
        i = obtainTypedArray.length();
        int[] iArr = new int[i];
        for (int i2 = 0; i2 < i; i2++) {
            iArr[i2] = obtainTypedArray.getResourceId(i2, 0);
        }
        obtainTypedArray.recycle();
        return iArr;
    }

    public void filterUnsupported(List<String> list) {
        CharSequence[] entryValues = getEntryValues();
        IntArray intArray = new IntArray();
        IntArray intArray2 = new IntArray();
        IntArray intArray3 = new IntArray();
        int length = entryValues.length;
        for (int i = 0; i < length; i++) {
            if (list.indexOf(entryValues[i].toString()) >= 0) {
                if (this.mIconIds != null) {
                    intArray.add(this.mIconIds[i]);
                }
                if (this.mLargeIconIds != null) {
                    intArray2.add(this.mLargeIconIds[i]);
                }
                if (this.mImageIds != null) {
                    intArray3.add(this.mImageIds[i]);
                }
            }
        }
        if (this.mIconIds != null) {
            this.mIconIds = intArray.toArray(new int[intArray.size()]);
        }
        if (this.mLargeIconIds != null) {
            this.mLargeIconIds = intArray2.toArray(new int[intArray2.size()]);
        }
        if (this.mImageIds != null) {
            this.mImageIds = intArray3.toArray(new int[intArray3.size()]);
        }
        super.filterUnsupported(list);
    }
}
