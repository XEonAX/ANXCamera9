package com.android.camera;

import android.content.Context;
import android.hardware.Sensor;
import android.hardware.SensorEvent;
import android.hardware.SensorEventListener;
import android.hardware.SensorManager;
import android.os.Handler;
import android.os.HandlerThread;
import android.os.Looper;
import android.os.Message;
import android.os.SystemProperties;
import com.android.camera.log.Log;
import com.mi.config.b;

public class SensorStateManager {
    private static final int ACCELEROMETER = 8;
    private static final double ACCELEROMETER_GAP_TOLERANCE = 0.8999999761581421d;
    private static final int ACCELEROMETER_THRESHOLD = 16;
    private static final int CAPTURE_POSTURE_DEGREE = SystemProperties.getInt("capture_degree", 45);
    private static final long EVENT_PROCESS_INTERVAL = 100000000;
    private static final long EVENT_TIME_OUT = 1000000000;
    private static final int GAME_ROTATION = 64;
    private static final int GRAVITY = 32;
    private static final int GYROSCOPE = 2;
    private static final double GYROSCOPE_FOCUS_THRESHOLD = 1.0471975511965976d;
    private static final double GYROSCOPE_IGNORE_THRESHOLD = 0.05000000074505806d;
    private static final double GYROSCOPE_MOVING_THRESHOLD = ((double) (((float) SystemProperties.getInt("camera_moving_threshold", 15)) / 10.0f));
    private static final double GYROSCOPE_STABLE_THRESHOLD = ((double) (((float) SystemProperties.getInt("camera_stable_threshold", 9)) / 10.0f));
    public static final int LEFT_CAPTURE_POSTURE = 1;
    private static final int LINEAR_ACCELEROMETER = 1;
    private static final int LYING_HYSTERESIS = 5;
    private static final int MAX_LYING_BOUND = 153;
    private static final int MIN_LYING_BOUND = 26;
    private static final int MSG_DEVICE_BECOME_STABLE = 1;
    private static final int MSG_UPDATE = 2;
    private static final float NS2S = 1.0E-9f;
    private static final int ORIENTATION = 4;
    public static final int ORIENTATION_UNKNOWN = -1;
    public static final int PORTRAIT_CAPTURE_POSTURE = 0;
    public static final int RIGHT_CAPTURE_POSTURE = 2;
    private static final int ROTATION_VECTOR = 16;
    public static final int SENSOR_ALL = 127;
    private static final String TAG = "SensorStateManager";
    private final Sensor mAccelerometerSensor;
    private SensorEventListener mAccelerometerSensorEventListenerImpl = new SensorEventListener() {
        private static final float CLEAR_FILTER_THRESHOLD = 3.0f;
        private static final int _DATA_X = 0;
        private static final int _DATA_Y = 1;
        private static final int _DATA_Z = 2;
        private static final float finalAlpha = 0.7f;
        private static final float firstAlpha = 0.8f;
        private float[] finalFilter = new float[3];
        private float[] firstFilter = new float[3];

        public void onSensorChanged(SensorEvent sensorEvent) {
            SensorStateListener access$000 = SensorStateManager.this.getSensorStateListener();
            if (access$000 != null) {
                this.firstFilter[0] = (this.firstFilter[0] * firstAlpha) + (sensorEvent.values[0] * 0.19999999f);
                this.firstFilter[1] = (this.firstFilter[1] * firstAlpha) + (sensorEvent.values[1] * 0.19999999f);
                this.firstFilter[2] = (firstAlpha * this.firstFilter[2]) + (0.19999999f * sensorEvent.values[2]);
                this.finalFilter[0] = (this.finalFilter[0] * finalAlpha) + (this.firstFilter[0] * 0.3f);
                this.finalFilter[1] = (this.finalFilter[1] * finalAlpha) + (this.firstFilter[1] * 0.3f);
                this.finalFilter[2] = (finalAlpha * this.finalFilter[2]) + (0.3f * this.firstFilter[2]);
                String str = SensorStateManager.TAG;
                StringBuilder stringBuilder = new StringBuilder();
                stringBuilder.append("finalFilter=");
                stringBuilder.append(this.finalFilter[0]);
                stringBuilder.append(" ");
                stringBuilder.append(this.finalFilter[1]);
                stringBuilder.append(" ");
                stringBuilder.append(this.finalFilter[2]);
                stringBuilder.append(" event.values=");
                stringBuilder.append(sensorEvent.values[0]);
                stringBuilder.append(" ");
                stringBuilder.append(sensorEvent.values[1]);
                stringBuilder.append(" ");
                stringBuilder.append(sensorEvent.values[2]);
                Log.v(str, stringBuilder.toString());
                float f = -1.0f;
                float f2 = -this.finalFilter[0];
                float f3 = -this.finalFilter[1];
                float f4 = -this.finalFilter[2];
                if (((f2 * f2) + (f3 * f3)) * 4.0f >= f4 * f4) {
                    f = SensorStateManager.this.normalizeDegree(90.0f - (((float) Math.atan2((double) (-f3), (double) f2)) * 57.29578f));
                }
                if (f != SensorStateManager.this.mOrientation) {
                    if (Math.abs(SensorStateManager.this.mOrientation - f) > 3.0f) {
                        clearFilter();
                    }
                    SensorStateManager.this.mOrientation = f;
                    str = SensorStateManager.TAG;
                    stringBuilder = new StringBuilder();
                    stringBuilder.append("SensorEventListenerImpl TYPE_ACCELEROMETER mOrientation=");
                    stringBuilder.append(SensorStateManager.this.mOrientation);
                    stringBuilder.append(" mIsLying=");
                    stringBuilder.append(SensorStateManager.this.mIsLying);
                    Log.v(str, stringBuilder.toString());
                    access$000.onDeviceOrientationChanged(SensorStateManager.this.mOrientation, SensorStateManager.this.mIsLying);
                }
                if (access$000.isWorking()) {
                    access$000.onSensorChanged(sensorEvent);
                }
            }
        }

        private void clearFilter() {
            for (int i = 0; i < this.firstFilter.length; i++) {
                this.firstFilter[i] = 0.0f;
                this.finalFilter[i] = 0.0f;
            }
        }

        public void onAccuracyChanged(Sensor sensor, int i) {
            String str = SensorStateManager.TAG;
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.append("onAccuracyChanged accuracy=");
            stringBuilder.append(i);
            Log.v(str, stringBuilder.toString());
        }
    };
    private long mAccelerometerTimeStamp = 0;
    private double[] mAngleSpeed = new double[]{GYROSCOPE_STABLE_THRESHOLD, GYROSCOPE_STABLE_THRESHOLD, GYROSCOPE_STABLE_THRESHOLD, GYROSCOPE_STABLE_THRESHOLD, GYROSCOPE_STABLE_THRESHOLD};
    private int mAngleSpeedIndex = -1;
    private double mAngleTotal = 0.0d;
    private int mCapturePosture = 0;
    private boolean mEdgeTouchEnabled;
    private boolean mFocusSensorEnabled;
    private final Sensor mGameRotationSensor;
    private SensorEventListener mGameRotationSensorListener = new SensorEventListener() {
        public void onSensorChanged(SensorEvent sensorEvent) {
            SensorStateListener access$000 = SensorStateManager.this.getSensorStateListener();
            if (access$000 != null && access$000.isWorking()) {
                access$000.onSensorChanged(sensorEvent);
            }
        }

        public void onAccuracyChanged(Sensor sensor, int i) {
        }
    };
    private boolean mGradienterEnabled;
    private final Sensor mGravitySensor;
    private SensorEventListener mGravitySensorListener = new SensorEventListener() {
        public void onSensorChanged(SensorEvent sensorEvent) {
            SensorStateListener access$000 = SensorStateManager.this.getSensorStateListener();
            if (access$000 != null && access$000.isWorking()) {
                access$000.onSensorChanged(sensorEvent);
            }
        }

        public void onAccuracyChanged(Sensor sensor, int i) {
        }
    };
    private final Sensor mGyroscope;
    private SensorEventListener mGyroscopeListener = new SensorEventListener() {
        public void onSensorChanged(SensorEvent sensorEvent) {
            SensorStateListener access$000 = SensorStateManager.this.getSensorStateListener();
            if (access$000 != null && access$000.isWorking()) {
                long abs = Math.abs(sensorEvent.timestamp - SensorStateManager.this.mGyroscopeTimeStamp);
                if (abs >= SensorStateManager.EVENT_PROCESS_INTERVAL) {
                    if (SensorStateManager.this.mGyroscopeTimeStamp == 0 || abs > SensorStateManager.EVENT_TIME_OUT) {
                        SensorStateManager.this.mGyroscopeTimeStamp = sensorEvent.timestamp;
                        return;
                    }
                    float f = ((float) abs) * SensorStateManager.NS2S;
                    double sqrt = Math.sqrt((double) (((sensorEvent.values[0] * sensorEvent.values[0]) + (sensorEvent.values[1] * sensorEvent.values[1])) + (sensorEvent.values[2] * sensorEvent.values[2])));
                    SensorStateManager.this.mGyroscopeTimeStamp = sensorEvent.timestamp;
                    if (SensorStateManager.GYROSCOPE_MOVING_THRESHOLD < sqrt) {
                        SensorStateManager.this.deviceBeginMoving();
                    }
                    SensorStateManager.this.mAngleSpeedIndex = SensorStateManager.access$404(SensorStateManager.this) % SensorStateManager.this.mAngleSpeed.length;
                    SensorStateManager.this.mAngleSpeed[SensorStateManager.this.mAngleSpeedIndex] = sqrt;
                    if (sqrt >= SensorStateManager.GYROSCOPE_IGNORE_THRESHOLD) {
                        SensorStateManager.access$618(SensorStateManager.this, sqrt * ((double) f));
                        if (SensorStateManager.this.mAngleTotal > SensorStateManager.GYROSCOPE_FOCUS_THRESHOLD) {
                            SensorStateManager.this.mAngleTotal = 0.0d;
                            SensorStateManager.this.deviceKeepMoving(10000.0d);
                        }
                        if (access$000.isWorking()) {
                            access$000.onSensorChanged(sensorEvent);
                        }
                    }
                }
            }
        }

        public void onAccuracyChanged(Sensor sensor, int i) {
        }
    };
    private long mGyroscopeTimeStamp = 0;
    private Handler mHandler;
    private boolean mIsLying = false;
    private SensorEventListener mLinearAccelerationListener = new SensorEventListener() {
        public void onSensorChanged(SensorEvent sensorEvent) {
            SensorStateListener access$000 = SensorStateManager.this.getSensorStateListener();
            if (access$000 != null && access$000.isWorking()) {
                long abs = Math.abs(sensorEvent.timestamp - SensorStateManager.this.mAccelerometerTimeStamp);
                if (abs >= SensorStateManager.EVENT_PROCESS_INTERVAL) {
                    if (SensorStateManager.this.mAccelerometerTimeStamp == 0 || abs > SensorStateManager.EVENT_TIME_OUT) {
                        SensorStateManager.this.mAccelerometerTimeStamp = sensorEvent.timestamp;
                        return;
                    }
                    double sqrt = Math.sqrt((double) (((sensorEvent.values[0] * sensorEvent.values[0]) + (sensorEvent.values[1] * sensorEvent.values[1])) + (sensorEvent.values[2] * sensorEvent.values[2])));
                    SensorStateManager.this.mAccelerometerTimeStamp = sensorEvent.timestamp;
                    if (sqrt > SensorStateManager.ACCELEROMETER_GAP_TOLERANCE) {
                        SensorStateManager.this.deviceKeepMoving(sqrt);
                    }
                }
            }
        }

        public void onAccuracyChanged(Sensor sensor, int i) {
        }
    };
    private final Sensor mLinearAccelerometer;
    private float mOrientation = -1.0f;
    private final Sensor mOrientationSensor;
    private SensorEventListener mOrientationSensorEventListener;
    private int mRate;
    private SensorEventListener mRoatationSensorListener = new SensorEventListener() {
        /* JADX WARNING: Missing block: B:11:0x003d, code:
            return;
     */
        /* Code decompiled incorrectly, please refer to instructions dump. */
        public void onSensorChanged(SensorEvent sensorEvent) {
            SensorStateListener access$000 = SensorStateManager.this.getSensorStateListener();
            if (access$000 != null && access$000.isWorking() && sensorEvent.values != null && sensorEvent.values.length >= 4) {
                access$000.onDeviceRotationChanged(new float[]{sensorEvent.values[0], sensorEvent.values[1], sensorEvent.values[2], sensorEvent.values[3]});
            }
        }

        public void onAccuracyChanged(Sensor sensor, int i) {
        }
    };
    private boolean mRotationFlagEnabled;
    private final Sensor mRotationVecotrSensor;
    private boolean mRotationVectorFlagEnabled;
    private HandlerThread mSensorListenerThread;
    private final SensorManager mSensorManager;
    private int mSensorRegister;
    private SensorStateListener mSensorStateListener;
    private boolean mTTARFlagEnabled;
    private Handler mThreadHandler;

    private class MainHandler extends Handler {
        public MainHandler(Looper looper) {
            super(looper);
        }

        public void handleMessage(Message message) {
            switch (message.what) {
                case 1:
                    SensorStateManager.this.deviceBecomeStable();
                    return;
                case 2:
                    SensorStateManager sensorStateManager = SensorStateManager.this;
                    int i = message.arg1;
                    boolean z = true;
                    if (message.arg2 != 1) {
                        z = false;
                    }
                    sensorStateManager.update(i, z);
                    return;
                default:
                    return;
            }
        }
    }

    class OrientationSensorEventListenerImpl implements SensorEventListener {
        OrientationSensorEventListenerImpl() {
        }

        public void onSensorChanged(SensorEvent sensorEvent) {
            SensorStateListener access$000 = SensorStateManager.this.getSensorStateListener();
            if (access$000 != null) {
                int i;
                float f = -1.0f;
                int i2 = 1;
                float f2 = sensorEvent.values[1];
                float f3 = sensorEvent.values[2];
                float abs = Math.abs(f2);
                float abs2 = Math.abs(f3);
                if (SensorStateManager.this.mIsLying) {
                    i = 5;
                } else {
                    i = 0;
                }
                int i3 = 26 + i;
                i = 153 - i;
                float f4 = (float) i3;
                boolean z = (abs <= f4 || abs >= ((float) i)) && (abs2 <= f4 || abs2 >= ((float) i));
                if (z && Math.abs(abs - abs2) > 1.0f) {
                    if (abs > abs2) {
                        f = f2 < 0.0f ? 0.0f : 180.0f;
                    } else if (abs < abs2) {
                        f = f3 < 0.0f ? 90.0f : 270.0f;
                    }
                }
                if (Math.abs(abs2 - 90.0f) < ((float) SensorStateManager.CAPTURE_POSTURE_DEGREE)) {
                    SensorStateManager sensorStateManager = SensorStateManager.this;
                    if (f3 >= 0.0f) {
                        i2 = 2;
                    }
                    sensorStateManager.changeCapturePosture(i2);
                } else {
                    SensorStateManager.this.changeCapturePosture(0);
                }
                if (z != SensorStateManager.this.mIsLying || (z && f != SensorStateManager.this.mOrientation)) {
                    SensorStateManager.this.mIsLying = z;
                    if (SensorStateManager.this.mIsLying) {
                        SensorStateManager.this.mOrientation = f;
                    }
                    String str = SensorStateManager.TAG;
                    StringBuilder stringBuilder = new StringBuilder();
                    stringBuilder.append("SensorEventListenerImpl TYPE_ORIENTATION mOrientation=");
                    stringBuilder.append(SensorStateManager.this.mOrientation);
                    stringBuilder.append(" mIsLying=");
                    stringBuilder.append(SensorStateManager.this.mIsLying);
                    Log.v(str, stringBuilder.toString());
                    access$000.onDeviceOrientationChanged(SensorStateManager.this.mOrientation, SensorStateManager.this.mIsLying);
                }
            }
        }

        public void onAccuracyChanged(Sensor sensor, int i) {
            String str = SensorStateManager.TAG;
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.append("onAccuracyChanged accuracy=");
            stringBuilder.append(i);
            Log.v(str, stringBuilder.toString());
        }
    }

    public interface SensorStateListener {
        boolean isWorking();

        void notifyDevicePostureChanged();

        void onDeviceBecomeStable();

        void onDeviceBeginMoving();

        void onDeviceKeepMoving(double d);

        void onDeviceKeepStable();

        void onDeviceOrientationChanged(float f, boolean z);

        void onDeviceRotationChanged(float[] fArr);

        void onSensorChanged(SensorEvent sensorEvent);
    }

    static /* synthetic */ int access$404(SensorStateManager sensorStateManager) {
        int i = sensorStateManager.mAngleSpeedIndex + 1;
        sensorStateManager.mAngleSpeedIndex = i;
        return i;
    }

    static /* synthetic */ double access$618(SensorStateManager sensorStateManager, double d) {
        double d2 = sensorStateManager.mAngleTotal + d;
        sensorStateManager.mAngleTotal = d2;
        return d2;
    }

    public SensorStateManager(Context context, Looper looper) {
        this.mSensorManager = (SensorManager) context.getSystemService("sensor");
        this.mLinearAccelerometer = this.mSensorManager.getDefaultSensor(10);
        this.mGyroscope = this.mSensorManager.getDefaultSensor(4);
        this.mOrientationSensor = this.mSensorManager.getDefaultSensor(3);
        this.mAccelerometerSensor = this.mSensorManager.getDefaultSensor(1);
        this.mRotationVecotrSensor = this.mSensorManager.getDefaultSensor(11);
        this.mGravitySensor = this.mSensorManager.getDefaultSensor(9);
        this.mGameRotationSensor = this.mSensorManager.getDefaultSensor(15);
        this.mHandler = new MainHandler(looper);
        this.mRate = 30000;
        if (canDetectOrientation()) {
            this.mOrientationSensorEventListener = new OrientationSensorEventListenerImpl();
        }
        this.mSensorListenerThread = new HandlerThread("SensorListenerThread");
        this.mSensorListenerThread.start();
    }

    public synchronized void setSensorStateListener(SensorStateListener sensorStateListener) {
        this.mSensorStateListener = sensorStateListener;
    }

    private synchronized SensorStateListener getSensorStateListener() {
        return this.mSensorStateListener;
    }

    public void setFocusSensorEnabled(boolean z) {
        if (this.mFocusSensorEnabled != z) {
            this.mFocusSensorEnabled = z;
            this.mHandler.removeMessages(2);
            int i = 3;
            if (!this.mFocusSensorEnabled) {
                i = filterUnregisterSensor(3);
            }
            this.mHandler.sendMessageDelayed(this.mHandler.obtainMessage(2, i, z), 1000);
        }
    }

    public void setGradienterEnabled(boolean z) {
        if (this.mGradienterEnabled != z) {
            this.mGradienterEnabled = z;
            int i = 12;
            if (!this.mGradienterEnabled) {
                i = filterUnregisterSensor(12);
            }
            update(i, this.mGradienterEnabled);
        }
    }

    public void setRotationIndicatorEnabled(boolean z) {
        if (b.hD() && canDetectOrientation() && this.mRotationFlagEnabled != z) {
            this.mRotationFlagEnabled = z;
            int i = 4;
            if (!this.mRotationFlagEnabled) {
                i = filterUnregisterSensor(4);
            }
            update(i, this.mRotationFlagEnabled);
        }
    }

    public void setRotationVectorEnabled(boolean z) {
        if (this.mRotationVectorFlagEnabled != z) {
            this.mRotationVectorFlagEnabled = z;
            update(16, this.mRotationVectorFlagEnabled);
        }
    }

    public void setTTARSensorEnabled(boolean z) {
        if (this.mTTARFlagEnabled != z) {
            this.mTTARFlagEnabled = z;
            update(106, this.mTTARFlagEnabled);
        }
    }

    private int filterUnregisterSensor(int i) {
        if (this.mEdgeTouchEnabled) {
            i = (i & -3) & -5;
        }
        if (this.mRotationFlagEnabled) {
            i &= -5;
        }
        if (this.mFocusSensorEnabled) {
            i = (i & -2) & -3;
        }
        if (this.mGradienterEnabled) {
            return (i & -9) & -5;
        }
        return i;
    }

    public void setEdgeTouchEnabled(boolean z) {
        if (this.mEdgeTouchEnabled != z) {
            this.mEdgeTouchEnabled = z;
            int i = 6;
            if (!this.mEdgeTouchEnabled) {
                if (this.mGradienterEnabled) {
                    i = 2;
                }
                if (this.mFocusSensorEnabled) {
                    i &= -3;
                }
            }
            update(i, this.mEdgeTouchEnabled);
        }
    }

    private void update(int i, boolean z) {
        if (!z && isPartialContains(this.mSensorRegister, i)) {
            unregister(i);
        } else if (z && !isContains(this.mSensorRegister, i)) {
            register(i);
        }
    }

    public void register() {
        int i;
        if (this.mFocusSensorEnabled) {
            i = 3;
        } else {
            i = 0;
        }
        if (this.mEdgeTouchEnabled) {
            i = (i | 2) | 4;
        }
        if (this.mGradienterEnabled) {
            i = (i | 8) | 4;
        }
        if (this.mRotationFlagEnabled) {
            i |= 4;
        }
        if (this.mRotationVectorFlagEnabled) {
            i |= 16;
        }
        if (this.mTTARFlagEnabled) {
            i = (((i | 8) | 2) | 64) | 32;
        }
        register(i);
    }

    public void register(int i) {
        if (!isContains(this.mSensorRegister, i)) {
            if (this.mThreadHandler == null && isPartialContains(i, 12)) {
                this.mThreadHandler = new Handler(this.mSensorListenerThread.getLooper());
            }
            if (this.mFocusSensorEnabled) {
                i = (i | 1) | 2;
                this.mHandler.removeMessages(2);
            }
            if (isContains(i, 2) && !isContains(this.mSensorRegister, 2)) {
                this.mSensorManager.registerListener(this.mGyroscopeListener, this.mGyroscope, 2);
                this.mSensorRegister |= 2;
            }
            if (isContains(i, 1) && !isContains(this.mSensorRegister, 1)) {
                this.mSensorManager.registerListener(this.mLinearAccelerationListener, this.mLinearAccelerometer, 2);
                this.mSensorRegister = 1 | this.mSensorRegister;
            }
            if (canDetectOrientation() && isContains(i, 4) && !isContains(this.mSensorRegister, 4) && this.mSensorListenerThread != null && this.mSensorListenerThread.isAlive()) {
                this.mSensorManager.registerListener(this.mOrientationSensorEventListener, this.mOrientationSensor, this.mRate, this.mThreadHandler);
                this.mSensorRegister = 4 | this.mSensorRegister;
            }
            if (isContains(i, 8) && !isContains(this.mSensorRegister, 8) && this.mSensorListenerThread != null && this.mSensorListenerThread.isAlive()) {
                this.mSensorManager.registerListener(this.mAccelerometerSensorEventListenerImpl, this.mAccelerometerSensor, this.mRate, this.mThreadHandler);
                this.mSensorRegister = 8 | this.mSensorRegister;
            }
            if (isContains(i, 16) && !isContains(this.mSensorRegister, 16) && this.mSensorListenerThread != null && this.mSensorListenerThread.isAlive()) {
                this.mSensorManager.registerListener(this.mRoatationSensorListener, this.mRotationVecotrSensor, this.mRate, this.mThreadHandler);
                this.mSensorRegister = 16 | this.mSensorRegister;
            }
            if (isContains(i, 32) && !isContains(this.mSensorRegister, 32) && this.mSensorListenerThread != null && this.mSensorListenerThread.isAlive()) {
                this.mSensorManager.registerListener(this.mGravitySensorListener, this.mGravitySensor, this.mRate, this.mThreadHandler);
                this.mSensorRegister = 32 | this.mSensorRegister;
            }
            if (isContains(i, 64) && !isContains(this.mSensorRegister, 64) && this.mSensorListenerThread != null && this.mSensorListenerThread.isAlive()) {
                this.mSensorManager.registerListener(this.mGameRotationSensorListener, this.mGameRotationSensor, this.mRate, this.mThreadHandler);
                this.mSensorRegister |= 64;
            }
        }
    }

    public void unregister(int i) {
        if (this.mSensorRegister != 0) {
            if (!this.mFocusSensorEnabled || i == 127) {
                if (!this.mFocusSensorEnabled && this.mHandler.hasMessages(2)) {
                    i |= 1;
                    if (!this.mEdgeTouchEnabled) {
                        i |= 2;
                    }
                }
                reset();
                this.mHandler.removeMessages(2);
            }
            if (isContains(i, 2) && isContains(this.mSensorRegister, 2)) {
                this.mSensorManager.unregisterListener(this.mGyroscopeListener);
                this.mSensorRegister &= -3;
            }
            if (isContains(i, 1) && isContains(this.mSensorRegister, 1)) {
                this.mSensorManager.unregisterListener(this.mLinearAccelerationListener);
                this.mSensorRegister &= -2;
            }
            if (isContains(i, 4) && isContains(this.mSensorRegister, 4)) {
                this.mSensorManager.unregisterListener(this.mOrientationSensorEventListener);
                this.mSensorRegister &= -5;
                this.mIsLying = false;
                changeCapturePosture(0);
            }
            if (isContains(i, 8) && isContains(this.mSensorRegister, 8)) {
                this.mSensorManager.unregisterListener(this.mAccelerometerSensorEventListenerImpl);
                this.mSensorRegister &= -9;
            }
            if (isContains(i, 16) && isContains(this.mSensorRegister, 16)) {
                this.mSensorManager.unregisterListener(this.mRoatationSensorListener);
                this.mSensorRegister &= -17;
            }
            if (isContains(i, 32) && isContains(this.mSensorRegister, 32)) {
                this.mSensorManager.unregisterListener(this.mGravitySensorListener);
                this.mSensorRegister &= -33;
            }
            if (isContains(i, 64) && isContains(this.mSensorRegister, 64)) {
                this.mSensorManager.unregisterListener(this.mGameRotationSensorListener);
                this.mSensorRegister &= -65;
            }
        }
    }

    private boolean isContains(int i, int i2) {
        return (i & i2) == i2;
    }

    private boolean isPartialContains(int i, int i2) {
        return (i & i2) != 0;
    }

    public void reset() {
        this.mHandler.removeMessages(1);
        this.mAngleTotal = 0.0d;
    }

    public boolean isStable() {
        boolean z = true;
        String str;
        if (this.mAngleSpeedIndex >= 0) {
            double d = 0.0d;
            for (double d2 : this.mAngleSpeed) {
                d += d2;
            }
            d /= (double) this.mAngleSpeed.length;
            double d3 = this.mAngleSpeed[Util.clamp(this.mAngleSpeedIndex, 0, this.mAngleSpeed.length - 1)];
            str = TAG;
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.append("isStable mAngleSpeed=");
            stringBuilder.append(d);
            stringBuilder.append(" lastSpeed=");
            stringBuilder.append(d3);
            stringBuilder.append(" threshold=");
            stringBuilder.append(GYROSCOPE_STABLE_THRESHOLD);
            Log.v(str, stringBuilder.toString());
            if (d > GYROSCOPE_STABLE_THRESHOLD || d3 > GYROSCOPE_STABLE_THRESHOLD) {
                z = false;
            }
            return z;
        }
        str = TAG;
        StringBuilder stringBuilder2 = new StringBuilder();
        stringBuilder2.append("isStable return true for mAngleSpeedIndex=");
        stringBuilder2.append(this.mAngleSpeedIndex);
        stringBuilder2.append(" threshold=");
        stringBuilder2.append(GYROSCOPE_STABLE_THRESHOLD);
        Log.v(str, stringBuilder2.toString());
        return true;
    }

    private float normalizeDegree(float f) {
        while (f >= 360.0f) {
            f -= 360.0f;
        }
        while (f < 0.0f) {
            f += 360.0f;
        }
        return f;
    }

    public boolean canDetectOrientation() {
        return this.mOrientationSensor != null;
    }

    public boolean isDeviceLying() {
        return this.mIsLying;
    }

    public int getCapturePosture() {
        return this.mCapturePosture;
    }

    private void deviceBeginMoving() {
        SensorStateListener sensorStateListener = getSensorStateListener();
        if (sensorStateListener != null) {
            sensorStateListener.onDeviceBeginMoving();
        }
    }

    private void deviceBecomeStable() {
        if (this.mFocusSensorEnabled) {
            SensorStateListener sensorStateListener = getSensorStateListener();
            if (sensorStateListener != null) {
                sensorStateListener.onDeviceBecomeStable();
            }
        }
    }

    private void deviceKeepStable() {
        SensorStateListener sensorStateListener = getSensorStateListener();
        if (sensorStateListener != null) {
            sensorStateListener.onDeviceKeepStable();
        }
    }

    private void deviceKeepMoving(double d) {
        if (this.mFocusSensorEnabled) {
            SensorStateListener sensorStateListener = getSensorStateListener();
            if (sensorStateListener != null) {
                sensorStateListener.onDeviceKeepMoving(d);
            }
        }
    }

    private void changeCapturePosture(int i) {
        if (this.mCapturePosture != i) {
            this.mCapturePosture = i;
            SensorStateListener sensorStateListener = getSensorStateListener();
            if (sensorStateListener != null) {
                sensorStateListener.notifyDevicePostureChanged();
            }
        }
    }

    public void onDestroy() {
        this.mSensorListenerThread.quit();
    }
}
