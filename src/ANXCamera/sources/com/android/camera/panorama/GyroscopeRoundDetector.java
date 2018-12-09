package com.android.camera.panorama;

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
    public boolean detect() {
        /*
        r10 = this;
        r0 = SynchronizedObject;
        monitor-enter(r0);
        r1 = r10.mIsEndOk;	 Catch:{ all -> 0x0034 }
        r2 = 0;
        if (r1 != 0) goto L_0x000a;
    L_0x0008:
        monitor-exit(r0);	 Catch:{ all -> 0x0034 }
        return r2;
    L_0x000a:
        r1 = r10.mDirection;	 Catch:{ all -> 0x0034 }
        r3 = 1;
        if (r1 != 0) goto L_0x001e;
    L_0x000f:
        r1 = r10.mTargetDegree;	 Catch:{ all -> 0x0034 }
        r4 = r10.currentDegree();	 Catch:{ all -> 0x0034 }
        r4 = (float) r4;	 Catch:{ all -> 0x0034 }
        r1 = (r1 > r4 ? 1 : (r1 == r4 ? 0 : -1));
        if (r1 > 0) goto L_0x001c;
    L_0x001a:
        r2 = r3;
    L_0x001c:
        monitor-exit(r0);	 Catch:{ all -> 0x0034 }
        return r2;
    L_0x001e:
        r1 = r10.currentDegree();	 Catch:{ all -> 0x0034 }
        r4 = (double) r1;	 Catch:{ all -> 0x0034 }
        r6 = 4645040803167600640; // 0x4076800000000000 float:0.0 double:360.0;
        r1 = r10.mTargetDegree;	 Catch:{ all -> 0x0034 }
        r8 = (double) r1;	 Catch:{ all -> 0x0034 }
        r6 = r6 - r8;
        r1 = (r4 > r6 ? 1 : (r4 == r6 ? 0 : -1));
        if (r1 > 0) goto L_0x0032;
    L_0x0030:
        r2 = r3;
    L_0x0032:
        monitor-exit(r0);	 Catch:{ all -> 0x0034 }
        return r2;
    L_0x0034:
        r1 = move-exception;
        monitor-exit(r0);	 Catch:{ all -> 0x0034 }
        throw r1;
        */
        throw new UnsupportedOperationException("Method not decompiled: com.android.camera.panorama.GyroscopeRoundDetector.detect():boolean");
    }

    public void stop() {
        synchronized (SynchronizedObject) {
            this.mUseSensor = false;
        }
    }

    /* JADX WARNING: Missing block: B:57:0x00bb, code:
            return;
     */
    public void onSensorChanged(android.hardware.SensorEvent r9) {
        /*
        r8 = this;
        r0 = r9.sensor;
        r0 = r0.getType();
        r1 = 4;
        if (r0 == r1) goto L_0x0014;
    L_0x0009:
        r0 = r9.sensor;
        r0 = r0.getType();
        r1 = 16;
        if (r0 == r1) goto L_0x0014;
    L_0x0013:
        return;
    L_0x0014:
        r0 = SynchronizedObject;
        monitor-enter(r0);
        r1 = r8.mUseSensor;	 Catch:{ all -> 0x00bc }
        if (r1 != 0) goto L_0x001d;
    L_0x001b:
        monitor-exit(r0);	 Catch:{ all -> 0x00bc }
        return;
    L_0x001d:
        r1 = r8.mLastTimestamp;	 Catch:{ all -> 0x00bc }
        r1 = (double) r1;	 Catch:{ all -> 0x00bc }
        r1 = com.android.camera.Util.isEqualsZero(r1);	 Catch:{ all -> 0x00bc }
        r2 = 0;
        r3 = 1;
        if (r1 != 0) goto L_0x0046;
    L_0x0028:
        r4 = r9.timestamp;	 Catch:{ all -> 0x00bc }
        r1 = (float) r4;	 Catch:{ all -> 0x00bc }
        r4 = r8.mLastTimestamp;	 Catch:{ all -> 0x00bc }
        r1 = r1 - r4;
        r4 = 814313567; // 0x3089705f float:1.0E-9 double:4.023243584E-315;
        r1 = r1 * r4;
        r4 = r9.values;	 Catch:{ all -> 0x00bc }
        r4 = r4[r2];	 Catch:{ all -> 0x00bc }
        r5 = r9.values;	 Catch:{ all -> 0x00bc }
        r5 = r5[r3];	 Catch:{ all -> 0x00bc }
        r6 = r8.mRadianLandscape;	 Catch:{ all -> 0x00bc }
        r4 = r4 * r1;
        r6 = r6 + r4;
        r8.mRadianLandscape = r6;	 Catch:{ all -> 0x00bc }
        r4 = r8.mRadianPortrait;	 Catch:{ all -> 0x00bc }
        r5 = r5 * r1;
        r4 = r4 + r5;
        r8.mRadianPortrait = r4;	 Catch:{ all -> 0x00bc }
    L_0x0046:
        r4 = r9.timestamp;	 Catch:{ all -> 0x00bc }
        r9 = (float) r4;	 Catch:{ all -> 0x00bc }
        r8.mLastTimestamp = r9;	 Catch:{ all -> 0x00bc }
        r9 = r8.mRadianLandscape;	 Catch:{ all -> 0x00bc }
        r9 = com.android.camera.panorama.RoundDetector.radianToDegree(r9);	 Catch:{ all -> 0x00bc }
        r1 = r8.mRadianPortrait;	 Catch:{ all -> 0x00bc }
        r1 = com.android.camera.panorama.RoundDetector.radianToDegree(r1);	 Catch:{ all -> 0x00bc }
        if (r9 > 0) goto L_0x005f;
    L_0x0059:
        r4 = r8.mDirection;	 Catch:{ all -> 0x00bc }
        if (r4 != r3) goto L_0x005f;
    L_0x005d:
        r9 = r9 + 360;
    L_0x005f:
        if (r1 > 0) goto L_0x0067;
    L_0x0061:
        r4 = r8.mDirection;	 Catch:{ all -> 0x00bc }
        if (r4 != r3) goto L_0x0067;
    L_0x0065:
        r1 = r1 + 360;
    L_0x0067:
        r4 = r8.isLandscape;	 Catch:{ all -> 0x00bc }
        if (r4 == 0) goto L_0x006d;
    L_0x006b:
        r4 = r9;
        goto L_0x006e;
    L_0x006d:
        r4 = r1;
    L_0x006e:
        r5 = r8.isLandscape;	 Catch:{ all -> 0x00bc }
        if (r5 == 0) goto L_0x0075;
    L_0x0072:
        r5 = r8.mCurrentDegreeLandscape;	 Catch:{ all -> 0x00bc }
        goto L_0x0077;
    L_0x0075:
        r5 = r8.mCurrentDegreePortrait;	 Catch:{ all -> 0x00bc }
    L_0x0077:
        r6 = r8.mDirection;	 Catch:{ all -> 0x00bc }
        r7 = 180; // 0xb4 float:2.52E-43 double:8.9E-322;
        if (r6 == 0) goto L_0x008e;
    L_0x007d:
        if (r5 == 0) goto L_0x008b;
    L_0x007f:
        if (r5 < r4) goto L_0x0089;
    L_0x0081:
        r4 = r4 - r5;
        r4 = java.lang.Math.abs(r4);	 Catch:{ all -> 0x00bc }
        if (r4 >= r7) goto L_0x0089;
    L_0x0088:
        goto L_0x008b;
    L_0x0089:
        r4 = r2;
        goto L_0x009e;
        r4 = r3;
        goto L_0x009e;
    L_0x008e:
        if (r5 == 0) goto L_0x009c;
    L_0x0090:
        if (r5 > r4) goto L_0x009a;
    L_0x0092:
        r4 = r4 - r5;
        r4 = java.lang.Math.abs(r4);	 Catch:{ all -> 0x00bc }
        if (r4 >= r7) goto L_0x009a;
    L_0x0099:
        goto L_0x009c;
    L_0x009a:
        r4 = r2;
        goto L_0x009e;
        r4 = r3;
    L_0x009e:
        if (r4 == 0) goto L_0x00a4;
    L_0x00a0:
        r8.mCurrentDegreeLandscape = r9;	 Catch:{ all -> 0x00bc }
        r8.mCurrentDegreePortrait = r1;	 Catch:{ all -> 0x00bc }
    L_0x00a4:
        r9 = r8.mIsEndOk;	 Catch:{ all -> 0x00bc }
        if (r9 != 0) goto L_0x00ba;
    L_0x00a8:
        r9 = r8.currentDegree();	 Catch:{ all -> 0x00bc }
        if (r7 > r9) goto L_0x00b8;
    L_0x00ae:
        r9 = r8.currentDegree();	 Catch:{ all -> 0x00bc }
        r1 = 190; // 0xbe float:2.66E-43 double:9.4E-322;
        if (r9 > r1) goto L_0x00b8;
    L_0x00b6:
        r2 = r3;
    L_0x00b8:
        r8.mIsEndOk = r2;	 Catch:{ all -> 0x00bc }
    L_0x00ba:
        monitor-exit(r0);	 Catch:{ all -> 0x00bc }
        return;
    L_0x00bc:
        r9 = move-exception;
        monitor-exit(r0);	 Catch:{ all -> 0x00bc }
        throw r9;
        */
        throw new UnsupportedOperationException("Method not decompiled: com.android.camera.panorama.GyroscopeRoundDetector.onSensorChanged(android.hardware.SensorEvent):void");
    }
}
