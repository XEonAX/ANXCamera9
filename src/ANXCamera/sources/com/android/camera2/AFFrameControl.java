package com.android.camera2;

import android.hardware.camera2.marshal.MarshalQueryable;
import android.hardware.camera2.marshal.Marshaler;
import android.hardware.camera2.utils.TypeReference;
import java.nio.ByteBuffer;

public class AFFrameControl {
    private static final int COORDINATE_COUNT = 4;
    private static final int MAX_AFGYRO_SAMPLE_SIZE = 32;
    private static final int MAX_NUM_OF_STEPS = 47;
    private AFGyroData mAFGyroData;
    private int mTargetLensPosition;
    private int mUseDACValue;

    public static class AFGyroData {
        boolean enabled;
        float[] pAngularVelocityX = new float[32];
        float[] pAngularVelocityY = new float[32];
        float[] pAngularVelocityZ = new float[32];
        int sampleCount;
        long[] timeStamp = new long[32];

        public boolean isEnabled() {
            return this.enabled;
        }

        public int getSampleCount() {
            return this.sampleCount;
        }

        public float[] getpAngularVelocityX() {
            return this.pAngularVelocityX;
        }

        public float[] getpAngularVelocityY() {
            return this.pAngularVelocityY;
        }

        public float[] getpAngularVelocityZ() {
            return this.pAngularVelocityZ;
        }

        public long[] getTimeStamp() {
            return this.timeStamp;
        }
    }

    public static class MarshalQueryableAFFrameControl implements MarshalQueryable<AFFrameControl> {
        private static final int SIZE = 920;

        private class MarshalAFFrameControl extends Marshaler<AFFrameControl> {
            protected MarshalAFFrameControl(TypeReference<AFFrameControl> typeReference, int i) {
                super(MarshalQueryableAFFrameControl.this, typeReference, i);
            }

            public void marshal(AFFrameControl aFFrameControl, ByteBuffer byteBuffer) {
                int i;
                byteBuffer.putInt(aFFrameControl.mTargetLensPosition);
                byteBuffer.putInt(aFFrameControl.mUseDACValue);
                byteBuffer.putInt(aFFrameControl.mAFGyroData.sampleCount);
                int i2 = 0;
                for (i = 0; i < 32; i++) {
                    byteBuffer.putFloat(aFFrameControl.mAFGyroData.pAngularVelocityX[i]);
                }
                for (i = 0; i < 32; i++) {
                    byteBuffer.putFloat(aFFrameControl.mAFGyroData.pAngularVelocityY[i]);
                }
                for (i = 0; i < 32; i++) {
                    byteBuffer.putFloat(aFFrameControl.mAFGyroData.pAngularVelocityZ[i]);
                }
                while (i2 < 32) {
                    byteBuffer.putFloat((float) aFFrameControl.mAFGyroData.timeStamp[i2]);
                    i2++;
                }
            }

            public AFFrameControl unmarshal(ByteBuffer byteBuffer) {
                int i;
                int i2;
                AFGyroData aFGyroData = new AFGyroData();
                int i3 = 0;
                for (i = 0; i < 4; i++) {
                    byteBuffer.getInt();
                }
                i = byteBuffer.getInt();
                int i4 = byteBuffer.getInt();
                for (i2 = 0; i2 < 47; i2++) {
                    byteBuffer.getInt();
                }
                for (i2 = 0; i2 < 24; i2++) {
                    byteBuffer.getShort();
                }
                byteBuffer.getInt();
                byteBuffer.getFloat();
                aFGyroData.sampleCount = byteBuffer.getInt();
                for (i2 = 0; i2 < 32; i2++) {
                    aFGyroData.pAngularVelocityX[i2] = byteBuffer.getFloat();
                }
                for (i2 = 0; i2 < 32; i2++) {
                    aFGyroData.pAngularVelocityY[i2] = byteBuffer.getFloat();
                }
                for (i2 = 0; i2 < 32; i2++) {
                    aFGyroData.pAngularVelocityZ[i2] = byteBuffer.getFloat();
                }
                byteBuffer.getLong();
                while (i3 < 32) {
                    aFGyroData.timeStamp[i3] = byteBuffer.getLong();
                    i3++;
                }
                return new AFFrameControl(i, i4, aFGyroData);
            }

            public int getNativeSize() {
                return MarshalQueryableAFFrameControl.SIZE;
            }
        }

        public Marshaler<AFFrameControl> createMarshaler(TypeReference<AFFrameControl> typeReference, int i) {
            return new MarshalAFFrameControl(typeReference, i);
        }

        public boolean isTypeMappingSupported(TypeReference<AFFrameControl> typeReference, int i) {
            return i == 0 && AFFrameControl.class.equals(typeReference.getType());
        }
    }

    public AFFrameControl(int i, int i2, AFGyroData aFGyroData) {
        this.mTargetLensPosition = i;
        this.mUseDACValue = i2;
        this.mAFGyroData = aFGyroData;
    }

    public int getTargetLensPosition() {
        return this.mTargetLensPosition;
    }

    public int getUseDACValue() {
        return this.mUseDACValue;
    }

    public AFGyroData getAFGyroData() {
        return this.mAFGyroData;
    }
}
