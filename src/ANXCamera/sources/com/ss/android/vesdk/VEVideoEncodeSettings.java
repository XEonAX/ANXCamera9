package com.ss.android.vesdk;

import android.os.Parcel;
import android.os.Parcelable;
import android.os.Parcelable.Creator;
import android.support.annotation.IntRange;
import android.support.annotation.NonNull;
import android.util.Log;
import com.android.camera.ui.drawable.PanoramaArrowAnimateDrawable;
import com.ss.android.vesdk.runtime.cloudconfig.PerformanceConfig;
import com.ss.android.vesdk.runtime.cloudconfig.VECloudConfig;

public class VEVideoEncodeSettings implements Parcelable {
    public static final Creator<VEVideoEncodeSettings> CREATOR = new Creator<VEVideoEncodeSettings>() {
        public VEVideoEncodeSettings createFromParcel(Parcel parcel) {
            return new VEVideoEncodeSettings(parcel);
        }

        public VEVideoEncodeSettings[] newArray(int i) {
            return new VEVideoEncodeSettings[i];
        }
    };
    public static final int USAGE_COMPILE = 2;
    public static final int USAGE_IMPORT = 3;
    public static final int USAGE_RECORD = 1;
    private ENCODE_BITRATE_MODE bitrateMode;
    private int bps;
    public COMPILE_TYPE compileType;
    private int encodeProfile;
    private int encodeStandard;
    private int fps;
    private int gopSize;
    private boolean hasBFrame;
    private VEWatermarkParam mWatermarkParam;
    private VESize outputSize;
    private int resizeMode;
    private float resizeX;
    private float resizeY;
    private int rotate;
    private float speed;
    private int swCRF;
    private int swMaxrate;
    private int swPreset;
    private int swQP;
    private boolean useHWEncoder;

    public static class Builder {
        private VEVideoEncodeSettings exportVideoEncodeSettings;
        private boolean mIsEncodeModeDeclared;
        private int mUsage;

        public Builder() {
            this.mIsEncodeModeDeclared = false;
            this.mUsage = 1;
            this.exportVideoEncodeSettings = new VEVideoEncodeSettings();
        }

        public Builder(@IntRange(from = 1, to = 3) int i) {
            this.mIsEncodeModeDeclared = false;
            this.mUsage = i;
            this.exportVideoEncodeSettings = new VEVideoEncodeSettings();
        }

        public Builder(@IntRange(from = 1, to = 3) int i, @NonNull VEVideoEncodeSettings vEVideoEncodeSettings) {
            this.mIsEncodeModeDeclared = false;
            this.mUsage = i;
            this.exportVideoEncodeSettings = vEVideoEncodeSettings;
            this.mIsEncodeModeDeclared = true;
        }

        public Builder setFps(int i) {
            this.exportVideoEncodeSettings.fps = i;
            return this;
        }

        public Builder setVideoBitrate(ENCODE_BITRATE_MODE encode_bitrate_mode, int i) {
            this.exportVideoEncodeSettings.bitrateMode = encode_bitrate_mode;
            switch (encode_bitrate_mode) {
                case ENCODE_BITRATE_ABR:
                    this.exportVideoEncodeSettings.bps = i;
                    break;
                case ENCODE_BITRATE_CRF:
                    this.exportVideoEncodeSettings.swCRF = i;
                    break;
                case ENCODE_BITRATE_QP:
                    this.exportVideoEncodeSettings.swQP = i;
                    break;
                case ENCODE_BITRATE_VBR:
                    this.exportVideoEncodeSettings.bps = i;
                    break;
                default:
                    StringBuilder stringBuilder = new StringBuilder();
                    stringBuilder.append("CompileTime BUG. Unhandled enum value ");
                    stringBuilder.append(encode_bitrate_mode.toString());
                    throw new IllegalStateException(stringBuilder.toString());
            }
            return this;
        }

        public Builder setBps(int i) {
            this.exportVideoEncodeSettings.bitrateMode = ENCODE_BITRATE_MODE.ENCODE_BITRATE_ABR;
            this.exportVideoEncodeSettings.bps = i;
            return this;
        }

        public Builder setSWCRF(int i) {
            this.exportVideoEncodeSettings.bitrateMode = ENCODE_BITRATE_MODE.ENCODE_BITRATE_CRF;
            this.exportVideoEncodeSettings.swCRF = i;
            return this;
        }

        public Builder setQP(int i) {
            this.exportVideoEncodeSettings.bitrateMode = ENCODE_BITRATE_MODE.ENCODE_BITRATE_QP;
            this.exportVideoEncodeSettings.swQP = i;
            return this;
        }

        public Builder setVideoRes(int i, int i2) {
            this.exportVideoEncodeSettings.outputSize.width = i;
            this.exportVideoEncodeSettings.outputSize.height = i2;
            return this;
        }

        public Builder setRotate(int i) {
            this.exportVideoEncodeSettings.rotate = i;
            return this;
        }

        public Builder setResizeMode(int i) {
            this.exportVideoEncodeSettings.resizeMode = i;
            return this;
        }

        public Builder setResizeX(float f) {
            this.exportVideoEncodeSettings.resizeX = f;
            return this;
        }

        public Builder setResizeY(float f) {
            this.exportVideoEncodeSettings.resizeY = f;
            return this;
        }

        public Builder setHwEnc(boolean z) {
            this.exportVideoEncodeSettings.useHWEncoder = z;
            this.mIsEncodeModeDeclared = true;
            return this;
        }

        public Builder setGopSize(int i) {
            this.exportVideoEncodeSettings.gopSize = i;
            return this;
        }

        public Builder setEncodePreset(@NonNull ENCODE_PRESET encode_preset) {
            this.exportVideoEncodeSettings.swPreset = encode_preset.ordinal();
            return this;
        }

        public Builder setEncodeProfile(@NonNull ENCODE_PROFILE encode_profile) {
            this.exportVideoEncodeSettings.encodeProfile = encode_profile.ordinal();
            return this;
        }

        public Builder setCompileType(@NonNull COMPILE_TYPE compile_type) {
            this.exportVideoEncodeSettings.compileType = compile_type;
            return this;
        }

        public Builder setSwMaxrate(int i) {
            this.exportVideoEncodeSettings.swMaxrate = i;
            return this;
        }

        public Builder setSpeed(float f) {
            this.exportVideoEncodeSettings.speed = f;
            return this;
        }

        public Builder setEncodeStandard(ENCODE_STANDARD encode_standard) {
            this.exportVideoEncodeSettings.encodeStandard = encode_standard.ordinal();
            return this;
        }

        public Builder setHasBFrame(boolean z) {
            this.exportVideoEncodeSettings.hasBFrame = z;
            return this;
        }

        public Builder setWatermarkParam(VEWatermarkParam vEWatermarkParam) {
            this.exportVideoEncodeSettings.mWatermarkParam = vEWatermarkParam;
            return this;
        }

        public VEVideoEncodeSettings build() {
            return this.exportVideoEncodeSettings;
        }

        public Builder overrideWithCloudConfig() {
            if (PerformanceConfig.sVECloudConfig == null) {
                Log.e(getClass().getSimpleName(), "Override with Cloud Configs failed. CloudConfig == null");
                return this;
            }
            switch (this.mUsage) {
                case 1:
                    overrideWithCloudConfigForRecord();
                    break;
                case 2:
                    overrideWithCloudConfigForCompile();
                    break;
                case 3:
                    overrideWithCloudConfigForImport();
                    break;
                default:
                    StringBuilder stringBuilder = new StringBuilder();
                    stringBuilder.append("CompileTime BUG, Unexpected usage = ");
                    stringBuilder.append(this.mUsage);
                    throw new IllegalStateException(stringBuilder.toString());
            }
            this.mIsEncodeModeDeclared = true;
            return this;
        }

        private void overrideWithCloudConfigForRecord() {
            VECloudConfig vECloudConfig = PerformanceConfig.sVECloudConfig;
            boolean z = true;
            if (vECloudConfig.mRecordEncodeMode != 1) {
                z = false;
            }
            this.exportVideoEncodeSettings.useHWEncoder = z;
            this.exportVideoEncodeSettings.outputSize = new VESize(vECloudConfig.mCameraPreviewResolutionWidth, vECloudConfig.mCameraPreviewResolutionHeight);
            this.exportVideoEncodeSettings.swCRF = vECloudConfig.mRecordSWEncodeCRF;
            this.exportVideoEncodeSettings.swPreset = vECloudConfig.mRecordVideoSWPreset;
            this.exportVideoEncodeSettings.bitrateMode = z ? getRecordHardwareBitrateModeFromCloud() : ENCODE_BITRATE_MODE.fromInteger(vECloudConfig.mRecordSWBitrateMode);
            this.exportVideoEncodeSettings.bps = z ? vECloudConfig.mRecordHWEncodeBPS : this.exportVideoEncodeSettings.bps;
            this.exportVideoEncodeSettings.gopSize = z ? this.exportVideoEncodeSettings.gopSize : vECloudConfig.mRecordVideoSWGop;
            this.exportVideoEncodeSettings.encodeProfile = z ? vECloudConfig.mRecordHwProfile : this.exportVideoEncodeSettings.encodeProfile;
            this.exportVideoEncodeSettings.swMaxrate = z ? this.exportVideoEncodeSettings.swMaxrate : vECloudConfig.mRecordVideoSWMaxrate;
            this.exportVideoEncodeSettings.swQP = z ? this.exportVideoEncodeSettings.swQP : vECloudConfig.mRecordVideoSWQP;
        }

        private void overrideWithCloudConfigForImport() {
            VECloudConfig vECloudConfig = PerformanceConfig.sVECloudConfig;
            boolean z = true;
            if (vECloudConfig.mImportEncodeMode != 1) {
                z = false;
            }
            this.exportVideoEncodeSettings.useHWEncoder = z;
            this.exportVideoEncodeSettings.outputSize = new VESize(vECloudConfig.mCameraPreviewResolutionWidth, vECloudConfig.mCameraPreviewResolutionHeight);
            this.exportVideoEncodeSettings.swCRF = vECloudConfig.mImportSWEncodeCRF;
            this.exportVideoEncodeSettings.swPreset = vECloudConfig.mImportVideoSWPreset;
            this.exportVideoEncodeSettings.bitrateMode = z ? getImportHardwareBitrateModeFromCloud() : ENCODE_BITRATE_MODE.fromInteger(vECloudConfig.mImportSWBitrateMode);
            this.exportVideoEncodeSettings.bps = z ? vECloudConfig.mImportHWEncodeBPS : this.exportVideoEncodeSettings.bps;
            this.exportVideoEncodeSettings.gopSize = z ? this.exportVideoEncodeSettings.gopSize : vECloudConfig.mImportVideoSWGop;
            this.exportVideoEncodeSettings.encodeProfile = z ? vECloudConfig.mImportHwProfile : this.exportVideoEncodeSettings.encodeProfile;
            this.exportVideoEncodeSettings.swMaxrate = z ? this.exportVideoEncodeSettings.swMaxrate : vECloudConfig.mImportVideoSWMaxrate;
            this.exportVideoEncodeSettings.swQP = z ? this.exportVideoEncodeSettings.swQP : vECloudConfig.mImportVideoSWQP;
        }

        private void overrideWithCloudConfigForCompile() {
            VECloudConfig vECloudConfig = PerformanceConfig.sVECloudConfig;
            boolean z = true;
            if (vECloudConfig.mCompileEncodeMode != 1) {
                z = false;
            }
            this.exportVideoEncodeSettings.useHWEncoder = z;
            this.exportVideoEncodeSettings.outputSize = new VESize(vECloudConfig.mCameraPreviewResolutionWidth, vECloudConfig.mCameraPreviewResolutionHeight);
            this.exportVideoEncodeSettings.swCRF = vECloudConfig.mCompileEncodeSWCRF;
            this.exportVideoEncodeSettings.swPreset = vECloudConfig.mCompileEncodeSWCRFPreset;
            this.exportVideoEncodeSettings.bitrateMode = z ? getCompileHardwareBitrateModeFromCloud() : ENCODE_BITRATE_MODE.fromInteger(vECloudConfig.mCompileSWBitrateMode);
            this.exportVideoEncodeSettings.bps = z ? vECloudConfig.mCompileEncodeHWBPS : this.exportVideoEncodeSettings.bps;
            this.exportVideoEncodeSettings.gopSize = z ? this.exportVideoEncodeSettings.gopSize : vECloudConfig.mCompileEncodeSWGOP;
            this.exportVideoEncodeSettings.encodeProfile = z ? vECloudConfig.mCompileHwProfile : this.exportVideoEncodeSettings.encodeProfile;
            this.exportVideoEncodeSettings.swMaxrate = z ? this.exportVideoEncodeSettings.swMaxrate : vECloudConfig.mCompileEncodeSWMaxrate;
            this.exportVideoEncodeSettings.swQP = z ? this.exportVideoEncodeSettings.swQP : vECloudConfig.mCompileVideoSWQP;
        }

        private ENCODE_BITRATE_MODE getRecordHardwareBitrateModeFromCloud() {
            return ENCODE_BITRATE_MODE.ENCODE_BITRATE_ABR;
        }

        private ENCODE_BITRATE_MODE getImportHardwareBitrateModeFromCloud() {
            return ENCODE_BITRATE_MODE.ENCODE_BITRATE_ABR;
        }

        private ENCODE_BITRATE_MODE getCompileHardwareBitrateModeFromCloud() {
            return ENCODE_BITRATE_MODE.ENCODE_BITRATE_ABR;
        }
    }

    public enum COMPILE_TYPE implements Parcelable {
        COMPILE_TYPE_MP4,
        COMPILE_TYPE_GIF,
        COMPILE_TYPE_HIGH_GIF;
        
        public static final Creator<COMPILE_TYPE> CREATOR = null;

        static {
            CREATOR = new Creator<COMPILE_TYPE>() {
                public COMPILE_TYPE createFromParcel(Parcel parcel) {
                    return COMPILE_TYPE.values()[parcel.readInt()];
                }

                public COMPILE_TYPE[] newArray(int i) {
                    return new COMPILE_TYPE[i];
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

    public enum ENCODE_BITRATE_MODE implements Parcelable {
        ENCODE_BITRATE_ABR,
        ENCODE_BITRATE_CRF,
        ENCODE_BITRATE_QP,
        ENCODE_BITRATE_VBR;
        
        public static final Creator<ENCODE_BITRATE_MODE> CREATOR = null;
        private static final ENCODE_BITRATE_MODE[] values = null;

        static {
            values = values();
            CREATOR = new Creator<ENCODE_BITRATE_MODE>() {
                public ENCODE_BITRATE_MODE createFromParcel(Parcel parcel) {
                    return ENCODE_BITRATE_MODE.values()[parcel.readInt()];
                }

                public ENCODE_BITRATE_MODE[] newArray(int i) {
                    return new ENCODE_BITRATE_MODE[i];
                }
            };
        }

        public static ENCODE_BITRATE_MODE fromInteger(int i) {
            return values[i];
        }

        public void writeToParcel(Parcel parcel, int i) {
            parcel.writeInt(ordinal());
        }

        public int describeContents() {
            return 0;
        }
    }

    public enum ENCODE_PRESET implements Parcelable {
        ENCODE_LEVEL_ULTRAFAST,
        ENCODE_LEVEL_SUPERFAST,
        ENCODE_LEVEL_VERYFAST,
        ENCODE_LEVEL_FASTER,
        ENCODE_LEVEL_FAST,
        ENCODE_LEVEL_MEDIUM,
        ENCODE_LEVEL_SLOW,
        ENCODE_LEVEL_SLOWER,
        ENCODE_LEVEL_VERYSLOW,
        ENCODE_LEVEL_PLACEBO;
        
        public static final Creator<ENCODE_PRESET> CREATOR = null;

        static {
            CREATOR = new Creator<ENCODE_PRESET>() {
                public ENCODE_PRESET createFromParcel(Parcel parcel) {
                    return ENCODE_PRESET.values()[parcel.readInt()];
                }

                public ENCODE_PRESET[] newArray(int i) {
                    return new ENCODE_PRESET[i];
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

    public enum ENCODE_PROFILE implements Parcelable {
        ENCODE_PROFILE_BASELINE,
        ENCODE_PROFILE_MAIN,
        ENCODE_PROFILE_HIGH;
        
        public static final Creator<ENCODE_PROFILE> CREATOR = null;

        static {
            CREATOR = new Creator<ENCODE_PROFILE>() {
                public ENCODE_PROFILE createFromParcel(Parcel parcel) {
                    return ENCODE_PROFILE.values()[parcel.readInt()];
                }

                public ENCODE_PROFILE[] newArray(int i) {
                    return new ENCODE_PROFILE[i];
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

    public enum ENCODE_STANDARD implements Parcelable {
        ENCODE_STANDARD_H264,
        ENCODE_STANDARD_H265,
        ENCODE_STANDARD_MPEG4;
        
        public static final Creator<ENCODE_STANDARD> CREATOR = null;

        static {
            CREATOR = new Creator<ENCODE_STANDARD>() {
                public ENCODE_STANDARD createFromParcel(Parcel parcel) {
                    return ENCODE_STANDARD.values()[parcel.readInt()];
                }

                public ENCODE_STANDARD[] newArray(int i) {
                    return new ENCODE_STANDARD[i];
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

    @Deprecated
    public VEVideoEncodeSettings(VESize vESize, boolean z) {
        this.rotate = 0;
        this.resizeMode = 2;
        this.resizeX = PanoramaArrowAnimateDrawable.LEFT_ARROW_RATIO;
        this.resizeY = PanoramaArrowAnimateDrawable.LEFT_ARROW_RATIO;
        this.speed = 1.0f;
        this.outputSize = new VESize(576, 1024);
        this.bitrateMode = ENCODE_BITRATE_MODE.ENCODE_BITRATE_ABR;
        this.bps = 4194304;
        this.swCRF = 15;
        this.swQP = 2;
        this.fps = 30;
        this.gopSize = 60;
        this.swPreset = ENCODE_PRESET.ENCODE_LEVEL_ULTRAFAST.ordinal();
        this.encodeStandard = ENCODE_STANDARD.ENCODE_STANDARD_H264.ordinal();
        this.encodeProfile = ENCODE_PROFILE.ENCODE_PROFILE_BASELINE.ordinal();
        this.swMaxrate = 5000000;
        this.hasBFrame = false;
        this.outputSize = vESize;
        this.useHWEncoder = z;
        this.compileType = COMPILE_TYPE.COMPILE_TYPE_MP4;
    }

    @Deprecated
    public VEVideoEncodeSettings(VESize vESize, boolean z, int i, int i2) {
        this.rotate = 0;
        this.resizeMode = 2;
        this.resizeX = PanoramaArrowAnimateDrawable.LEFT_ARROW_RATIO;
        this.resizeY = PanoramaArrowAnimateDrawable.LEFT_ARROW_RATIO;
        this.speed = 1.0f;
        this.outputSize = new VESize(576, 1024);
        this.bitrateMode = ENCODE_BITRATE_MODE.ENCODE_BITRATE_ABR;
        this.bps = 4194304;
        this.swCRF = 15;
        this.swQP = 2;
        this.fps = 30;
        this.gopSize = 60;
        this.swPreset = ENCODE_PRESET.ENCODE_LEVEL_ULTRAFAST.ordinal();
        this.encodeStandard = ENCODE_STANDARD.ENCODE_STANDARD_H264.ordinal();
        this.encodeProfile = ENCODE_PROFILE.ENCODE_PROFILE_BASELINE.ordinal();
        this.swMaxrate = 5000000;
        this.hasBFrame = false;
        this.outputSize = vESize;
        this.useHWEncoder = z;
        this.fps = i;
        this.gopSize = i2;
        this.compileType = COMPILE_TYPE.COMPILE_TYPE_MP4;
    }

    @Deprecated
    public VEVideoEncodeSettings(VESize vESize, boolean z, int i, int i2, int i3, int i4, boolean z2) {
        this.rotate = 0;
        this.resizeMode = 2;
        this.resizeX = PanoramaArrowAnimateDrawable.LEFT_ARROW_RATIO;
        this.resizeY = PanoramaArrowAnimateDrawable.LEFT_ARROW_RATIO;
        this.speed = 1.0f;
        this.outputSize = new VESize(576, 1024);
        this.bitrateMode = ENCODE_BITRATE_MODE.ENCODE_BITRATE_ABR;
        this.bps = 4194304;
        this.swCRF = 15;
        this.swQP = 2;
        this.fps = 30;
        this.gopSize = 60;
        this.swPreset = ENCODE_PRESET.ENCODE_LEVEL_ULTRAFAST.ordinal();
        this.encodeStandard = ENCODE_STANDARD.ENCODE_STANDARD_H264.ordinal();
        this.encodeProfile = ENCODE_PROFILE.ENCODE_PROFILE_BASELINE.ordinal();
        this.swMaxrate = 5000000;
        this.hasBFrame = false;
        this.outputSize = vESize;
        this.useHWEncoder = z;
        this.fps = i;
        this.gopSize = i2;
        this.bps = i3;
        this.swPreset = i4;
        this.hasBFrame = z2;
        this.compileType = COMPILE_TYPE.COMPILE_TYPE_MP4;
    }

    private VEVideoEncodeSettings() {
        this.rotate = 0;
        this.resizeMode = 2;
        this.resizeX = PanoramaArrowAnimateDrawable.LEFT_ARROW_RATIO;
        this.resizeY = PanoramaArrowAnimateDrawable.LEFT_ARROW_RATIO;
        this.speed = 1.0f;
        this.outputSize = new VESize(576, 1024);
        this.bitrateMode = ENCODE_BITRATE_MODE.ENCODE_BITRATE_ABR;
        this.bps = 4194304;
        this.swCRF = 15;
        this.swQP = 2;
        this.fps = 30;
        this.gopSize = 60;
        this.swPreset = ENCODE_PRESET.ENCODE_LEVEL_ULTRAFAST.ordinal();
        this.encodeStandard = ENCODE_STANDARD.ENCODE_STANDARD_H264.ordinal();
        this.encodeProfile = ENCODE_PROFILE.ENCODE_PROFILE_BASELINE.ordinal();
        this.swMaxrate = 5000000;
        this.hasBFrame = false;
        this.outputSize.width = 576;
        this.outputSize.height = 1024;
        this.fps = 30;
        this.bps = 4194304;
        this.useHWEncoder = true;
        this.compileType = COMPILE_TYPE.COMPILE_TYPE_MP4;
    }

    protected VEVideoEncodeSettings(Parcel parcel) {
        boolean z = false;
        this.rotate = 0;
        this.resizeMode = 2;
        this.resizeX = PanoramaArrowAnimateDrawable.LEFT_ARROW_RATIO;
        this.resizeY = PanoramaArrowAnimateDrawable.LEFT_ARROW_RATIO;
        this.speed = 1.0f;
        this.outputSize = new VESize(576, 1024);
        this.bitrateMode = ENCODE_BITRATE_MODE.ENCODE_BITRATE_ABR;
        this.bps = 4194304;
        this.swCRF = 15;
        this.swQP = 2;
        this.fps = 30;
        this.gopSize = 60;
        this.swPreset = ENCODE_PRESET.ENCODE_LEVEL_ULTRAFAST.ordinal();
        this.encodeStandard = ENCODE_STANDARD.ENCODE_STANDARD_H264.ordinal();
        this.encodeProfile = ENCODE_PROFILE.ENCODE_PROFILE_BASELINE.ordinal();
        this.swMaxrate = 5000000;
        this.hasBFrame = false;
        this.compileType = (COMPILE_TYPE) parcel.readParcelable(COMPILE_TYPE.class.getClassLoader());
        this.rotate = parcel.readInt();
        this.resizeMode = parcel.readInt();
        this.resizeX = parcel.readFloat();
        this.resizeY = parcel.readFloat();
        this.speed = parcel.readFloat();
        this.outputSize = (VESize) parcel.readParcelable(VESize.class.getClassLoader());
        this.bitrateMode = (ENCODE_BITRATE_MODE) parcel.readParcelable(ENCODE_BITRATE_MODE.class.getClassLoader());
        this.bps = parcel.readInt();
        this.fps = parcel.readInt();
        this.swCRF = parcel.readInt();
        this.swQP = parcel.readInt();
        this.gopSize = parcel.readInt();
        this.swPreset = parcel.readInt();
        this.encodeStandard = parcel.readInt();
        this.encodeProfile = parcel.readInt();
        this.useHWEncoder = parcel.readByte() != (byte) 0;
        if (parcel.readByte() != (byte) 0) {
            z = true;
        }
        this.hasBFrame = z;
        this.swMaxrate = parcel.readInt();
        this.mWatermarkParam = (VEWatermarkParam) parcel.readParcelable(VEWatermarkParam.class.getClassLoader());
    }

    public void writeToParcel(Parcel parcel, int i) {
        parcel.writeParcelable(this.compileType, i);
        parcel.writeInt(this.rotate);
        parcel.writeInt(this.resizeMode);
        parcel.writeFloat(this.resizeX);
        parcel.writeFloat(this.resizeY);
        parcel.writeFloat(this.speed);
        parcel.writeParcelable(this.outputSize, i);
        parcel.writeParcelable(this.bitrateMode, i);
        parcel.writeInt(this.bps);
        parcel.writeInt(this.fps);
        parcel.writeInt(this.swCRF);
        parcel.writeInt(this.swQP);
        parcel.writeInt(this.gopSize);
        parcel.writeInt(this.swPreset);
        parcel.writeInt(this.encodeStandard);
        parcel.writeInt(this.encodeProfile);
        parcel.writeByte((byte) this.useHWEncoder);
        parcel.writeByte((byte) this.hasBFrame);
        parcel.writeInt(this.swMaxrate);
        parcel.writeParcelable(this.mWatermarkParam, i);
    }

    public int describeContents() {
        return 0;
    }

    public COMPILE_TYPE getCompileType() {
        return this.compileType;
    }

    public float getSpeed() {
        return this.speed;
    }

    public int getFps() {
        return this.fps;
    }

    public ENCODE_BITRATE_MODE getBitrateMode() {
        return this.bitrateMode;
    }

    public int getBitrateValue() {
        switch (this.bitrateMode) {
            case ENCODE_BITRATE_ABR:
                return getBps();
            case ENCODE_BITRATE_CRF:
                return getSwCRF();
            case ENCODE_BITRATE_QP:
                return getSwQP();
            case ENCODE_BITRATE_VBR:
                return getBps();
            default:
                throw new IllegalStateException("CompileTime BUG by SDK. Unhandled ENCODE_BITRATE_MODE enum value.");
        }
    }

    public int getBps() {
        return this.bps;
    }

    public int getSwCRF() {
        return this.swCRF;
    }

    public int getSwQP() {
        return this.swQP;
    }

    public int getSwMaxRate() {
        return this.swMaxrate;
    }

    public VESize getVideoRes() {
        return this.outputSize;
    }

    public int getRotate() {
        return this.rotate;
    }

    public int getResizeMode() {
        return this.resizeMode;
    }

    public float getResizeX() {
        return this.resizeX;
    }

    public float getResizeY() {
        return this.resizeY;
    }

    public boolean isHwEnc() {
        return this.useHWEncoder;
    }

    public int getGopSize() {
        return this.gopSize;
    }

    public int getSwPreset() {
        return this.swPreset;
    }

    public int getEncodeProfile() {
        return this.encodeProfile;
    }

    public VEWatermarkParam getWatermarkParam() {
        return this.mWatermarkParam;
    }

    public void setFps(int i) {
        this.fps = i;
    }

    public void setSpeed(float f) {
        this.speed = f;
    }

    @Deprecated
    public void setBps(int i) {
        this.bitrateMode = ENCODE_BITRATE_MODE.ENCODE_BITRATE_VBR;
        this.bps = i;
    }

    public void setVideoRes(int i, int i2) {
        this.outputSize.width = i;
        this.outputSize.height = i2;
    }

    public void setRotate(int i) {
        this.rotate = i;
    }

    public void setResizeMode(int i) {
        this.resizeMode = i;
    }

    public void setResizeX(float f) {
        this.resizeX = f;
    }

    public void setResizeY(float f) {
        this.resizeY = f;
    }

    public void setHwEnc(boolean z) {
        this.useHWEncoder = z;
    }

    public void setGopSize(int i) {
        this.gopSize = i;
    }

    public void setWatermark(VEWatermarkParam vEWatermarkParam) {
        this.mWatermarkParam = vEWatermarkParam;
    }

    public void setSwPreset(ENCODE_PRESET encode_preset) {
        this.swPreset = encode_preset.ordinal();
    }

    public void setEncodeProfile(ENCODE_PROFILE encode_profile) {
        this.encodeProfile = encode_profile.ordinal();
    }

    public void setCompileType(COMPILE_TYPE compile_type) {
        this.compileType = compile_type;
    }

    public void setVideoBitrate(ENCODE_BITRATE_MODE encode_bitrate_mode, int i) {
        this.bitrateMode = encode_bitrate_mode;
        switch (this.bitrateMode) {
            case ENCODE_BITRATE_ABR:
                this.bps = i;
                return;
            case ENCODE_BITRATE_CRF:
                this.swCRF = i;
                return;
            case ENCODE_BITRATE_QP:
                this.swQP = i;
                return;
            case ENCODE_BITRATE_VBR:
                this.bps = i;
                return;
            default:
                throw new IllegalStateException("CompileTime BUG by sdk. Unhandled bitrateMode");
        }
    }

    public void setSWCRF(int i) {
        this.bitrateMode = ENCODE_BITRATE_MODE.ENCODE_BITRATE_CRF;
        this.swCRF = i;
    }

    public void setQP(int i) {
        this.bitrateMode = ENCODE_BITRATE_MODE.ENCODE_BITRATE_QP;
        this.swQP = i;
    }
}
