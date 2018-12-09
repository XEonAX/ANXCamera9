package com.ss.android.vesdk;

import android.os.Parcel;
import android.os.Parcelable;
import android.os.Parcelable.Creator;
import android.support.annotation.NonNull;
import com.ss.android.vesdk.runtime.cloudconfig.PerformanceConfig;

public class VEVideoEncodeSettings implements Parcelable {
    public static final Creator<VEVideoEncodeSettings> CREATOR = new Creator<VEVideoEncodeSettings>() {
        public VEVideoEncodeSettings createFromParcel(Parcel parcel) {
            return new VEVideoEncodeSettings(parcel);
        }

        public VEVideoEncodeSettings[] newArray(int i) {
            return new VEVideoEncodeSettings[i];
        }
    };
    private ENCODE_BITRATE_MODE bitrateMode;
    private int bps;
    public COMPILE_TYPE compileType;
    private int encodeLevel;
    private int encodeProfile;
    private int encodeStand;
    private int fps;
    private int gopSize;
    private boolean hasBFrame;
    private boolean mIsUseCloudConfig;
    private VESize outputSize;
    private int resizeMode;
    private float resizeX;
    private float resizeY;
    private int rotate;
    private float speed;
    private int swCRF;
    private int swQP;
    private int usage;
    private boolean useHWEncoder;

    public static class Builder {
        private ENCODE_BITRATE_MODE bitrateMode = ENCODE_BITRATE_MODE.ENCODE_BITRATE_CRF;
        private int bps = 0;
        public COMPILE_TYPE compileType = COMPILE_TYPE.COMPILE_TYPE_MP4;
        private int encodeLevel = ENCODE_LEVEL.ENCODE_LEVEL_ULTRAFAST.ordinal();
        private int encodeProfile = ENCODE_PROFILE.ENCODE_PROFILE_BASELINE.ordinal();
        private int encodeStand = ENCODE_STANDARD.ENCODE_STANDARD_H264.ordinal();
        private int fps = 30;
        private int gopSize = 60;
        private boolean hasBFrame = false;
        private boolean mIsUseCloudConfig = false;
        private VESize outputSize = new VESize(576, 1024);
        private int resizeMode = 0;
        private float resizeX = 0.0f;
        private float resizeY = 0.0f;
        private int rotate = 0;
        private float speed = 1.0f;
        private int swCRF = 15;
        private int swQP = 2;
        private int usage = 1;
        private boolean useHWEncoder = true;

        public Builder setFps(int i) {
            this.fps = i;
            return this;
        }

        public Builder setVideoBitrate(ENCODE_BITRATE_MODE encode_bitrate_mode, int i) {
            this.bitrateMode = encode_bitrate_mode;
            if (this.bitrateMode == ENCODE_BITRATE_MODE.ENCODE_BITRATE_ABR) {
                this.bps = i;
            } else if (this.bitrateMode == ENCODE_BITRATE_MODE.ENCODE_BITRATE_CRF) {
                this.swCRF = i;
            } else if (this.bitrateMode == ENCODE_BITRATE_MODE.ENCODE_BITRATE_QP) {
                this.swQP = i;
            }
            return this;
        }

        @Deprecated
        public Builder setBps(int i) {
            this.bitrateMode = ENCODE_BITRATE_MODE.ENCODE_BITRATE_ABR;
            this.bps = i;
            return this;
        }

        public Builder setVideoRes(int i, int i2) {
            this.outputSize.width = i;
            this.outputSize.height = i2;
            return this;
        }

        public Builder setRotate(int i) {
            this.rotate = i;
            return this;
        }

        public Builder setResizeMode(int i) {
            this.resizeMode = i;
            return this;
        }

        public Builder setResizeX(float f) {
            this.resizeX = f;
            return this;
        }

        public Builder setResizeY(float f) {
            this.resizeY = f;
            return this;
        }

        public Builder setHwEnc(boolean z) {
            this.useHWEncoder = z;
            return this;
        }

        public Builder setGopSize(int i) {
            this.gopSize = i;
            return this;
        }

        public Builder setEncodeLevel(@NonNull ENCODE_LEVEL encode_level) {
            this.encodeLevel = encode_level.ordinal();
            return this;
        }

        public Builder setEncodeProfile(@NonNull ENCODE_PROFILE encode_profile) {
            this.encodeProfile = encode_profile.ordinal();
            return this;
        }

        public Builder setCompileType(@NonNull COMPILE_TYPE compile_type) {
            this.compileType = compile_type;
            return this;
        }

        public Builder setUsage(int i) {
            this.usage = i;
            return this;
        }

        public Builder isUseCloudConfig(boolean z) {
            this.mIsUseCloudConfig = z;
            return this;
        }

        public VEVideoEncodeSettings build() {
            return new VEVideoEncodeSettings(this, null);
        }
    }

    public enum COMPILE_TYPE implements Parcelable {
        COMPILE_TYPE_MP4,
        COMPILE_TYPE_GIF;
        
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
        ENCODE_BITRATE_QP;
        
        public static final Creator<ENCODE_BITRATE_MODE> CREATOR = null;

        static {
            CREATOR = new Creator<ENCODE_BITRATE_MODE>() {
                public ENCODE_BITRATE_MODE createFromParcel(Parcel parcel) {
                    return ENCODE_BITRATE_MODE.values()[parcel.readInt()];
                }

                public ENCODE_BITRATE_MODE[] newArray(int i) {
                    return new ENCODE_BITRATE_MODE[i];
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

    public enum ENCODE_LEVEL implements Parcelable {
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
        
        public static final Creator<ENCODE_LEVEL> CREATOR = null;

        static {
            CREATOR = new Creator<ENCODE_LEVEL>() {
                public ENCODE_LEVEL createFromParcel(Parcel parcel) {
                    return ENCODE_LEVEL.values()[parcel.readInt()];
                }

                public ENCODE_LEVEL[] newArray(int i) {
                    return new ENCODE_LEVEL[i];
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
        this.resizeX = 0.0f;
        this.resizeY = 0.0f;
        this.speed = 1.0f;
        this.outputSize = new VESize(576, 1024);
        this.bitrateMode = ENCODE_BITRATE_MODE.ENCODE_BITRATE_ABR;
        this.bps = 0;
        this.swCRF = 15;
        this.swQP = 2;
        this.fps = 25;
        this.gopSize = 60;
        this.encodeLevel = ENCODE_LEVEL.ENCODE_LEVEL_ULTRAFAST.ordinal();
        this.encodeStand = ENCODE_STANDARD.ENCODE_STANDARD_H264.ordinal();
        this.encodeProfile = ENCODE_PROFILE.ENCODE_PROFILE_BASELINE.ordinal();
        this.hasBFrame = false;
        this.usage = 1;
        this.mIsUseCloudConfig = false;
        this.outputSize = vESize;
        this.useHWEncoder = z;
        this.compileType = COMPILE_TYPE.COMPILE_TYPE_MP4;
    }

    @Deprecated
    public VEVideoEncodeSettings(VESize vESize, boolean z, int i, int i2) {
        this.rotate = 0;
        this.resizeMode = 2;
        this.resizeX = 0.0f;
        this.resizeY = 0.0f;
        this.speed = 1.0f;
        this.outputSize = new VESize(576, 1024);
        this.bitrateMode = ENCODE_BITRATE_MODE.ENCODE_BITRATE_ABR;
        this.bps = 0;
        this.swCRF = 15;
        this.swQP = 2;
        this.fps = 25;
        this.gopSize = 60;
        this.encodeLevel = ENCODE_LEVEL.ENCODE_LEVEL_ULTRAFAST.ordinal();
        this.encodeStand = ENCODE_STANDARD.ENCODE_STANDARD_H264.ordinal();
        this.encodeProfile = ENCODE_PROFILE.ENCODE_PROFILE_BASELINE.ordinal();
        this.hasBFrame = false;
        this.usage = 1;
        this.mIsUseCloudConfig = false;
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
        this.resizeX = 0.0f;
        this.resizeY = 0.0f;
        this.speed = 1.0f;
        this.outputSize = new VESize(576, 1024);
        this.bitrateMode = ENCODE_BITRATE_MODE.ENCODE_BITRATE_ABR;
        this.bps = 0;
        this.swCRF = 15;
        this.swQP = 2;
        this.fps = 25;
        this.gopSize = 60;
        this.encodeLevel = ENCODE_LEVEL.ENCODE_LEVEL_ULTRAFAST.ordinal();
        this.encodeStand = ENCODE_STANDARD.ENCODE_STANDARD_H264.ordinal();
        this.encodeProfile = ENCODE_PROFILE.ENCODE_PROFILE_BASELINE.ordinal();
        this.hasBFrame = false;
        this.usage = 1;
        this.mIsUseCloudConfig = false;
        this.outputSize = vESize;
        this.useHWEncoder = z;
        this.fps = i;
        this.gopSize = i2;
        this.bps = i3;
        this.encodeLevel = i4;
        this.hasBFrame = z2;
        this.compileType = COMPILE_TYPE.COMPILE_TYPE_MP4;
    }

    @Deprecated
    public VEVideoEncodeSettings() {
        this.rotate = 0;
        this.resizeMode = 2;
        this.resizeX = 0.0f;
        this.resizeY = 0.0f;
        this.speed = 1.0f;
        this.outputSize = new VESize(576, 1024);
        this.bitrateMode = ENCODE_BITRATE_MODE.ENCODE_BITRATE_ABR;
        this.bps = 0;
        this.swCRF = 15;
        this.swQP = 2;
        this.fps = 25;
        this.gopSize = 60;
        this.encodeLevel = ENCODE_LEVEL.ENCODE_LEVEL_ULTRAFAST.ordinal();
        this.encodeStand = ENCODE_STANDARD.ENCODE_STANDARD_H264.ordinal();
        this.encodeProfile = ENCODE_PROFILE.ENCODE_PROFILE_BASELINE.ordinal();
        this.hasBFrame = false;
        this.usage = 1;
        this.mIsUseCloudConfig = false;
        this.outputSize.width = 576;
        this.outputSize.height = 1024;
        this.fps = 30;
        this.bps = 4194304;
        this.useHWEncoder = true;
        this.compileType = COMPILE_TYPE.COMPILE_TYPE_MP4;
    }

    private VEVideoEncodeSettings(Builder builder) {
        this.rotate = 0;
        this.resizeMode = 2;
        this.resizeX = 0.0f;
        this.resizeY = 0.0f;
        this.speed = 1.0f;
        this.outputSize = new VESize(576, 1024);
        this.bitrateMode = ENCODE_BITRATE_MODE.ENCODE_BITRATE_ABR;
        this.bps = 0;
        this.swCRF = 15;
        this.swQP = 2;
        this.fps = 25;
        this.gopSize = 60;
        this.encodeLevel = ENCODE_LEVEL.ENCODE_LEVEL_ULTRAFAST.ordinal();
        this.encodeStand = ENCODE_STANDARD.ENCODE_STANDARD_H264.ordinal();
        this.encodeProfile = ENCODE_PROFILE.ENCODE_PROFILE_BASELINE.ordinal();
        this.hasBFrame = false;
        this.usage = 1;
        this.mIsUseCloudConfig = false;
        this.outputSize = builder.outputSize;
        this.useHWEncoder = builder.useHWEncoder;
        this.bitrateMode = builder.bitrateMode;
        this.fps = builder.fps;
        this.swQP = builder.swQP;
        this.swCRF = builder.swCRF;
        this.gopSize = builder.gopSize;
        this.bps = builder.bps;
        this.encodeLevel = builder.encodeLevel;
        this.hasBFrame = builder.hasBFrame;
        this.compileType = builder.compileType;
        this.rotate = builder.rotate;
        this.encodeProfile = builder.encodeProfile;
        this.encodeStand = builder.encodeStand;
        this.resizeMode = builder.resizeMode;
        this.resizeX = builder.resizeX;
        this.resizeY = builder.resizeY;
        this.speed = builder.speed;
        this.usage = builder.usage;
        this.mIsUseCloudConfig = builder.mIsUseCloudConfig;
    }

    protected VEVideoEncodeSettings(Parcel parcel) {
        boolean z = false;
        this.rotate = 0;
        this.resizeMode = 2;
        this.resizeX = 0.0f;
        this.resizeY = 0.0f;
        this.speed = 1.0f;
        this.outputSize = new VESize(576, 1024);
        this.bitrateMode = ENCODE_BITRATE_MODE.ENCODE_BITRATE_ABR;
        this.bps = 0;
        this.swCRF = 15;
        this.swQP = 2;
        this.fps = 25;
        this.gopSize = 60;
        this.encodeLevel = ENCODE_LEVEL.ENCODE_LEVEL_ULTRAFAST.ordinal();
        this.encodeStand = ENCODE_STANDARD.ENCODE_STANDARD_H264.ordinal();
        this.encodeProfile = ENCODE_PROFILE.ENCODE_PROFILE_BASELINE.ordinal();
        this.hasBFrame = false;
        this.usage = 1;
        this.mIsUseCloudConfig = false;
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
        this.encodeLevel = parcel.readInt();
        this.encodeStand = parcel.readInt();
        this.encodeProfile = parcel.readInt();
        this.useHWEncoder = parcel.readByte() != (byte) 0;
        this.hasBFrame = parcel.readByte() != (byte) 0;
        this.usage = parcel.readInt();
        if (parcel.readByte() != (byte) 0) {
            z = true;
        }
        this.mIsUseCloudConfig = z;
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
        parcel.writeInt(this.encodeLevel);
        parcel.writeInt(this.encodeStand);
        parcel.writeInt(this.encodeProfile);
        parcel.writeByte((byte) this.useHWEncoder);
        parcel.writeByte((byte) this.hasBFrame);
        parcel.writeInt(this.usage);
        parcel.writeByte((byte) this.mIsUseCloudConfig);
    }

    public int describeContents() {
        return 0;
    }

    public COMPILE_TYPE getCompileType() {
        return this.compileType;
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
            default:
                return 0;
        }
    }

    public int getBps() {
        if (this.mIsUseCloudConfig && PerformanceConfig.sVECloudConfig != null) {
            if (this.usage == 1) {
                this.bps = PerformanceConfig.sVECloudConfig.mRecordHWEncodeBPS;
            }
            if (this.usage == 2) {
                this.bps = PerformanceConfig.sVECloudConfig.mCompileEncodeHWBPS;
            }
            if (this.usage == 3) {
                this.bps = PerformanceConfig.sVECloudConfig.mImportHWEncodeBPS;
            }
        }
        return this.bps;
    }

    public int getSwCRF() {
        if (this.mIsUseCloudConfig && PerformanceConfig.sVECloudConfig != null) {
            if (this.usage == 1) {
                this.swCRF = PerformanceConfig.sVECloudConfig.mRecordSWEncodeCRF;
            }
            if (this.usage == 2) {
                this.swCRF = PerformanceConfig.sVECloudConfig.mCompileEncodeSWCRF;
            }
            if (this.usage == 3) {
                this.swCRF = PerformanceConfig.sVECloudConfig.mImportSWEncodeCRF;
            }
        }
        return this.swCRF;
    }

    public int getSwQP() {
        return this.swQP;
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
        if (this.mIsUseCloudConfig && PerformanceConfig.sVECloudConfig != null) {
            boolean z = false;
            if (this.usage == 1) {
                this.useHWEncoder = PerformanceConfig.sVECloudConfig.mRecordEncodeMode == 1;
            }
            if (this.usage == 2) {
                this.useHWEncoder = PerformanceConfig.sVECloudConfig.mCompileEncodeMode == 1;
            }
            if (this.usage == 3) {
                if (PerformanceConfig.sVECloudConfig.mImportEncodeMode == 1) {
                    z = true;
                }
                this.useHWEncoder = z;
            }
        }
        return this.useHWEncoder;
    }

    public int getGopSize() {
        if (this.mIsUseCloudConfig && PerformanceConfig.sVECloudConfig != null && this.usage == 2) {
            this.gopSize = PerformanceConfig.sVECloudConfig.mCompileEncodeGOP;
        }
        return this.gopSize;
    }

    public int getEncodeLevel() {
        return this.encodeLevel;
    }

    public int getEncodeProfile() {
        return this.encodeProfile;
    }

    public int getUsage() {
        return this.usage;
    }

    public void setFps(int i) {
        this.fps = i;
    }

    @Deprecated
    public void setBps(int i) {
        this.bitrateMode = ENCODE_BITRATE_MODE.ENCODE_BITRATE_ABR;
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

    public void setEncodeLevel(ENCODE_LEVEL encode_level) {
        this.encodeLevel = encode_level.ordinal();
    }

    public void setEncodeProfile(ENCODE_PROFILE encode_profile) {
        this.encodeProfile = encode_profile.ordinal();
    }

    public void setCompileType(COMPILE_TYPE compile_type) {
        this.compileType = compile_type;
    }

    public void setVideoBitrate(ENCODE_BITRATE_MODE encode_bitrate_mode, int i) {
        this.bitrateMode = encode_bitrate_mode;
        if (this.bitrateMode == ENCODE_BITRATE_MODE.ENCODE_BITRATE_ABR) {
            this.bps = i;
        } else if (this.bitrateMode == ENCODE_BITRATE_MODE.ENCODE_BITRATE_CRF) {
            this.swCRF = i;
        } else if (this.bitrateMode == ENCODE_BITRATE_MODE.ENCODE_BITRATE_QP) {
            this.swQP = i;
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

    public void setIsUseCloudConfig(boolean z) {
        this.mIsUseCloudConfig = z;
    }
}
