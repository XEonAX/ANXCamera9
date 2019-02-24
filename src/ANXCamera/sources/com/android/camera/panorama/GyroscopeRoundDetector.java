package com.android.camera.panorama;

import android.hardware.SensorEvent;
import com.android.camera.Util;
import com.android.camera.ui.drawable.PanoramaArrowAnimateDrawable;

public class GyroscopeRoundDetector extends RoundDetector {
    private static final float NS2S = 1.0E-9f;
    private float mLastTimestamp;
    private float mRadianLandscape;
    private float mRadianPortrait;
    private float mTargetDegree = 360.0f;
    private boolean mUseSensor;

    public void setStartPosition(int i, int i2, float f, float f2, boolean z) {
        boolean z2 = i == 0 || i == 180;
        this.isLandscape = z2;
        synchronized (SynchronizedObject) {
            this.mLastTimestamp = PanoramaArrowAnimateDrawable.LEFT_ARROW_RATIO;
            this.mRadianLandscape = PanoramaArrowAnimateDrawable.LEFT_ARROW_RATIO;
            this.mRadianPortrait = PanoramaArrowAnimateDrawable.LEFT_ARROW_RATIO;
            this.mCurrentDegreeLandscape = 0;
            this.mCurrentDegreePortrait = 0;
            this.mDirection = i2;
            this.mIsEndOk = false;
            this.mUseSensor = true;
            if (!z) {
                if (this.isLandscape) {
                    this.mTargetDegree = (360.0f - f) + 20.0f;
                } else {
                    this.mTargetDegree = (360.0f - f2) + 20.0f;
                }
            }
        }
    }

    /* JADX WARNING: Missing block: B:13:0x001d, code:
            return r2;
     */
    /* JADX WARNING: Missing block: B:18:0x0033, code:
            return r2;
     */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    public boolean detect() {
        synchronized (SynchronizedObject) {
            boolean z = false;
            if (!this.mIsEndOk) {
                return false;
            } else if (this.mDirection == 0) {
                if (this.mTargetDegree <= ((float) currentDegree())) {
                    z = true;
                }
            } else if (((double) currentDegree()) <= 360.0d - ((double) this.mTargetDegree)) {
                z = true;
            }
        }
    }

    public void stop() {
        synchronized (SynchronizedObject) {
            this.mUseSensor = false;
        }
    }

    /* JADX WARNING: Missing block: B:57:0x00bb, code:
            return;
     */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    public void onSensorChanged(SensorEvent sensorEvent) {
        if (sensorEvent.sensor.getType() == 4 || sensorEvent.sensor.getType() == 16) {
            synchronized (SynchronizedObject) {
                if (this.mUseSensor) {
                    boolean z = false;
                    if (!Util.isEqualsZero((double) this.mLastTimestamp)) {
                        float f = (((float) sensorEvent.timestamp) - this.mLastTimestamp) * NS2S;
                        float f2 = sensorEvent.values[0];
                        float f3 = sensorEvent.values[1];
                        this.mRadianLandscape += f2 * f;
                        this.mRadianPortrait += f3 * f;
                    }
                    this.mLastTimestamp = (float) sensorEvent.timestamp;
                    int radianToDegree = RoundDetector.radianToDegree(this.mRadianLandscape);
                    int radianToDegree2 = RoundDetector.radianToDegree(this.mRadianPortrait);
                    if (radianToDegree <= 0 && this.mDirection == 1) {
                        radianToDegree += 360;
                    }
                    if (radianToDegree2 <= 0 && this.mDirection == 1) {
                        radianToDegree2 += 360;
                    }
                    int i = this.isLandscape ? radianToDegree : radianToDegree2;
                    int i2 = this.isLandscape ? this.mCurrentDegreeLandscape : this.mCurrentDegreePortrait;
                    boolean z2 = this.mDirection != 0 ? i2 == 0 || (i2 >= i && Math.abs(i - i2) < 180) : i2 == 0 || (i2 <= i && Math.abs(i - i2) < 180);
                    if (z2) {
                        this.mCurrentDegreeLandscape = radianToDegree;
                        this.mCurrentDegreePortrait = radianToDegree2;
                    }
                    if (!this.mIsEndOk) {
                        if (180 <= currentDegree() && currentDegree() <= 190) {
                            z = true;
                        }
                        this.mIsEndOk = z;
                    }
                }
            }
        }
    }
}
