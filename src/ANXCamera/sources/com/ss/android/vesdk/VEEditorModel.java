package com.ss.android.vesdk;

import android.os.Parcel;
import android.os.Parcelable;
import android.os.Parcelable.Creator;
import android.support.annotation.ColorInt;
import com.ss.android.vesdk.VEEditor.VIDEO_RATIO;

public class VEEditorModel implements Parcelable {
    public static final Creator<VEEditorModel> CREATOR = new Creator<VEEditorModel>() {
        public VEEditorModel createFromParcel(Parcel parcel) {
            return new VEEditorModel(parcel);
        }

        public VEEditorModel[] newArray(int i) {
            return new VEEditorModel[i];
        }
    };
    public int audioEffectFilterIndex;
    public String[] audioPaths;
    @ColorInt
    public int backgroundColor;
    public int colorFilterIndex;
    public float colorFilterIntensity;
    public String colorFilterLeftPath;
    public float colorFilterPosition;
    public String colorFilterRightPath;
    public int inPoint;
    public int masterTrackIndex;
    public String modelDir;
    public String outputFile;
    public int outputPoint;
    public String projectXML;
    public boolean reverseDone;
    public boolean separateAV;
    public String[] transitions;
    public VIDEO_RATIO videoOutRes;
    public String[] videoPaths;
    public String watermarkFile;
    public double watermarkHeight;
    public double watermarkOffsetX;
    public double watermarkOffsetY;
    public double watermarkWidth;

    protected VEEditorModel(Parcel parcel) {
        this.projectXML = parcel.readString();
        this.inPoint = parcel.readInt();
        this.outputPoint = parcel.readInt();
        boolean z = false;
        this.reverseDone = parcel.readInt() == 1;
        this.videoOutRes = VIDEO_RATIO.values()[parcel.readInt()];
        if (parcel.readInt() == 1) {
            z = true;
        }
        this.separateAV = z;
        this.masterTrackIndex = parcel.readInt();
        this.audioEffectFilterIndex = parcel.readInt();
        this.modelDir = parcel.readString();
        this.colorFilterIndex = parcel.readInt();
        int readInt = parcel.readInt();
        if (readInt != -1) {
            this.videoPaths = new String[readInt];
            parcel.readStringArray(this.videoPaths);
        } else {
            this.videoPaths = null;
        }
        readInt = parcel.readInt();
        if (readInt != -1) {
            this.audioPaths = new String[readInt];
            parcel.readStringArray(this.audioPaths);
        } else {
            this.audioPaths = null;
        }
        readInt = parcel.readInt();
        if (readInt != -1) {
            this.transitions = new String[readInt];
            parcel.readStringArray(this.transitions);
        } else {
            this.transitions = null;
        }
        this.backgroundColor = parcel.readInt();
        this.outputFile = parcel.readString();
        this.watermarkFile = parcel.readString();
        this.watermarkWidth = parcel.readDouble();
        this.watermarkHeight = parcel.readDouble();
        this.watermarkOffsetX = parcel.readDouble();
        this.watermarkOffsetY = parcel.readDouble();
        this.colorFilterLeftPath = parcel.readString();
        this.colorFilterRightPath = parcel.readString();
        this.colorFilterPosition = parcel.readFloat();
        this.colorFilterIntensity = parcel.readFloat();
    }

    public int describeContents() {
        return 0;
    }

    public void writeToParcel(Parcel parcel, int i) {
        parcel.writeString(this.projectXML);
        parcel.writeInt(this.inPoint);
        parcel.writeInt(this.outputPoint);
        parcel.writeInt(this.reverseDone);
        parcel.writeInt(this.videoOutRes.ordinal());
        parcel.writeInt(this.separateAV);
        parcel.writeInt(this.masterTrackIndex);
        parcel.writeInt(this.audioEffectFilterIndex);
        parcel.writeString(this.modelDir);
        parcel.writeInt(this.colorFilterIndex);
        if (this.videoPaths != null) {
            parcel.writeInt(this.videoPaths.length);
            parcel.writeStringArray(this.videoPaths);
        } else {
            parcel.writeInt(-1);
        }
        if (this.audioPaths != null) {
            parcel.writeInt(this.audioPaths.length);
            parcel.writeStringArray(this.audioPaths);
        } else {
            parcel.writeInt(-1);
        }
        if (this.transitions != null) {
            parcel.writeInt(this.transitions.length);
            parcel.writeStringArray(this.transitions);
        } else {
            parcel.writeInt(-1);
        }
        parcel.writeInt(this.backgroundColor);
        parcel.writeString(this.outputFile);
        parcel.writeString(this.watermarkFile);
        parcel.writeDouble(this.watermarkWidth);
        parcel.writeDouble(this.watermarkHeight);
        parcel.writeDouble(this.watermarkOffsetX);
        parcel.writeDouble(this.watermarkOffsetY);
        parcel.writeString(this.colorFilterLeftPath);
        parcel.writeString(this.colorFilterRightPath);
        parcel.writeFloat(this.colorFilterPosition);
        parcel.writeFloat(this.colorFilterIntensity);
    }
}
