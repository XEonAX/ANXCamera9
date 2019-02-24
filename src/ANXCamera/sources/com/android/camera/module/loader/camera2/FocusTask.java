package com.android.camera.module.loader.camera2;

import android.os.Parcel;
import android.os.Parcelable;
import android.os.Parcelable.Creator;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;

public class FocusTask implements Parcelable {
    public static final Creator<FocusTask> CREATOR = new Creator<FocusTask>() {
        public FocusTask createFromParcel(Parcel parcel) {
            return new FocusTask(parcel);
        }

        public FocusTask[] newArray(int i) {
            return new FocusTask[i];
        }
    };
    public static final int TRIGGER_BY_AUTO = 2;
    public static final int TRIGGER_BY_LOCK = 3;
    public static final int TRIGGER_BY_MANUALLY = 1;
    private long mElapsedTime;
    private int mFocusBy;
    private long mFocusStartTime;
    private boolean mSuccess;

    @Retention(RetentionPolicy.SOURCE)
    public @interface FocusTriggerBy {
    }

    public static final FocusTask create(int i) {
        return new FocusTask(i);
    }

    private FocusTask(int i) {
        this.mFocusBy = i;
        this.mFocusStartTime = System.currentTimeMillis();
    }

    public int getFocusTrigger() {
        return this.mFocusBy;
    }

    public void setResult(boolean z) {
        this.mSuccess = z;
        this.mElapsedTime = System.currentTimeMillis() - this.mFocusStartTime;
    }

    public boolean isSuccess() {
        return this.mSuccess;
    }

    public boolean isFocusing() {
        return this.mElapsedTime == 0;
    }

    public long getElapsedTime() {
        if (this.mFocusStartTime != 0) {
            return this.mElapsedTime;
        }
        throw new RuntimeException("unknown focus time");
    }

    public int describeContents() {
        return 0;
    }

    public void writeToParcel(Parcel parcel, int i) {
        parcel.writeInt(this.mFocusBy);
        parcel.writeLong(this.mFocusStartTime);
        parcel.writeLong(this.mElapsedTime);
        parcel.writeByte(this.mSuccess);
    }

    protected FocusTask(Parcel parcel) {
        this.mFocusBy = parcel.readInt();
        this.mFocusStartTime = parcel.readLong();
        this.mElapsedTime = parcel.readLong();
        this.mSuccess = parcel.readByte() != (byte) 0;
    }
}
