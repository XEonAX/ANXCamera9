package com.android.camera.watermark;

import android.graphics.Bitmap;
import android.graphics.RectF;
import android.os.Parcel;
import android.os.Parcelable;
import android.os.Parcelable.Creator;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;

public class WaterMarkData implements Parcelable {
    public static final Creator<WaterMarkData> CREATOR = new Creator<WaterMarkData>() {
        public WaterMarkData createFromParcel(Parcel parcel) {
            return new WaterMarkData(parcel);
        }

        public WaterMarkData[] newArray(int i) {
            return new WaterMarkData[i];
        }
    };
    private int bottomMargin;
    private RectF faceRectF;
    private int faceViewHeight;
    private int faceViewWidth;
    private transient Bitmap image;
    private String info;
    private boolean isFemale;
    private int orientation;
    private int watermarkType = 0;

    @Retention(RetentionPolicy.SOURCE)
    public @interface WatermarkType {
        public static final int AGE_GENDER = 2;
        public static final int MAGIC_MIRROR = 1;
        public static final int NONE = 0;
    }

    protected WaterMarkData(Parcel parcel) {
        boolean z = false;
        if (parcel.readByte() != (byte) 0) {
            z = true;
        }
        this.isFemale = z;
        this.image = (Bitmap) parcel.readParcelable(Bitmap.class.getClassLoader());
        this.faceRectF = (RectF) parcel.readParcelable(RectF.class.getClassLoader());
        this.info = parcel.readString();
        this.bottomMargin = parcel.readInt();
        this.faceViewWidth = parcel.readInt();
        this.faceViewHeight = parcel.readInt();
        this.orientation = parcel.readInt();
        this.watermarkType = parcel.readInt();
    }

    public boolean isFemale() {
        return this.isFemale;
    }

    public void setFemale(boolean z) {
        this.isFemale = z;
    }

    public Bitmap getImage() {
        return this.image;
    }

    public void setImage(Bitmap bitmap) {
        this.image = bitmap;
    }

    public RectF getFaceRectF() {
        return this.faceRectF;
    }

    public void setFaceRectF(RectF rectF) {
        this.faceRectF = rectF;
    }

    public String getInfo() {
        return this.info;
    }

    public void setInfo(String str) {
        this.info = str;
    }

    public int getBottomMargin() {
        return this.bottomMargin;
    }

    public void setBottomMargin(int i) {
        this.bottomMargin = i;
    }

    public int getFaceViewWidth() {
        return this.faceViewWidth;
    }

    public void setFaceViewWidth(int i) {
        this.faceViewWidth = i;
    }

    public int getFaceViewHeight() {
        return this.faceViewHeight;
    }

    public void setFaceViewHeight(int i) {
        this.faceViewHeight = i;
    }

    public int getOrientation() {
        return this.orientation;
    }

    public void setOrientation(int i) {
        this.orientation = i;
    }

    public int getWatermarkType() {
        return this.watermarkType;
    }

    public void setWatermarkType(int i) {
        this.watermarkType = i;
    }

    public int describeContents() {
        return 0;
    }

    public void writeToParcel(Parcel parcel, int i) {
        parcel.writeByte((byte) this.isFemale);
        parcel.writeParcelable(this.image, i);
        parcel.writeParcelable(this.faceRectF, i);
        parcel.writeString(this.info);
        parcel.writeInt(this.bottomMargin);
        parcel.writeInt(this.faceViewWidth);
        parcel.writeInt(this.faceViewHeight);
        parcel.writeInt(this.orientation);
        parcel.writeInt(this.watermarkType);
    }
}
