package com.xiaomi.engine;

import android.os.Parcel;
import android.os.Parcelable;
import android.os.Parcelable.Creator;
import java.util.Objects;

public final class GraphDescriptorBean implements Parcelable {
    public static final Creator<GraphDescriptorBean> CREATOR = new Creator<GraphDescriptorBean>() {
        public GraphDescriptorBean createFromParcel(Parcel parcel) {
            return new GraphDescriptorBean(parcel);
        }

        public GraphDescriptorBean[] newArray(int i) {
            return new GraphDescriptorBean[i];
        }
    };
    private int mCameraCombinationMode;
    private boolean mIsSnapshot;
    private int mOperationModeID;
    private int mStreamNumber;

    public GraphDescriptorBean() {
        this.mOperationModeID = 0;
        this.mStreamNumber = 0;
        this.mIsSnapshot = true;
        this.mCameraCombinationMode = 0;
    }

    public GraphDescriptorBean(int i, int i2, boolean z, int i3) {
        this.mOperationModeID = i;
        this.mStreamNumber = i2;
        this.mIsSnapshot = z;
        this.mCameraCombinationMode = i3;
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

    public int getCameraCombinationMode() {
        return this.mCameraCombinationMode;
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

    public void setCameraCombinationMode(int i) {
        this.mCameraCombinationMode = i;
    }

    public int describeContents() {
        return 0;
    }

    public void writeToParcel(Parcel parcel, int i) {
        parcel.writeInt(this.mOperationModeID);
        parcel.writeInt(this.mStreamNumber);
        parcel.writeByte(this.mIsSnapshot);
        parcel.writeInt(this.mCameraCombinationMode);
    }

    protected GraphDescriptorBean(Parcel parcel) {
        this.mOperationModeID = parcel.readInt();
        this.mStreamNumber = parcel.readInt();
        this.mIsSnapshot = parcel.readByte() != (byte) 0;
        this.mCameraCombinationMode = parcel.readInt();
    }

    public boolean equals(Object obj) {
        boolean z = true;
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof GraphDescriptorBean)) {
            return false;
        }
        GraphDescriptorBean graphDescriptorBean = (GraphDescriptorBean) obj;
        if (!(this.mOperationModeID == graphDescriptorBean.mOperationModeID && this.mStreamNumber == graphDescriptorBean.mStreamNumber && this.mIsSnapshot == graphDescriptorBean.mIsSnapshot && this.mCameraCombinationMode == graphDescriptorBean.mCameraCombinationMode)) {
            z = false;
        }
        return z;
    }

    public int hashCode() {
        return Objects.hash(new Object[]{Integer.valueOf(this.mOperationModeID), Integer.valueOf(this.mStreamNumber), Boolean.valueOf(this.mIsSnapshot), Integer.valueOf(this.mCameraCombinationMode)});
    }
}
