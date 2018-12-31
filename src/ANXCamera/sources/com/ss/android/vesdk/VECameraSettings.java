package com.ss.android.vesdk;

import android.os.Parcel;
import android.os.Parcelable;
import android.os.Parcelable.Creator;
import android.support.annotation.NonNull;
import com.android.camera.Util;
import com.ss.android.vesdk.runtime.cloudconfig.PerformanceConfig;

public class VECameraSettings implements Parcelable {
    public static final Creator<VECameraSettings> CREATOR = new Creator<VECameraSettings>() {
        public VECameraSettings createFromParcel(Parcel parcel) {
            return new VECameraSettings(parcel);
        }

        public VECameraSettings[] newArray(int i) {
            return new VECameraSettings[i];
        }
    };
    public static final byte OPTION_FLAG_DEFAULT = (byte) 1;
    public static final byte OPTION_FLAG_FPS_RANGE = (byte) 2;
    public static final byte OPTION_FLAG_PICTURE_SIZE = (byte) 1;
    public static final String SCENE_MODE_ACTION = "action";
    public static final String SCENE_MODE_AUTO = "auto";
    public static final String SCENE_MODE_BARCODE = "barcode";
    public static final String SCENE_MODE_BEACH = "beach";
    public static final String SCENE_MODE_CANDLELIGHT = "candlelight";
    public static final String SCENE_MODE_FIREWORKS = "fireworks";
    public static final String SCENE_MODE_HDR = "hdr";
    public static final String SCENE_MODE_LANDSCAPE = "landscape";
    public static final String SCENE_MODE_NIGHT = "night";
    public static final String SCENE_MODE_NIGHT_PORTRAIT = "night-portrait";
    public static final String SCENE_MODE_PARTY = "party";
    public static final String SCENE_MODE_PORTRAIT = "portrait";
    public static final String SCENE_MODE_SNOW = "snow";
    public static final String SCENE_MODE_SPORTS = "sports";
    public static final String SCENE_MODE_STEADYPHOTO = "steadyphoto";
    public static final String SCENE_MODE_SUNSET = "sunset";
    public static final String SCENE_MODE_THEATRE = "theatre";
    public static final String[] sCameraSceneMode = new String[]{"auto", SCENE_MODE_ACTION, SCENE_MODE_BARCODE, SCENE_MODE_BEACH, SCENE_MODE_CANDLELIGHT, SCENE_MODE_FIREWORKS, SCENE_MODE_HDR, SCENE_MODE_LANDSCAPE, SCENE_MODE_NIGHT, SCENE_MODE_NIGHT_PORTRAIT, SCENE_MODE_PARTY, "portrait", SCENE_MODE_SNOW, SCENE_MODE_SPORTS, SCENE_MODE_STEADYPHOTO, SCENE_MODE_SUNSET, SCENE_MODE_THEATRE};
    int[] CameraHWLevelAndroid2TE;
    int[] CameraHWLevelTE2Android;
    private CAMERA_FACING_ID mCameraFacing;
    private CAMERA_TYPE mCameraType;
    private int mFps;
    private int[] mFpsRange;
    private CAMERA_HW_LEVEL mHwLevel;
    private boolean mIsUseCloudConfig;
    private byte mOptionFlags;
    private VESize mPreviewSize;
    private String mSceneMode;

    public static class Builder {
        private CAMERA_FACING_ID mCameraFacing = CAMERA_FACING_ID.FACING_FRONT;
        private CAMERA_TYPE mCameraType = CAMERA_TYPE.TYPE1;
        private int mFps = 30;
        private int[] mFpsRange = new int[]{30, 30};
        private CAMERA_HW_LEVEL mHwLevel = CAMERA_HW_LEVEL.CAMERA_HW_LEVEL_LEGACY;
        private boolean mIsUseCloudConfig = false;
        public byte mOptionFlags = (byte) 1;
        private VESize mPreviewSize = new VESize(Util.LIMIT_SURFACE_WIDTH, 1280);
        private String mSceneMode = "auto";

        public Builder setCameraFacing(@NonNull CAMERA_FACING_ID camera_facing_id) {
            this.mCameraFacing = camera_facing_id;
            return this;
        }

        public Builder setCameraType(@NonNull CAMERA_TYPE camera_type) {
            this.mCameraType = camera_type;
            return this;
        }

        public Builder setPreviewSize(int i, int i2) {
            this.mPreviewSize = new VESize(i, i2);
            return this;
        }

        public Builder setFps(int i) {
            this.mFps = i;
            return this;
        }

        public Builder setHwLevel(@NonNull CAMERA_HW_LEVEL camera_hw_level) {
            this.mHwLevel = camera_hw_level;
            return this;
        }

        public Builder setFpsRange(@NonNull int[] iArr) {
            this.mFpsRange = iArr;
            return this;
        }

        public Builder setSceneMode(@NonNull String str) {
            this.mSceneMode = str;
            return this;
        }

        public Builder isUseCloudConfig(boolean z) {
            this.mIsUseCloudConfig = z;
            return this;
        }

        public Builder setOptionFlag(byte b) {
            this.mOptionFlags = b;
            return this;
        }

        public VECameraSettings build() {
            return new VECameraSettings(this, null);
        }
    }

    public enum CAMERA_FACING_ID implements Parcelable {
        FACING_BACK,
        FACING_FRONT,
        FACING_3RD;
        
        public static final Creator<CAMERA_FACING_ID> CREATOR = null;

        static {
            CREATOR = new Creator<CAMERA_FACING_ID>() {
                public CAMERA_FACING_ID createFromParcel(Parcel parcel) {
                    return CAMERA_FACING_ID.values()[parcel.readInt()];
                }

                public CAMERA_FACING_ID[] newArray(int i) {
                    return new CAMERA_FACING_ID[i];
                }
            };
        }

        public void writeToParcel(Parcel parcel, int i) {
            parcel.writeInt(ordinal());
        }

        public int describeContents() {
            return 0;
        }
    }

    public enum CAMERA_HW_LEVEL implements Parcelable {
        CAMERA_HW_LEVEL_LEGACY,
        CAMERA_HW_LEVEL_LIMITED,
        CAMERA_HW_LEVEL_FULL,
        CAMERA_HW_LEVEL_LEVEL_3;
        
        public static final Creator<CAMERA_HW_LEVEL> CREATOR = null;

        static {
            CREATOR = new Creator<CAMERA_HW_LEVEL>() {
                public CAMERA_HW_LEVEL createFromParcel(Parcel parcel) {
                    return CAMERA_HW_LEVEL.values()[parcel.readInt()];
                }

                public CAMERA_HW_LEVEL[] newArray(int i) {
                    return new CAMERA_HW_LEVEL[i];
                }
            };
        }

        public void writeToParcel(Parcel parcel, int i) {
            parcel.writeInt(ordinal());
        }

        public int describeContents() {
            return 0;
        }
    }

    public enum CAMERA_TYPE implements Parcelable {
        NULL,
        TYPE1,
        TYPE2,
        TYPE_HuaWei;
        
        public static final Creator<CAMERA_TYPE> CREATOR = null;

        static {
            CREATOR = new Creator<CAMERA_TYPE>() {
                public CAMERA_TYPE createFromParcel(Parcel parcel) {
                    return CAMERA_TYPE.values()[parcel.readInt()];
                }

                public CAMERA_TYPE[] newArray(int i) {
                    return new CAMERA_TYPE[i];
                }
            };
        }

        public void writeToParcel(Parcel parcel, int i) {
            parcel.writeInt(ordinal());
        }

        public int describeContents() {
            return 0;
        }
    }

    /* synthetic */ VECameraSettings(Builder builder, AnonymousClass1 anonymousClass1) {
        this(builder);
    }

    @Deprecated
    public VECameraSettings() {
        this.CameraHWLevelTE2Android = new int[]{2, 0, 1, 3};
        this.CameraHWLevelAndroid2TE = new int[]{1, 2, 0, 3};
        this.mFps = 30;
        this.mPreviewSize = new VESize(Util.LIMIT_SURFACE_WIDTH, 1280);
        this.mFpsRange = new int[]{30, 30};
        this.mHwLevel = CAMERA_HW_LEVEL.CAMERA_HW_LEVEL_LEGACY;
        this.mCameraType = CAMERA_TYPE.TYPE1;
        this.mCameraFacing = CAMERA_FACING_ID.FACING_FRONT;
        this.mSceneMode = "auto";
        this.mIsUseCloudConfig = false;
        this.mOptionFlags = (byte) 1;
        this.mCameraType = CAMERA_TYPE.TYPE1;
        this.mCameraFacing = CAMERA_FACING_ID.FACING_FRONT;
        this.mFps = 30;
        this.mPreviewSize.width = Util.LIMIT_SURFACE_WIDTH;
        this.mPreviewSize.height = 1280;
    }

    private VECameraSettings(Builder builder) {
        this.CameraHWLevelTE2Android = new int[]{2, 0, 1, 3};
        this.CameraHWLevelAndroid2TE = new int[]{1, 2, 0, 3};
        this.mFps = 30;
        this.mPreviewSize = new VESize(Util.LIMIT_SURFACE_WIDTH, 1280);
        this.mFpsRange = new int[]{30, 30};
        this.mHwLevel = CAMERA_HW_LEVEL.CAMERA_HW_LEVEL_LEGACY;
        this.mCameraType = CAMERA_TYPE.TYPE1;
        this.mCameraFacing = CAMERA_FACING_ID.FACING_FRONT;
        this.mSceneMode = "auto";
        this.mIsUseCloudConfig = false;
        this.mOptionFlags = (byte) 1;
        this.mCameraType = builder.mCameraType;
        this.mCameraFacing = builder.mCameraFacing;
        this.mFps = builder.mFps;
        this.mPreviewSize = builder.mPreviewSize;
        this.mHwLevel = builder.mHwLevel;
        this.mFpsRange = builder.mFpsRange;
        this.mSceneMode = builder.mSceneMode;
        this.mIsUseCloudConfig = builder.mIsUseCloudConfig;
        this.mOptionFlags = builder.mOptionFlags;
    }

    protected VECameraSettings(Parcel parcel) {
        this.CameraHWLevelTE2Android = new int[]{2, 0, 1, 3};
        this.CameraHWLevelAndroid2TE = new int[]{1, 2, 0, 3};
        this.mFps = 30;
        this.mPreviewSize = new VESize(Util.LIMIT_SURFACE_WIDTH, 1280);
        this.mFpsRange = new int[]{30, 30};
        this.mHwLevel = CAMERA_HW_LEVEL.CAMERA_HW_LEVEL_LEGACY;
        this.mCameraType = CAMERA_TYPE.TYPE1;
        this.mCameraFacing = CAMERA_FACING_ID.FACING_FRONT;
        this.mSceneMode = "auto";
        boolean z = false;
        this.mIsUseCloudConfig = false;
        this.mOptionFlags = (byte) 1;
        this.CameraHWLevelTE2Android = parcel.createIntArray();
        this.CameraHWLevelAndroid2TE = parcel.createIntArray();
        this.mFps = parcel.readInt();
        this.mPreviewSize = (VESize) parcel.readParcelable(VESize.class.getClassLoader());
        this.mFpsRange = parcel.createIntArray();
        this.mHwLevel = (CAMERA_HW_LEVEL) parcel.readParcelable(CAMERA_HW_LEVEL.class.getClassLoader());
        this.mCameraType = (CAMERA_TYPE) parcel.readParcelable(CAMERA_TYPE.class.getClassLoader());
        this.mCameraFacing = (CAMERA_FACING_ID) parcel.readParcelable(CAMERA_FACING_ID.class.getClassLoader());
        this.mSceneMode = parcel.readString();
        if (parcel.readByte() != (byte) 0) {
            z = true;
        }
        this.mIsUseCloudConfig = z;
        this.mOptionFlags = parcel.readByte();
    }

    public void writeToParcel(Parcel parcel, int i) {
        parcel.writeIntArray(this.CameraHWLevelTE2Android);
        parcel.writeIntArray(this.CameraHWLevelAndroid2TE);
        parcel.writeInt(this.mFps);
        parcel.writeParcelable(this.mPreviewSize, i);
        parcel.writeIntArray(this.mFpsRange);
        parcel.writeParcelable(this.mHwLevel, i);
        parcel.writeParcelable(this.mCameraType, i);
        parcel.writeParcelable(this.mCameraFacing, i);
        parcel.writeString(this.mSceneMode);
        parcel.writeByte((byte) this.mIsUseCloudConfig);
        parcel.writeByte(this.mOptionFlags);
    }

    public int describeContents() {
        return 0;
    }

    public void setCameraFacing(CAMERA_FACING_ID camera_facing_id) {
        this.mCameraFacing = camera_facing_id;
    }

    public CAMERA_FACING_ID getCameraFacing() {
        return this.mCameraFacing;
    }

    public void setCameraType(CAMERA_TYPE camera_type) {
        this.mCameraType = camera_type;
    }

    public CAMERA_TYPE getCameraType() {
        if (this.mIsUseCloudConfig && PerformanceConfig.sVECloudConfig != null) {
            if (PerformanceConfig.sVECloudConfig.mRecordCameraType == 1) {
                return CAMERA_TYPE.TYPE1;
            }
            if (PerformanceConfig.sVECloudConfig.mRecordCameraType == 2) {
                return CAMERA_TYPE.TYPE2;
            }
        }
        return this.mCameraType;
    }

    public void setPreviewSize(int i, int i2) {
        this.mPreviewSize = new VESize(i, i2);
    }

    VESize getPreviewSize() {
        if (!this.mIsUseCloudConfig || PerformanceConfig.sVECloudConfig == null) {
            return this.mPreviewSize;
        }
        return new VESize(PerformanceConfig.sVECloudConfig.mCameraPreviewResolutionWidth, PerformanceConfig.sVECloudConfig.mCameraPreviewResolutionHeight);
    }

    public void setFpsRange(int[] iArr) {
        this.mFpsRange = iArr;
    }

    public int[] getFpsRange() {
        return this.mFpsRange;
    }

    public int getFps() {
        return this.mFps;
    }

    public void setFps(int i) {
        this.mFps = i;
    }

    public CAMERA_HW_LEVEL getHwLevel() {
        return this.mHwLevel;
    }

    public void setHwLevel(CAMERA_HW_LEVEL camera_hw_level) {
        this.mHwLevel = camera_hw_level;
    }

    public String getSceneMode() {
        return this.mSceneMode;
    }

    public void setSceneMode(String str) {
        this.mSceneMode = str;
    }

    public void setIsUseCloudConfig(boolean z) {
        this.mIsUseCloudConfig = z;
    }

    public void setOptionFlag(byte b) {
        this.mOptionFlags = b;
    }

    public byte getOptionFlag() {
        return this.mOptionFlags;
    }
}
