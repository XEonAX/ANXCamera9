package com.android.camera.effect;

import android.os.Parcel;
import android.os.Parcelable;
import android.os.Parcelable.Creator;
import java.util.Locale;

public class FaceAnalyzeInfo implements Parcelable {
    public static final Creator<FaceAnalyzeInfo> CREATOR = new Creator<FaceAnalyzeInfo>() {
        public FaceAnalyzeInfo createFromParcel(Parcel parcel) {
            return new FaceAnalyzeInfo(parcel);
        }

        public FaceAnalyzeInfo[] newArray(int i) {
            return new FaceAnalyzeInfo[i];
        }
    };
    public float[] mAge;
    public int mFaceNum;
    public float[] mFaceScore;
    public float[] mGender;
    public float[] mProp;

    public String toString() {
        return String.format(Locale.ENGLISH, "face num: %d | gender: %d | age: %d | facescore: %d", new Object[]{Integer.valueOf(this.mFaceNum), Float.valueOf(this.mGender[0]), Float.valueOf(this.mAge[0]), Float.valueOf(this.mFaceScore[0])});
    }

    public int describeContents() {
        return 0;
    }

    public void writeToParcel(Parcel parcel, int i) {
        parcel.writeInt(this.mFaceNum);
        parcel.writeFloatArray(this.mGender);
        parcel.writeFloatArray(this.mAge);
        parcel.writeFloatArray(this.mFaceScore);
        parcel.writeFloatArray(this.mProp);
    }

    protected FaceAnalyzeInfo(Parcel parcel) {
        this.mFaceNum = parcel.readInt();
        parcel.readFloatArray(this.mGender);
        parcel.readFloatArray(this.mAge);
        parcel.readFloatArray(this.mFaceScore);
        parcel.readFloatArray(this.mProp);
    }
}
