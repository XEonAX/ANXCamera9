package com.xiaomi.protocol;

import android.os.Parcel;
import android.os.Parcelable;
import android.os.Parcelable.Creator;

public final class IGraphDescriptorBean implements Parcelable {
    public static final Creator<IGraphDescriptorBean> CREATOR = new Creator<IGraphDescriptorBean>() {
        public IGraphDescriptorBean createFromParcel(Parcel parcel) {
            return new IGraphDescriptorBean(parcel);
        }

        public IGraphDescriptorBean[] newArray(int i) {
            return new IGraphDescriptorBean[i];
        }
    };
    private boolean mIsFrontCamera;
    private boolean mIsSnapshot;
    private int mOperationModeID;
    private int mStreamNumber;

    public IGraphDescriptorBean() {
        this.mOperationModeID = 0;
        this.mStreamNumber = 0;
        this.mIsSnapshot = true;
        this.mIsFrontCamera = false;
    }

    public IGraphDescriptorBean(int i, int i2, boolean z, boolean z2) {
        this.mOperationModeID = i;
        this.mStreamNumber = i2;
        this.mIsSnapshot = z;
        this.mIsFrontCamera = z2;
    }

    public int getOperationModeID() {
        return this.mOperationModeID;
    }

    public int getStreamNumber() {
        return this.mStreamNumber;
    }

    public boolean isSnapshot() {
        return this.mIsSnapshot;
    }

    public boolean isFrontCamera() {
        return this.mIsFrontCamera;
    }

    public void setOperationModeID(int i) {
        this.mOperationModeID = i;
    }

    public void setStreamNumber(int i) {
        this.mStreamNumber = i;
    }

    public void setSnapshot(boolean z) {
        this.mIsSnapshot = z;
    }

    public void setFrontCamera(boolean z) {
        this.mIsFrontCamera = z;
    }

    public int describeContents() {
        return 0;
    }

    public void writeToParcel(Parcel parcel, int i) {
        parcel.writeInt(this.mOperationModeID);
        parcel.writeInt(this.mStreamNumber);
        parcel.writeByte(this.mIsSnapshot);
        parcel.writeByte(this.mIsFrontCamera);
    }

    protected IGraphDescriptorBean(Parcel parcel) {
        this.mOperationModeID = parcel.readInt();
        this.mStreamNumber = parcel.readInt();
        boolean z = false;
        this.mIsSnapshot = parcel.readByte() != (byte) 0;
        if (parcel.readByte() != (byte) 0) {
            z = true;
        }
        this.mIsFrontCamera = z;
    }
}
