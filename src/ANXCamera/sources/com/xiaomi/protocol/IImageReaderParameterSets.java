package com.xiaomi.protocol;

import android.os.Parcel;
import android.os.Parcelable;
import android.os.Parcelable.Creator;
import java.util.Locale;

public class IImageReaderParameterSets implements Parcelable {
    public static final Creator<IImageReaderParameterSets> CREATOR = new Creator<IImageReaderParameterSets>() {
        public IImageReaderParameterSets createFromParcel(Parcel parcel) {
            return new IImageReaderParameterSets(parcel);
        }

        public IImageReaderParameterSets[] newArray(int i) {
            return new IImageReaderParameterSets[i];
        }
    };
    public static final int TELE_IMAGE_FLAG = 0;
    public static final int WIDE_IMAGE_FLAG = 1;
    public int format;
    public int height;
    public int maxImages;
    public int targetCamera;
    public int width;

    public IImageReaderParameterSets(int i, int i2, int i3, int i4, int i5) {
        this.width = i;
        this.height = i2;
        this.format = i3;
        this.maxImages = i4;
        this.targetCamera = i5;
    }

    protected IImageReaderParameterSets(Parcel parcel) {
        readFromParcel(parcel);
    }

    public int describeContents() {
        return 0;
    }

    public void writeToParcel(Parcel parcel, int i) {
        parcel.writeInt(this.width);
        parcel.writeInt(this.height);
        parcel.writeInt(this.format);
        parcel.writeInt(this.maxImages);
        parcel.writeInt(this.targetCamera);
    }

    public void readFromParcel(Parcel parcel) {
        this.width = parcel.readInt();
        this.height = parcel.readInt();
        this.format = parcel.readInt();
        this.maxImages = parcel.readInt();
        this.targetCamera = parcel.readInt();
    }

    public String toString() {
        return String.format(Locale.ENGLISH, "IImageReaderParameterSets[ %d, %d, %d, %d %s]", new Object[]{Integer.valueOf(this.width), Integer.valueOf(this.height), Integer.valueOf(this.format), Integer.valueOf(this.maxImages), Integer.valueOf(this.targetCamera)});
    }

    public boolean equals(Object obj) {
        if (obj == null || !(obj instanceof IImageReaderParameterSets)) {
            super.equals(obj);
            return super.equals(obj);
        }
        IImageReaderParameterSets iImageReaderParameterSets = (IImageReaderParameterSets) obj;
        boolean z = this.targetCamera == iImageReaderParameterSets.targetCamera && this.width == iImageReaderParameterSets.width && this.height == iImageReaderParameterSets.height && this.format == iImageReaderParameterSets.format && this.maxImages == iImageReaderParameterSets.maxImages;
        return z;
    }
}
