package com.android.camera2;

import android.hardware.camera2.marshal.MarshalQueryable;
import android.hardware.camera2.marshal.Marshaler;
import android.hardware.camera2.utils.TypeReference;
import java.nio.ByteBuffer;

public class AECFrameControl {
    private static final int EXPOSURE_INDEX_COUNT = 3;
    private AECExposureData[] mAecExposureDatas = new AECExposureData[3];

    public static class AECExposureData {
        private float mDeltaEVFromTarget;
        private long mExposureTime;
        private float mLinearGain;
        private float mSensitivity;

        public long getExposureTime() {
            return this.mExposureTime;
        }

        public float getLinearGain() {
            return this.mLinearGain;
        }

        public float getSensitivity() {
            return this.mSensitivity;
        }

        public float getDeltaEVFromTarget() {
            return this.mDeltaEVFromTarget;
        }
    }

    public static class MarshalQueryableAECFrameControl implements MarshalQueryable<AECFrameControl> {
        private static final int SIZE = 72;

        private class MarshalAECFrameControl extends Marshaler<AECFrameControl> {
            protected MarshalAECFrameControl(TypeReference<AECFrameControl> typeReference, int i) {
                super(MarshalQueryableAECFrameControl.this, typeReference, i);
            }

            public void marshal(AECFrameControl aECFrameControl, ByteBuffer byteBuffer) {
                for (int i = 0; i < 3; i++) {
                    byteBuffer.putLong(aECFrameControl.mAecExposureDatas[i].mExposureTime);
                    byteBuffer.putFloat(aECFrameControl.mAecExposureDatas[i].mLinearGain);
                    byteBuffer.putFloat(aECFrameControl.mAecExposureDatas[i].mSensitivity);
                    byteBuffer.putFloat(aECFrameControl.mAecExposureDatas[i].mDeltaEVFromTarget);
                }
            }

            public AECFrameControl unmarshal(ByteBuffer byteBuffer) {
                AECExposureData[] aECExposureDataArr = new AECExposureData[3];
                for (int i = 0; i < 3; i++) {
                    aECExposureDataArr[i] = new AECExposureData();
                    aECExposureDataArr[i].mExposureTime = byteBuffer.getLong();
                    aECExposureDataArr[i].mLinearGain = byteBuffer.getFloat();
                    aECExposureDataArr[i].mSensitivity = byteBuffer.getFloat();
                    aECExposureDataArr[i].mDeltaEVFromTarget = byteBuffer.getFloat();
                    byteBuffer.getFloat();
                }
                return new AECFrameControl(aECExposureDataArr);
            }

            public int getNativeSize() {
                return 72;
            }
        }

        public Marshaler<AECFrameControl> createMarshaler(TypeReference<AECFrameControl> typeReference, int i) {
            return new MarshalAECFrameControl(typeReference, i);
        }

        public boolean isTypeMappingSupported(TypeReference<AECFrameControl> typeReference, int i) {
            return AECFrameControl.class.equals(typeReference.getType());
        }
    }

    public AECFrameControl(AECExposureData[] aECExposureDataArr) {
        this.mAecExposureDatas = aECExposureDataArr;
    }

    public AECExposureData[] getAecExposureDatas() {
        return this.mAecExposureDatas;
    }
}
