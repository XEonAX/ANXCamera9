package com.ss.android.vesdk;

import android.os.Parcel;
import android.os.Parcelable;
import android.os.Parcelable.Creator;

public class VEWatermarkParam implements Parcelable {
    public static final Creator<VEWatermarkParam> CREATOR = new Creator<VEWatermarkParam>() {
        public VEWatermarkParam createFromParcel(Parcel parcel) {
            VEWatermarkParam vEWatermarkParam = new VEWatermarkParam();
            boolean z = true;
            if (parcel.readInt() != 1) {
                z = false;
            }
            vEWatermarkParam.needExtFile = z;
            vEWatermarkParam.extFile = parcel.readString();
            vEWatermarkParam.images = parcel.createStringArray();
            vEWatermarkParam.interval = parcel.readInt();
            vEWatermarkParam.xOffset = parcel.readInt();
            vEWatermarkParam.yOffset = parcel.readInt();
            vEWatermarkParam.width = parcel.readInt();
            vEWatermarkParam.height = parcel.readInt();
            return vEWatermarkParam;
        }

        public VEWatermarkParam[] newArray(int i) {
            return new VEWatermarkParam[i];
        }
    };
    public String extFile;
    public int height;
    public String[] images;
    public int interval;
    public boolean needExtFile;
    public int width;
    public int xOffset;
    public int yOffset;

    public int describeContents() {
        return 0;
    }

    public void writeToParcel(Parcel parcel, int i) {
        parcel.writeInt(this.needExtFile);
        parcel.writeString(this.extFile);
        parcel.writeStringArray(this.images);
        parcel.writeInt(this.interval);
        parcel.writeInt(this.xOffset);
        parcel.writeInt(this.yOffset);
        parcel.writeInt(this.width);
        parcel.writeInt(this.height);
    }
}
