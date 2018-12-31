package com.android.camera2;

import android.hardware.camera2.marshal.MarshalQueryable;
import android.hardware.camera2.marshal.Marshaler;
import android.hardware.camera2.utils.TypeReference;
import java.nio.ByteBuffer;

public class AWBFrameControl {
    float mBGain;
    int mColorTemperature;
    float mGGain;
    float mRGain;

    public static class MarshalQueryableAWBFrameControl implements MarshalQueryable<AWBFrameControl> {
        private static final int SIZE = 16;

        private class MarshalerAWBFrameControl extends Marshaler<AWBFrameControl> {
            protected MarshalerAWBFrameControl(TypeReference<AWBFrameControl> typeReference, int i) {
                super(MarshalQueryableAWBFrameControl.this, typeReference, i);
            }

            public void marshal(AWBFrameControl aWBFrameControl, ByteBuffer byteBuffer) {
                byteBuffer.putFloat(aWBFrameControl.mRGain);
                byteBuffer.putFloat(aWBFrameControl.mGGain);
                byteBuffer.putFloat(aWBFrameControl.mBGain);
                byteBuffer.putInt(aWBFrameControl.mColorTemperature);
            }

            public AWBFrameControl unmarshal(ByteBuffer byteBuffer) {
                return new AWBFrameControl(byteBuffer.getFloat(), byteBuffer.getFloat(), byteBuffer.getFloat(), byteBuffer.getInt());
            }

            public int getNativeSize() {
                return 16;
            }
        }

        public Marshaler<AWBFrameControl> createMarshaler(TypeReference<AWBFrameControl> typeReference, int i) {
            return new MarshalerAWBFrameControl(typeReference, i);
        }

        public boolean isTypeMappingSupported(TypeReference<AWBFrameControl> typeReference, int i) {
            return i == 0 && AWBFrameControl.class.equals(typeReference.getType());
        }
    }

    public AWBFrameControl(float f, float f2, float f3, int i) {
        this.mRGain = f;
        this.mGGain = f2;
        this.mBGain = f3;
        this.mColorTemperature = i;
    }

    public int getColorTemperature() {
        return this.mColorTemperature;
    }
}
