package com.android.camera.panorama;

import com.android.camera.log.Log;

public class MorphoSensorFusion {
    public static final int MAXIMUM_DATA_SIZE = 512;
    public static final int MODE_USE_ACCELEROMETER_AND_MAGNETIC_FIELD = 3;
    public static final int MODE_USE_ALL_SENSORS = 0;
    public static final int MODE_USE_GYROSCOPE = 1;
    public static final int MODE_USE_GYROSCOPE_AND_ROTATION_VECTOR = 4;
    public static final int MODE_USE_GYROSCOPE_WITH_ACCELEROMETER = 2;
    public static final int OFFSET_MODE_DYNAMIC = 1;
    public static final int OFFSET_MODE_STATIC = 0;
    public static final int ROTATE_0 = 0;
    public static final int ROTATE_180 = 2;
    public static final int ROTATE_270 = 3;
    public static final int ROTATE_90 = 1;
    public static final int SENSOR_TYPE_ACCELEROMETER = 1;
    public static final int SENSOR_TYPE_GYROSCOPE = 0;
    public static final int SENSOR_TYPE_MAGNETIC_FIELD = 2;
    public static final int SENSOR_TYPE_ROTATION_VECTOR = 3;
    public static final int STATE_CALC_OFFSET = 0;
    public static final int STATE_PROCESS = 1;
    public static final String TAG = "MorphoSensorFusion";
    private long mNative = 0;

    public static class SensorData {
        public final long mTimeStamp;
        public final double[] mValues;

        public SensorData(long j, float[] fArr) {
            this.mTimeStamp = j;
            this.mValues = new double[fArr.length];
            for (int i = 0; i < fArr.length; i++) {
                this.mValues[i] = (double) fArr[i];
            }
        }

        public SensorData(long j, double[] dArr) {
            this.mTimeStamp = j;
            this.mValues = (double[]) dArr.clone();
        }
    }

    private native int calc(long j);

    private native long createNativeObject();

    private native void deleteNativeObject(long j);

    private native int finish(long j);

    private native int initialize(long j);

    private static native String nativeGetVersion();

    private native int outputRotationAngle(long j, double[] dArr);

    private native int outputRotationMatrix3x3(long j, int i, double[] dArr);

    private native int setAppState(long j, int i);

    private native int setMode(long j, int i);

    private native int setOffset(long j, SensorData sensorData, int i);

    private native int setOffsetMode(long j, int i);

    private native int setRotation(long j, int i);

    private native int setSensorData(long j, Object[] objArr, int i);

    private native int setSensorReliability(long j, int i, int i2);

    static {
        try {
            System.loadLibrary("morpho_sensor_fusion");
        } catch (Throwable e) {
            Log.w(TAG, "can't loadLibrary morpho_sensor_fusion", e);
        }
    }

    public static String getVersion() {
        return nativeGetVersion();
    }

    public MorphoSensorFusion() {
        long createNativeObject = createNativeObject();
        if (createNativeObject != 0) {
            this.mNative = createNativeObject;
        } else {
            this.mNative = 0;
        }
    }

    public int initialize() {
        if (this.mNative != 0) {
            return initialize(this.mNative);
        }
        return -2147483646;
    }

    public int finish() {
        if (this.mNative == 0) {
            return -2147483646;
        }
        int finish = finish(this.mNative);
        deleteNativeObject(this.mNative);
        this.mNative = 0;
        return finish;
    }

    public int setMode(int i) {
        if (this.mNative != 0) {
            return setMode(this.mNative, i);
        }
        return -2147483646;
    }

    public int setAppState(int i) {
        if (this.mNative != 0) {
            return setAppState(this.mNative, i);
        }
        return -2147483646;
    }

    public int setRotation(int i) {
        if (this.mNative != 0) {
            return setRotation(this.mNative, i);
        }
        return -2147483646;
    }

    public int setSensorReliability(int i, int i2) {
        if (this.mNative != 0) {
            return setSensorReliability(this.mNative, i, i2);
        }
        return -2147483646;
    }

    public int setOffsetMode(int i) {
        if (this.mNative != 0) {
            return setOffsetMode(this.mNative, i);
        }
        return -2147483646;
    }

    public int setOffset(SensorData sensorData, int i) {
        if (this.mNative != 0) {
            return setOffset(this.mNative, sensorData, i);
        }
        return -2147483646;
    }

    public int setSensorData(Object[] objArr, int i) {
        if (this.mNative != 0) {
            return setSensorData(this.mNative, objArr, i);
        }
        return -2147483646;
    }

    public int calc() {
        if (this.mNative != 0) {
            return calc(this.mNative);
        }
        return -2147483646;
    }

    public int outputRotationMatrix3x3(int i, double[] dArr) {
        if (this.mNative != 0) {
            return outputRotationMatrix3x3(this.mNative, i, dArr);
        }
        return -2147483646;
    }

    public int outputRotationAngle(double[] dArr) {
        if (this.mNative != 0) {
            return outputRotationAngle(this.mNative, dArr);
        }
        return -2147483646;
    }
}
