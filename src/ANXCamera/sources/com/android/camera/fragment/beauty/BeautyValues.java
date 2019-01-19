package com.android.camera.fragment.beauty;

import android.os.Parcel;
import android.os.Parcelable;
import android.os.Parcelable.Creator;
import com.android.camera.fragment.beauty.BeautyParameters.Type;
import com.mi.config.b;
import java.util.Locale;

public class BeautyValues implements Parcelable {
    public static final Creator<BeautyValues> CREATOR = new Creator<BeautyValues>() {
        public BeautyValues createFromParcel(Parcel parcel) {
            return new BeautyValues(parcel);
        }

        public BeautyValues[] newArray(int i) {
            return new BeautyValues[i];
        }
    };
    public int mBeautyBlusher;
    public int mBeautyBodySlim;
    public int mBeautyChin;
    public int mBeautyEnlargeEye;
    public int mBeautyEyebrowDye;
    public int mBeautyHeadSlim;
    public int mBeautyJellyLips;
    public int mBeautyLegSlim;
    public String mBeautyLevel;
    public int mBeautyLips;
    public int mBeautyNeck;
    public int mBeautyNose;
    public int mBeautyPupilLine;
    public int mBeautyRisorius;
    public int mBeautyShoulderSlim;
    public int mBeautySkinColor;
    public int mBeautySkinSmooth;
    public int mBeautySlimFace;
    public int mBeautySlimNose;
    public int mBeautySmile;

    public String toString() {
        if (b.hL()) {
            return String.format(Locale.ENGLISH, "3d beauty level: %s | sf: %d | ee: %d | ns: %d | rs: %d | lp: %d | cn: %d | nk: %d | se: %d | sn: %d | ed: %d | pl: %d | jl: %d | blusher: %d| headSlim: %d | bodySlim: %d | shoulderSlim: %d | legSlim: %d ", new Object[]{this.mBeautyLevel, Integer.valueOf(this.mBeautySlimFace), Integer.valueOf(this.mBeautyEnlargeEye), Integer.valueOf(this.mBeautyNose), Integer.valueOf(this.mBeautyRisorius), Integer.valueOf(this.mBeautyLips), Integer.valueOf(this.mBeautyChin), Integer.valueOf(this.mBeautyNeck), Integer.valueOf(this.mBeautySmile), Integer.valueOf(this.mBeautySlimNose), Integer.valueOf(this.mBeautyEyebrowDye), Integer.valueOf(this.mBeautyPupilLine), Integer.valueOf(this.mBeautyJellyLips), Integer.valueOf(this.mBeautyBlusher), Integer.valueOf(this.mBeautyHeadSlim), Integer.valueOf(this.mBeautyBodySlim), Integer.valueOf(this.mBeautyShoulderSlim), Integer.valueOf(this.mBeautyLegSlim)});
        }
        return String.format(Locale.ENGLISH, "beauty level: %s | sc: %d | sf: %d | ss: %d | ee: %d ", new Object[]{this.mBeautyLevel, Integer.valueOf(this.mBeautySkinColor), Integer.valueOf(this.mBeautySlimFace), Integer.valueOf(this.mBeautySkinSmooth), Integer.valueOf(this.mBeautyEnlargeEye)});
    }

    public int describeContents() {
        return 0;
    }

    public void writeToParcel(Parcel parcel, int i) {
        parcel.writeString(this.mBeautyLevel);
        if (b.hL()) {
            parcel.writeInt(this.mBeautySlimFace);
            parcel.writeInt(this.mBeautyEnlargeEye);
            parcel.writeInt(this.mBeautyNose);
            parcel.writeInt(this.mBeautyRisorius);
            parcel.writeInt(this.mBeautyLips);
            parcel.writeInt(this.mBeautyChin);
            parcel.writeInt(this.mBeautyNeck);
            parcel.writeInt(this.mBeautySmile);
            parcel.writeInt(this.mBeautySlimNose);
            parcel.writeInt(this.mBeautyEyebrowDye);
            parcel.writeInt(this.mBeautyPupilLine);
            parcel.writeInt(this.mBeautyJellyLips);
            parcel.writeInt(this.mBeautyBlusher);
            parcel.writeInt(this.mBeautyHeadSlim);
            parcel.writeInt(this.mBeautyBodySlim);
            parcel.writeInt(this.mBeautyShoulderSlim);
            parcel.writeInt(this.mBeautyLegSlim);
            return;
        }
        parcel.writeInt(this.mBeautySkinColor);
        parcel.writeInt(this.mBeautySlimFace);
        parcel.writeInt(this.mBeautySkinSmooth);
        parcel.writeInt(this.mBeautyEnlargeEye);
    }

    public BeautyValues(BeautyValues beautyValues) {
        if (beautyValues != null) {
            this.mBeautyLevel = beautyValues.mBeautyLevel;
            this.mBeautySkinColor = beautyValues.mBeautySkinColor;
            this.mBeautySlimFace = beautyValues.mBeautySlimFace;
            this.mBeautySkinSmooth = beautyValues.mBeautySkinSmooth;
            this.mBeautyEnlargeEye = beautyValues.mBeautyEnlargeEye;
            this.mBeautyNose = beautyValues.mBeautyNose;
            this.mBeautyRisorius = beautyValues.mBeautyRisorius;
            this.mBeautyLips = beautyValues.mBeautyLips;
            this.mBeautyChin = beautyValues.mBeautyChin;
            this.mBeautyNeck = beautyValues.mBeautyNeck;
            this.mBeautySmile = beautyValues.mBeautySmile;
            this.mBeautySlimNose = beautyValues.mBeautySlimNose;
            this.mBeautyEyebrowDye = beautyValues.mBeautyEyebrowDye;
            this.mBeautyPupilLine = beautyValues.mBeautyPupilLine;
            this.mBeautyJellyLips = beautyValues.mBeautyJellyLips;
            this.mBeautyBlusher = beautyValues.mBeautyBlusher;
            this.mBeautyHeadSlim = beautyValues.mBeautyHeadSlim;
            this.mBeautyBodySlim = beautyValues.mBeautyBodySlim;
            this.mBeautyShoulderSlim = beautyValues.mBeautyShoulderSlim;
            this.mBeautyLegSlim = beautyValues.mBeautyLegSlim;
        }
    }

    protected BeautyValues(Parcel parcel) {
        this.mBeautyLevel = parcel.readString();
        if (b.hL()) {
            this.mBeautySlimFace = parcel.readInt();
            this.mBeautyEnlargeEye = parcel.readInt();
            this.mBeautyNose = parcel.readInt();
            this.mBeautyRisorius = parcel.readInt();
            this.mBeautyLips = parcel.readInt();
            this.mBeautyChin = parcel.readInt();
            this.mBeautyNeck = parcel.readInt();
            this.mBeautySmile = parcel.readInt();
            this.mBeautySlimNose = parcel.readInt();
            this.mBeautyEyebrowDye = parcel.readInt();
            this.mBeautyPupilLine = parcel.readInt();
            this.mBeautyJellyLips = parcel.readInt();
            this.mBeautyBlusher = parcel.readInt();
            this.mBeautyHeadSlim = parcel.readInt();
            this.mBeautyBodySlim = parcel.readInt();
            this.mBeautyShoulderSlim = parcel.readInt();
            this.mBeautyLegSlim = parcel.readInt();
            return;
        }
        this.mBeautySkinColor = parcel.readInt();
        this.mBeautySlimFace = parcel.readInt();
        this.mBeautySkinSmooth = parcel.readInt();
        this.mBeautyEnlargeEye = parcel.readInt();
    }

    public int get(Type type) {
        switch (type) {
            case WHITEN_STRENGTH:
                return this.mBeautySkinColor;
            case SHRINK_FACE_RATIO:
                return this.mBeautySlimFace;
            case ENLARGE_EYE_RATIO:
                return this.mBeautyEnlargeEye;
            case SMOOTH_STRENGTH:
                return this.mBeautySkinSmooth;
            case NOSE_RATIO:
                return this.mBeautyNose;
            case RISORIUS_RATIO:
                return this.mBeautyRisorius;
            case LIPS_RATIO:
                return this.mBeautyLips;
            case CHIN_RATIO:
                return this.mBeautyChin;
            case NECK_RATIO:
                return this.mBeautyNeck;
            case SMILE_RATIO:
                return this.mBeautySmile;
            case SLIM_NOSE_RATIO:
                return this.mBeautySlimNose;
            case EYEBROW_DYE_RATIO:
                return this.mBeautyEyebrowDye;
            case PUPIL_LINE_RATIO:
                return this.mBeautyPupilLine;
            case JELLY_LIPS_RATIO:
                return this.mBeautyJellyLips;
            case BLUSHER_RATIO:
                return this.mBeautyBlusher;
            case HEAD_SLIM_RATIO:
                return this.mBeautyHeadSlim;
            case BODY_SLIM_RATIO:
                return this.mBeautyBodySlim;
            case SHOULDER_SLIM_RATIO:
                return this.mBeautyShoulderSlim;
            case LEG_SLIM_RATIO:
                return this.mBeautyLegSlim;
            default:
                return 0;
        }
    }
}
