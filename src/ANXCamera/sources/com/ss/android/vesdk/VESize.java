package com.ss.android.vesdk;

import android.os.Parcel;
import android.os.Parcelable;
import android.os.Parcelable.Creator;
import com.android.camera.Util;

public class VESize implements Parcelable {
    public static final Creator<VESize> CREATOR = new Creator<VESize>() {
        public VESize createFromParcel(Parcel parcel) {
            return new VESize(parcel);
        }

        public VESize[] newArray(int i) {
            return new VESize[i];
        }
    };
    public int height = 1280;
    public int width = Util.LIMIT_SURFACE_WIDTH;

    public VESize(int i, int i2) {
        this.width = i;
        this.height = i2;
    }

    protected VESize(Parcel parcel) {
        this.width = parcel.readInt();
        this.height = parcel.readInt();
    }

    public void writeToParcel(Parcel parcel, int i) {
        parcel.writeInt(this.width);
        parcel.writeInt(this.height);
    }

    public int describeContents() {
        return 0;
    }
}
