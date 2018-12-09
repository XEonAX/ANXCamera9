package com.android.camera.panorama;

import android.annotation.SuppressLint;
import android.hardware.Sensor;
import android.hardware.SensorEvent;
import android.hardware.SensorEventListener;
import android.hardware.SensorManager;
import android.util.Range;
import com.android.camera.log.Log;
import java.util.Locale;

@SuppressLint({"NewApi"})
public class RoundDetector implements SensorEventListener {
    protected static final float DETECT_DIRECTION_MARGIN_DEGREE = 20.0f;
    private static final int MATRIX_SIZE = 16;
    public static final Object SynchronizedObject = new Object();
    public static final String TAG = "RoundDetector";
    protected boolean isLandscape;
    private float[] mAccelerometerValues = new float[0];
    protected int mCurrentDegreeLandscape;
    protected int mCurrentDegreePortrait;
    protected int mDirection = 1;
    private LoopRange mEndDegreeRange = emptyRange();
    private float[] mI = new float[16];
    private float[] mInR = new float[16];
    protected boolean mIsEndOk;
    private float[] mMagneticValues = new float[0];
    private float[] mOutR = new float[16];
    private int mStartDegree;

    private class LoopRange {
        protected Range<Integer> mRange;
        protected boolean[] mRangePassed = new boolean[2];
        protected Range<Integer> mRangeSecond;

        public LoopRange(int i, int i2, int i3) {
            if (i <= i2) {
                this.mRange = new Range(Integer.valueOf(i), Integer.valueOf(i2));
                this.mRangeSecond = new Range(Integer.valueOf(-1), Integer.valueOf(-1));
                this.mRangePassed[0] = false;
                this.mRangePassed[1] = true;
                return;
            }
            this.mRange = new Range(Integer.valueOf(0), Integer.valueOf(Math.max(5, i2)));
            this.mRangeSecond = new Range(Integer.valueOf(Math.min(i, i3 - 5)), Integer.valueOf(i3));
            this.mRangePassed[0] = false;
            this.mRangePassed[1] = false;
        }

        public boolean contains(int i) {
            if (!this.mRangePassed[0]) {
                this.mRangePassed[0] = this.mRange.contains(Integer.valueOf(i));
            }
            if (!this.mRangePassed[1]) {
                this.mRangePassed[1] = this.mRangeSecond.contains(Integer.valueOf(i));
            }
            if (this.mRangeSecond.contains(Integer.valueOf(i)) && this.mRangePassed[0]) {
                this.mRangePassed[0] = false;
            }
            if (this.mRangePassed[0] && this.mRangePassed[1]) {
                return true;
            }
            return false;
        }

        public String toString() {
            if (((Integer) this.mRangeSecond.getUpper()).intValue() < 0) {
                return this.mRange.toString();
            }
            return String.format("%s, %s", new Object[]{this.mRangeSecond.toString(), this.mRange.toString()});
        }
    }

    private class LoopRangeLeft extends LoopRange {
        public LoopRangeLeft(int i, int i2, int i3) {
            super(i, i2, i3);
            if (i > i2) {
                this.mRange = new Range(Integer.valueOf(Math.min(i, i3 - 5)), Integer.valueOf(i3));
                this.mRangeSecond = new Range(Integer.valueOf(0), Integer.valueOf(Math.max(5, i2)));
            }
        }

        public String toString() {
            if (((Integer) this.mRangeSecond.getUpper()).intValue() < 0) {
                return this.mRange.toString();
            }
            return String.format("%s, %s", new Object[]{this.mRange.toString(), this.mRangeSecond.toString()});
        }
    }

    private LoopRange emptyRange() {
        return new LoopRange(-1, -1, 360);
    }

    public void setStartPosition(int i, int i2, float f, float f2, boolean z) {
        boolean z2 = i == 0 || i == 180;
        this.isLandscape = z2;
        i = this.isLandscape ? (int) f : (int) f2;
        synchronized (SynchronizedObject) {
            int currentDegree;
            int i3;
            if (z) {
                currentDegree = currentDegree();
            } else if (i2 == 0) {
                currentDegree = correctionCircleDegree(currentDegree() + (i - 20));
            } else {
                currentDegree = correctionCircleDegree(currentDegree() - (i - 20));
            }
            switch (i2) {
                case 0:
                    i3 = currentDegree + i;
                    break;
                case 1:
                    i3 = currentDegree - ((i * 3) / 2);
                    break;
                default:
                    this.mIsEndOk = false;
                    this.mEndDegreeRange = emptyRange();
                    Log.e(TAG, "Unsupported Direction.");
                    return;
            }
            i = (i / 2) + i3;
            i3 = correctionCircleDegree(i3);
            i = correctionCircleDegree(i);
            if (i2 == 0) {
                if (i3 < currentDegree) {
                    i3 = 360;
                }
                this.mEndDegreeRange = new LoopRangeLeft(i3, i, 360);
            } else {
                if (currentDegree < i) {
                    i = 0;
                }
                this.mEndDegreeRange = new LoopRange(i3, i, 360);
            }
            this.mDirection = i2;
            this.mStartDegree = currentDegree;
            this.mIsEndOk = false;
            Log.d(TAG, String.format(Locale.US, "%s, start:%d(>>%d)", new Object[]{this.mEndDegreeRange.toString(), Integer.valueOf(currentDegree()), Integer.valueOf(this.mStartDegree)}));
        }
    }

    public int currentDegree() {
        return this.isLandscape ? this.mCurrentDegreeLandscape : this.mCurrentDegreePortrait;
    }

    public int currentDegree0Base() {
        int currentDegree = currentDegree();
        if (this.mDirection != 0) {
            return 360 - currentDegree;
        }
        return currentDegree;
    }

    /* JADX WARNING: Missing block: B:13:0x001a, code:
            return r2;
     */
    /* JADX WARNING: Missing block: B:18:0x0026, code:
            return r2;
     */
    public boolean detect() {
        /*
        r5 = this;
        r0 = SynchronizedObject;
        monitor-enter(r0);
        r1 = r5.mIsEndOk;	 Catch:{ all -> 0x0027 }
        r2 = 0;
        if (r1 != 0) goto L_0x000a;
    L_0x0008:
        monitor-exit(r0);	 Catch:{ all -> 0x0027 }
        return r2;
    L_0x000a:
        r1 = r5.mDirection;	 Catch:{ all -> 0x0027 }
        r3 = 1;
        if (r1 != 0) goto L_0x001b;
    L_0x000f:
        r1 = r5.mStartDegree;	 Catch:{ all -> 0x0027 }
        r4 = r5.currentDegree();	 Catch:{ all -> 0x0027 }
        if (r1 < r4) goto L_0x0019;
    L_0x0017:
        r2 = r3;
    L_0x0019:
        monitor-exit(r0);	 Catch:{ all -> 0x0027 }
        return r2;
    L_0x001b:
        r1 = r5.mStartDegree;	 Catch:{ all -> 0x0027 }
        r4 = r5.currentDegree();	 Catch:{ all -> 0x0027 }
        if (r1 > r4) goto L_0x0025;
    L_0x0023:
        r2 = r3;
    L_0x0025:
        monitor-exit(r0);	 Catch:{ all -> 0x0027 }
        return r2;
    L_0x0027:
        r1 = move-exception;
        monitor-exit(r0);	 Catch:{ all -> 0x0027 }
        throw r1;
        */
        throw new UnsupportedOperationException("Method not decompiled: com.android.camera.panorama.RoundDetector.detect():boolean");
    }

    public void stop() {
    }

    public void onSensorChanged(SensorEvent sensorEvent) {
        switch (sensorEvent.sensor.getType()) {
            case 1:
                this.mAccelerometerValues = (float[]) sensorEvent.values.clone();
                break;
            case 2:
                this.mMagneticValues = (float[]) sensorEvent.values.clone();
                break;
            default:
                return;
        }
        if (this.mMagneticValues.length > 0 && this.mAccelerometerValues.length > 0) {
            SensorManager.getRotationMatrix(this.mInR, this.mI, this.mAccelerometerValues, this.mMagneticValues);
            float[] fArr = new float[3];
            SensorManager.remapCoordinateSystem(this.mInR, 3, 129, this.mOutR);
            SensorManager.getOrientation(this.mOutR, fArr);
            int radianToDegree = radianToDegree(fArr[0]);
            if (radianToDegree < 0) {
                radianToDegree += 360;
            }
            SensorManager.remapCoordinateSystem(this.mInR, 1, 3, this.mOutR);
            SensorManager.getOrientation(this.mOutR, fArr);
            int radianToDegree2 = radianToDegree(fArr[0]);
            if (radianToDegree2 < 0) {
                radianToDegree2 += 360;
            }
            synchronized (SynchronizedObject) {
                this.mCurrentDegreeLandscape = radianToDegree;
                this.mCurrentDegreePortrait = radianToDegree2;
                this.mIsEndOk = this.mEndDegreeRange.contains(currentDegree());
            }
        }
    }

    public void onAccuracyChanged(Sensor sensor, int i) {
    }

    protected static int radianToDegree(float f) {
        return (int) Math.floor(Math.toDegrees((double) f));
    }

    private static int correctionCircleDegree(int i) {
        if (i < 0) {
            return i + 360;
        }
        if (360 < i) {
            return i - 360;
        }
        return i;
    }
}
