package com.ss.android.vesdk;

import android.os.Parcel;
import android.os.Parcelable;
import android.os.Parcelable.Creator;
import android.support.annotation.NonNull;
import android.util.Log;
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
    public static final String TAG = VECameraSettings.class.getSimpleName();
    public static final String[] sCameraSceneMode = new String[]{"auto", SCENE_MODE_ACTION, SCENE_MODE_BARCODE, SCENE_MODE_BEACH, SCENE_MODE_CANDLELIGHT, SCENE_MODE_FIREWORKS, SCENE_MODE_HDR, SCENE_MODE_LANDSCAPE, SCENE_MODE_NIGHT, SCENE_MODE_NIGHT_PORTRAIT, SCENE_MODE_PARTY, "portrait", SCENE_MODE_SNOW, SCENE_MODE_SPORTS, SCENE_MODE_STEADYPHOTO, SCENE_MODE_SUNSET, SCENE_MODE_THEATRE};
    int[] CameraHWLevelAndroid2TE;
    int[] CameraHWLevelTE2Android;
    private CAMERA_FACING_ID mCameraFacing;
    private CAMERA_TYPE mCameraType;
    private VESize mCaptureSize;
    private int mFps;
    private int[] mFpsRange;
    private CAMERA_HW_LEVEL mHwLevel;
    private byte mOptionFlags;
    private CAMERA_OUTPUT_MODE mOutputMode;
    private VESize mPreviewSize;
    private String mSceneMode;

    public static class Builder {
        private VECameraSettings mExportCameraSettings;

        public Builder() {
            this.mExportCameraSettings = new VECameraSettings();
        }

        public Builder(VECameraSettings vECameraSettings) {
            this.mExportCameraSettings = vECameraSettings;
        }

        public Builder setCameraFacing(@NonNull CAMERA_FACING_ID camera_facing_id) {
            this.mExportCameraSettings.mCameraFacing = camera_facing_id;
            return this;
        }

        public Builder setCameraType(@NonNull CAMERA_TYPE camera_type) {
            this.mExportCameraSettings.mCameraType = camera_type;
            return this;
        }

        public Builder setPreviewSize(int i, int i2) {
            this.mExportCameraSettings.mPreviewSize = new VESize(i, i2);
            return this;
        }

        public Builder setFps(int i) {
            this.mExportCameraSettings.mFps = i;
            return this;
        }

        public Builder setHwLevel(@NonNull CAMERA_HW_LEVEL camera_hw_level) {
            this.mExportCameraSettings.mHwLevel = camera_hw_level;
            return this;
        }

        public Builder setFpsRange(@NonNull int[] iArr) {
            this.mExportCameraSettings.mFpsRange = iArr;
            return this;
        }

        public Builder setSceneMode(@NonNull String str) {
            this.mExportCameraSettings.mSceneMode = str;
            return this;
        }

        public Builder setOptionFlag(byte b) {
            this.mExportCameraSettings.mOptionFlags = b;
            return this;
        }

        public Builder setCaptureSize(int i, int i2) {
            this.mExportCameraSettings.mCaptureSize = new VESize(i, i2);
            return this;
        }

        public Builder setOutPutMode(CAMERA_OUTPUT_MODE camera_output_mode) {
            this.mExportCameraSettings.mOutputMode = camera_output_mode;
            return this;
        }

        public Builder overrideWithCloudConfig() {
            if (PerformanceConfig.sVECloudConfig == null) {
                Log.e(getClass().getSimpleName(), "Override with Cloud Configs failed. CloudConfig == null");
            }
            this.mExportCameraSettings.mCameraType = getCameraTypeFromCloudConfig();
            this.mExportCameraSettings.mHwLevel = getCameraHwLevelFromCloudConfig();
            this.mExportCameraSettings.mPreviewSize = new VESize(PerformanceConfig.sVECloudConfig.mCameraPreviewResolutionWidth, PerformanceConfig.sVECloudConfig.mCameraPreviewResolutionHeight);
            return this;
        }

        public VECameraSettings build() {
            return this.mExportCameraSettings;
        }

        private CAMERA_TYPE getCameraTypeFromCloudConfig() {
            switch (PerformanceConfig.sVECloudConfig.mRecordCameraType) {
                case 1:
                    return CAMERA_TYPE.TYPE1;
                case 2:
                    return CAMERA_TYPE.TYPE2;
                default:
                    String str = VECameraSettings.TAG;
                    StringBuilder stringBuilder = new StringBuilder();
                    stringBuilder.append("Fetch unexpected cameraType = ");
                    stringBuilder.append(PerformanceConfig.sVECloudConfig.mRecordCameraType);
                    Log.e(str, stringBuilder.toString());
                    return this.mExportCameraSettings.mCameraType;
            }
        }

        private CAMERA_HW_LEVEL getCameraHwLevelFromCloudConfig() {
            switch (PerformanceConfig.sVECloudConfig.mRecordCameraCompatLevel) {
                case 0:
                    return CAMERA_HW_LEVEL.CAMERA_HW_LEVEL_LEGACY;
                case 1:
                    return CAMERA_HW_LEVEL.CAMERA_HW_LEVEL_LIMITED;
                case 2:
                    return CAMERA_HW_LEVEL.CAMERA_HW_LEVEL_FULL;
                case 3:
                    return CAMERA_HW_LEVEL.CAMERA_HW_LEVEL_LEVEL_3;
                default:
                    String str = VECameraSettings.TAG;
                    StringBuilder stringBuilder = new StringBuilder();
                    stringBuilder.append("Fetch unexpected cameraLevel = ");
                    stringBuilder.append(PerformanceConfig.sVECloudConfig.mRecordCameraCompatLevel);
                    Log.e(str, stringBuilder.toString());
                    return this.mExportCameraSettings.mHwLevel;
            }
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

    public enum CAMERA_FLASH_MODE implements Parcelable {
        CAMERA_FLASH_OFF,
        CAMERA_FLASH_ON,
        CAMERA_FLASH_TORCH,
        CAMERA_FLASH_AUTO,
        CAMERA_FLASH_RED_EYE;
        
        public static final Creator<CAMERA_FLASH_MODE> CREATOR = null;

        static {
            CREATOR = new Creator<CAMERA_FLASH_MODE>() {
                public CAMERA_FLASH_MODE createFromParcel(Parcel parcel) {
                    return CAMERA_FLASH_MODE.values()[parcel.readInt()];
                }

                public CAMERA_FLASH_MODE[] newArray(int i) {
                    return new CAMERA_FLASH_MODE[i];
                }
            };
        }

        public int describeContents() {
            return 0;
        }

        public void writeToParcel(Parcel parcel, int i) {
            parcel.writeInt(ordinal());
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

    public enum CAMERA_OUTPUT_MODE implements Parcelable {
        SURFACE,
        FRAME;
        
        public static final Creator<CAMERA_OUTPUT_MODE> CREATOR = null;

        static {
            CREATOR = new Creator<CAMERA_OUTPUT_MODE>() {
                public CAMERA_OUTPUT_MODE createFromParcel(Parcel parcel) {
                    return CAMERA_OUTPUT_MODE.values()[parcel.readInt()];
                }

                public CAMERA_OUTPUT_MODE[] newArray(int i) {
                    return new CAMERA_OUTPUT_MODE[i];
                }
            };
        }

        public int describeContents() {
            return 0;
        }

        public void writeToParcel(Parcel parcel, int i) {
            parcel.writeInt(ordinal());
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

    private VECameraSettings() {
        this.CameraHWLevelTE2Android = new int[]{2, 0, 1, 3};
        this.CameraHWLevelAndroid2TE = new int[]{1, 2, 0, 3};
        this.mFps = 30;
        this.mPreviewSize = new VESize(Util.LIMIT_SURFACE_WIDTH, 1280);
        this.mFpsRange = new int[]{30, 30};
        this.mHwLevel = CAMERA_HW_LEVEL.CAMERA_HW_LEVEL_LEGACY;
        this.mCameraType = CAMERA_TYPE.TYPE1;
        this.mCameraFacing = CAMERA_FACING_ID.FACING_FRONT;
        this.mSceneMode = "auto";
        this.mOptionFlags = (byte) 1;
        this.mCaptureSize = new VESize(-1, -1);
        this.mOutputMode = CAMERA_OUTPUT_MODE.SURFACE;
        this.mCameraType = CAMERA_TYPE.TYPE1;
        this.mCameraFacing = CAMERA_FACING_ID.FACING_FRONT;
        this.mFps = 30;
        this.mPreviewSize.width = Util.LIMIT_SURFACE_WIDTH;
        this.mPreviewSize.height = 1280;
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
        this.mOptionFlags = (byte) 1;
        this.mCaptureSize = new VESize(-1, -1);
        this.mOutputMode = CAMERA_OUTPUT_MODE.SURFACE;
        this.CameraHWLevelTE2Android = parcel.createIntArray();
        this.CameraHWLevelAndroid2TE = parcel.createIntArray();
        this.mFps = parcel.readInt();
        this.mPreviewSize = (VESize) parcel.readParcelable(VESize.class.getClassLoader());
        this.mFpsRange = parcel.createIntArray();
        this.mHwLevel = (CAMERA_HW_LEVEL) parcel.readParcelable(CAMERA_HW_LEVEL.class.getClassLoader());
        this.mCameraType = (CAMERA_TYPE) parcel.readParcelable(CAMERA_TYPE.class.getClassLoader());
        this.mCameraFacing = (CAMERA_FACING_ID) parcel.readParcelable(CAMERA_FACING_ID.class.getClassLoader());
        this.mSceneMode = parcel.readString();
        this.mOptionFlags = parcel.readByte();
        this.mCaptureSize = (VESize) parcel.readParcelable(VESize.class.getClassLoader());
        this.mOutputMode = (CAMERA_OUTPUT_MODE) parcel.readParcelable(CAMERA_OUTPUT_MODE.class.getClassLoader());
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
        parcel.writeByte(this.mOptionFlags);
        parcel.writeParcelable(this.mCaptureSize, i);
        parcel.writeParcelable(this.mOutputMode, i);
    }

    public int describeContents() {
        return 0;
    }

    public CAMERA_FACING_ID getCameraFacing() {
        return this.mCameraFacing;
    }

    public CAMERA_TYPE getCameraType() {
        return this.mCameraType;
    }

    VESize getPreviewSize() {
        return this.mPreviewSize;
    }

    public int[] getFpsRange() {
        return this.mFpsRange;
    }

    public int getFps() {
        return this.mFps;
    }

    public CAMERA_HW_LEVEL getHwLevel() {
        return this.mHwLevel;
    }

    public String getSceneMode() {
        return this.mSceneMode;
    }

    public byte getOptionFlag() {
        return this.mOptionFlags;
    }

    public VESize getCaptureSize() {
        return this.mCaptureSize;
    }

    public CAMERA_OUTPUT_MODE getOutputMode() {
        return this.mOutputMode;
    }

    public void setCameraFacing(CAMERA_FACING_ID camera_facing_id) {
        this.mCameraFacing = camera_facing_id;
    }

    public void setCameraType(CAMERA_TYPE camera_type) {
        this.mCameraType = camera_type;
    }

    public void setPreviewSize(int i, int i2) {
        this.mPreviewSize = new VESize(i, i2);
    }

    public void setFps(int i) {
        this.mFps = i;
    }

    public void setFpsRange(int[] iArr) {
        this.mFpsRange = iArr;
    }

    public void setHwLevel(CAMERA_HW_LEVEL camera_hw_level) {
        this.mHwLevel = camera_hw_level;
    }

    public void setSceneMode(String str) {
        this.mSceneMode = str;
    }

    public void setOptionFlag(byte b) {
        this.mOptionFlags = b;
    }
}
