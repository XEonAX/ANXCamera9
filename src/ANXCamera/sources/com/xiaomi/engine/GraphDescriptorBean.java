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
    private boolean mIsFrontCamera;
    private boolean mIsSnapshot;
    private int mOperationModeID;
    private int mStreamNumber;

    public GraphDescriptorBean() {
        this.mOperationModeID = 0;
        this.mStreamNumber = 0;
        this.mIsSnapshot = true;
        this.mIsFrontCamera = false;
    }

    public GraphDescriptorBean(int i, int i2, boolean z, boolean z2) {
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

    protected GraphDescriptorBean(Parcel parcel) {
        this.mOperationModeID = parcel.readInt();
        this.mStreamNumber = parcel.readInt();
        boolean z = false;
        this.mIsSnapshot = parcel.readByte() != (byte) 0;
        if (parcel.readByte() != (byte) 0) {
            z = true;
        }
        this.mIsFrontCamera = z;
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
        if (!(this.mOperationModeID == graphDescriptorBean.mOperationModeID && this.mStreamNumber == graphDescriptorBean.mStreamNumber && this.mIsSnapshot == graphDescriptorBean.mIsSnapshot && this.mIsFrontCamera == graphDescriptorBean.mIsFrontCamera)) {
            z = false;
        }
        return z;
    }

    public int hashCode() {
        return Objects.hash(new Object[]{Integer.valueOf(this.mOperationModeID), Integer.valueOf(this.mStreamNumber), Boolean.valueOf(this.mIsSnapshot), Boolean.valueOf(this.mIsFrontCamera)});
    }
}
