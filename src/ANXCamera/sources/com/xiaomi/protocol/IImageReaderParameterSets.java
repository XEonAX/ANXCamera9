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
    public int format;
    public int height;
    public int maxImages;
    private boolean shouldHoldImages = true;
    public int targetCamera;
    public int width;

    public IImageReaderParameterSets(int i, int i2, int i3, int i4, int i5) {
        this.width = i;
        this.height = i2;
        this.format = i3;
        this.maxImages = i4;
        this.targetCamera = i5;
    }

    public boolean isShouldHoldImages() {
        return this.shouldHoldImages;
    }

    public void setShouldHoldImages(boolean z) {
        this.shouldHoldImages = z;
    }

    public String toString() {
        return String.format(Locale.ENGLISH, "IImageReaderParameterSets[ %d, %d, %d, %d, %s, %s]", new Object[]{Integer.valueOf(this.width), Integer.valueOf(this.height), Integer.valueOf(this.format), Integer.valueOf(this.maxImages), Integer.valueOf(this.targetCamera), Boolean.valueOf(this.shouldHoldImages)});
    }

    public boolean equals(Object obj) {
        if (!(obj instanceof IImageReaderParameterSets)) {
            return super.equals(obj);
        }
        IImageReaderParameterSets iImageReaderParameterSets = (IImageReaderParameterSets) obj;
        boolean z = this.targetCamera == iImageReaderParameterSets.targetCamera && this.width == iImageReaderParameterSets.width && this.height == iImageReaderParameterSets.height && this.format == iImageReaderParameterSets.format && this.maxImages == iImageReaderParameterSets.maxImages && this.shouldHoldImages == iImageReaderParameterSets.shouldHoldImages;
        return z;
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
        parcel.writeByte(this.shouldHoldImages);
    }

    protected IImageReaderParameterSets(Parcel parcel) {
        boolean z = true;
        this.width = parcel.readInt();
        this.height = parcel.readInt();
        this.format = parcel.readInt();
        this.maxImages = parcel.readInt();
        this.targetCamera = parcel.readInt();
        if (parcel.readByte() == (byte) 0) {
            z = false;
        }
        this.shouldHoldImages = z;
    }
}
