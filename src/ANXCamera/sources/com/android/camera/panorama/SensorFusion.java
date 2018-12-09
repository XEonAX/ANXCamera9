package com.android.camera.panorama;

import android.hardware.Sensor;
import android.hardware.SensorEvent;
import android.hardware.SensorEventListener;
import com.android.camera.log.Log;
import com.android.camera.panorama.MorphoSensorFusion.SensorData;
import java.util.ArrayList;
import java.util.Locale;

public class SensorFusion implements SensorEventListener {
    public static final int GYRO_CALIBRATED = 0;
    public static final int GYRO_UNCALIBRATED = 1;
    private static final String LOG_TAG = "SensorFusion";
    private static final int MAX_DATA_NUM = 512;
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
    public static final int SENSOR_TYPE_NUM = 4;
    public static final int SENSOR_TYPE_ROTATION_VECTOR = 3;
    public static final int STATE_CALC_OFFSET = 0;
    public static final int STATE_PROCESS = 1;
    public static final Object SensorSynchronizedObject = new Object();
    private int camera_rotation = 1;
    private ArrayList<ArrayList<SensorData>> mAllValueList;
    private int mGyroCalibratedMode = 0;
    private int mMode;
    private MorphoSensorFusion mMorphoSensorFusion;
    private final ArrayList<SensorData> mPartOfAccelerometerList = new ArrayList();
    private final ArrayList<SensorData> mPartOfGyroscopeList = new ArrayList();
    private final ArrayList<SensorData> mPartOfGyroscopeUncalibratedList = new ArrayList();
    private final ArrayList<SensorData> mPartOfMagneticFieldList = new ArrayList();
    private final ArrayList<SensorData> mPartOfRotationVectorList = new ArrayList();
    private final double[][] mSensorMatrix;
    private final boolean mStock;

    public SensorFusion(boolean z) {
        int i;
        this.mStock = z;
        if (this.mStock) {
            this.mAllValueList = new ArrayList();
            for (i = 0; i < 4; i++) {
                this.mAllValueList.add(new ArrayList());
            }
        }
        this.mSensorMatrix = new double[4][];
        for (i = 0; i < this.mSensorMatrix.length; i++) {
            this.mSensorMatrix[i] = createMatrix();
        }
        this.mMorphoSensorFusion = new MorphoSensorFusion();
        if (this.mMorphoSensorFusion.initialize() != 0) {
            Log.e(LOG_TAG, String.format(Locale.US, "MorphoSensorFusion.initialize error ret:0x%08X", new Object[]{Integer.valueOf(i)}));
        }
    }

    public void release() {
        synchronized (this) {
            if (this.mMorphoSensorFusion.finish() != 0) {
                Log.e(LOG_TAG, String.format(Locale.US, "MorphoSensorFusion.finish error ret:0x%08X", new Object[]{Integer.valueOf(r0)}));
            }
            this.mMorphoSensorFusion = null;
        }
    }

    public int setMode(int i) {
        synchronized (this) {
            this.mMode = i;
            i = this.mMorphoSensorFusion.setMode(i) | 0;
        }
        return i;
    }

    public int setUncalibratedMode() {
        synchronized (this) {
            this.mGyroCalibratedMode = 1;
        }
        return 0;
    }

    public int setOffsetMode(int i) {
        synchronized (this) {
            i = this.mMorphoSensorFusion.setOffsetMode(i) | 0;
        }
        return i;
    }

    public int setOffset(SensorData sensorData, int i) {
        int offset;
        synchronized (this) {
            if (this.mMode == 4) {
                offset = this.mMorphoSensorFusion.setOffset(sensorData, i) | 0;
            } else {
                offset = -2147483646;
            }
        }
        return offset;
    }

    public int setAppState(int i) {
        synchronized (this) {
            i = this.mMorphoSensorFusion.setAppState(i) | 0;
        }
        return i;
    }

    public int setRotation(int i) {
        this.camera_rotation = i;
        synchronized (this) {
            i = this.mMorphoSensorFusion.setRotation(i) | 0;
        }
        return i;
    }

    public void setInitialOrientation(int i) {
        double toRadians = Math.toRadians((double) i);
        calcRotationMatrix(this.mSensorMatrix[0], 0.0d, 0.0d, toRadians);
        calcRotationMatrix(this.mSensorMatrix[3], 0.0d, 0.0d, toRadians);
        calcRotationMatrix(this.mSensorMatrix[1], 0.0d, 0.0d, toRadians);
    }

    public void resetOffsetValue() {
        synchronized (this) {
            this.mMorphoSensorFusion.setAppState(1);
            this.mMorphoSensorFusion.calc();
        }
    }

    public int getSensorMatrix(double[] dArr, double[] dArr2, double[] dArr3, int[] iArr) {
        int updateSensorMatrix;
        synchronized (this) {
            int i = 0;
            if (isUpdateSensorMatrix()) {
                updateSensorMatrix = updateSensorMatrix() | 0;
            } else {
                updateSensorMatrix = 0;
            }
            if (dArr != null) {
                System.arraycopy(this.mSensorMatrix[0], 0, dArr, 0, this.mSensorMatrix[0].length);
            }
            if (dArr2 != null) {
                System.arraycopy(this.mSensorMatrix[3], 0, dArr2, 0, this.mSensorMatrix[3].length);
            }
            if (dArr3 != null) {
                System.arraycopy(this.mSensorMatrix[1], 0, dArr3, 0, this.mSensorMatrix[1].length);
            }
            if (this.mStock && iArr != null && iArr.length == this.mAllValueList.size()) {
                while (i < this.mAllValueList.size()) {
                    iArr[i] = ((ArrayList) this.mAllValueList.get(i)).size() - 1;
                    i++;
                }
            }
        }
        return updateSensorMatrix;
    }

    public ArrayList<ArrayList<SensorData>> getStockData() {
        if (!this.mStock) {
            return new ArrayList();
        }
        ArrayList<ArrayList<SensorData>> arrayList;
        synchronized (this) {
            arrayList = this.mAllValueList;
        }
        return arrayList;
    }

    public void clearStockData() {
        synchronized (this) {
            if (this.mStock) {
                for (int i = 0; i < this.mAllValueList.size(); i++) {
                    ((ArrayList) this.mAllValueList.get(i)).clear();
                }
            }
        }
    }

    public void onAccuracyChanged(Sensor sensor, int i) {
    }

    public void onSensorChanged(SensorEvent sensorEvent) {
        synchronized (SensorSynchronizedObject) {
            SensorData sensorData = new SensorData(sensorEvent.timestamp, sensorEvent.values);
            switch (sensorEvent.sensor.getType()) {
                case 1:
                    this.mPartOfAccelerometerList.add(sensorData);
                    break;
                case 2:
                    this.mPartOfMagneticFieldList.add(sensorData);
                    break;
                case 4:
                    if (this.camera_rotation == 3) {
                        sensorData.mValues[0] = -sensorData.mValues[0];
                        sensorData.mValues[1] = -sensorData.mValues[1];
                    }
                    this.mPartOfGyroscopeList.add(sensorData);
                    break;
                case 15:
                    this.mPartOfRotationVectorList.add(sensorData);
                    break;
                case 16:
                    if (this.camera_rotation == 3) {
                        sensorData.mValues[0] = -sensorData.mValues[0];
                        sensorData.mValues[1] = -sensorData.mValues[1];
                    }
                    this.mPartOfGyroscopeUncalibratedList.add(sensorData);
                    break;
            }
            while (this.mPartOfGyroscopeList.size() > 512) {
                this.mPartOfGyroscopeList.remove(0);
            }
            while (this.mPartOfGyroscopeUncalibratedList.size() > 512) {
                this.mPartOfGyroscopeUncalibratedList.remove(0);
            }
            while (this.mPartOfAccelerometerList.size() > 512) {
                this.mPartOfAccelerometerList.remove(0);
            }
            while (this.mPartOfMagneticFieldList.size() > 512) {
                this.mPartOfMagneticFieldList.remove(0);
            }
            while (this.mPartOfRotationVectorList.size() > 512) {
                this.mPartOfRotationVectorList.remove(0);
            }
        }
    }

    /* JADX WARNING: Missing block: B:14:0x0024, code:
            return r2;
     */
    /* JADX WARNING: Missing block: B:21:0x0038, code:
            return r2;
     */
    /* JADX WARNING: Missing block: B:28:0x004c, code:
            return r2;
     */
    /* JADX WARNING: Missing block: B:37:0x0064, code:
            return r2;
     */
    /* JADX WARNING: Missing block: B:44:0x0078, code:
            return r2;
     */
    /* JADX WARNING: Missing block: B:61:0x00aa, code:
            return r2;
     */
    private boolean isUpdateSensorMatrix() {
        /*
        r4 = this;
        r0 = SensorSynchronizedObject;
        monitor-enter(r0);
        r1 = r4.mMode;	 Catch:{ all -> 0x00ac }
        r2 = 0;
        r3 = 1;
        switch(r1) {
            case 0: goto L_0x008f;
            case 1: goto L_0x0079;
            case 2: goto L_0x004d;
            case 3: goto L_0x0039;
            case 4: goto L_0x000d;
            default: goto L_0x000a;
        };	 Catch:{ all -> 0x00ac }
    L_0x000a:
        monitor-exit(r0);	 Catch:{ all -> 0x00ac }
        goto L_0x00ab;
    L_0x000d:
        r1 = r4.mGyroCalibratedMode;	 Catch:{ all -> 0x00ac }
        if (r1 != 0) goto L_0x0025;
    L_0x0011:
        r1 = r4.mPartOfGyroscopeList;	 Catch:{ all -> 0x00ac }
        r1 = r1.isEmpty();	 Catch:{ all -> 0x00ac }
        if (r1 != 0) goto L_0x0023;
    L_0x0019:
        r1 = r4.mPartOfRotationVectorList;	 Catch:{ all -> 0x00ac }
        r1 = r1.isEmpty();	 Catch:{ all -> 0x00ac }
        if (r1 != 0) goto L_0x0023;
    L_0x0021:
        r2 = r3;
    L_0x0023:
        monitor-exit(r0);	 Catch:{ all -> 0x00ac }
        return r2;
    L_0x0025:
        r1 = r4.mPartOfGyroscopeUncalibratedList;	 Catch:{ all -> 0x00ac }
        r1 = r1.isEmpty();	 Catch:{ all -> 0x00ac }
        if (r1 != 0) goto L_0x0037;
    L_0x002d:
        r1 = r4.mPartOfRotationVectorList;	 Catch:{ all -> 0x00ac }
        r1 = r1.isEmpty();	 Catch:{ all -> 0x00ac }
        if (r1 != 0) goto L_0x0037;
    L_0x0035:
        r2 = r3;
    L_0x0037:
        monitor-exit(r0);	 Catch:{ all -> 0x00ac }
        return r2;
    L_0x0039:
        r1 = r4.mPartOfAccelerometerList;	 Catch:{ all -> 0x00ac }
        r1 = r1.isEmpty();	 Catch:{ all -> 0x00ac }
        if (r1 != 0) goto L_0x004b;
    L_0x0041:
        r1 = r4.mPartOfMagneticFieldList;	 Catch:{ all -> 0x00ac }
        r1 = r1.isEmpty();	 Catch:{ all -> 0x00ac }
        if (r1 != 0) goto L_0x004b;
    L_0x0049:
        r2 = r3;
    L_0x004b:
        monitor-exit(r0);	 Catch:{ all -> 0x00ac }
        return r2;
    L_0x004d:
        r1 = r4.mGyroCalibratedMode;	 Catch:{ all -> 0x00ac }
        if (r1 != 0) goto L_0x0065;
    L_0x0051:
        r1 = r4.mPartOfGyroscopeList;	 Catch:{ all -> 0x00ac }
        r1 = r1.isEmpty();	 Catch:{ all -> 0x00ac }
        if (r1 != 0) goto L_0x0063;
    L_0x0059:
        r1 = r4.mPartOfAccelerometerList;	 Catch:{ all -> 0x00ac }
        r1 = r1.isEmpty();	 Catch:{ all -> 0x00ac }
        if (r1 != 0) goto L_0x0063;
    L_0x0061:
        r2 = r3;
    L_0x0063:
        monitor-exit(r0);	 Catch:{ all -> 0x00ac }
        return r2;
    L_0x0065:
        r1 = r4.mPartOfGyroscopeUncalibratedList;	 Catch:{ all -> 0x00ac }
        r1 = r1.isEmpty();	 Catch:{ all -> 0x00ac }
        if (r1 != 0) goto L_0x0077;
    L_0x006d:
        r1 = r4.mPartOfAccelerometerList;	 Catch:{ all -> 0x00ac }
        r1 = r1.isEmpty();	 Catch:{ all -> 0x00ac }
        if (r1 != 0) goto L_0x0077;
    L_0x0075:
        r2 = r3;
    L_0x0077:
        monitor-exit(r0);	 Catch:{ all -> 0x00ac }
        return r2;
    L_0x0079:
        r1 = r4.mGyroCalibratedMode;	 Catch:{ all -> 0x00ac }
        if (r1 != 0) goto L_0x0086;
    L_0x007d:
        r1 = r4.mPartOfGyroscopeList;	 Catch:{ all -> 0x00ac }
        r1 = r1.isEmpty();	 Catch:{ all -> 0x00ac }
        r1 = r1 ^ r3;
        monitor-exit(r0);	 Catch:{ all -> 0x00ac }
        return r1;
    L_0x0086:
        r1 = r4.mPartOfGyroscopeUncalibratedList;	 Catch:{ all -> 0x00ac }
        r1 = r1.isEmpty();	 Catch:{ all -> 0x00ac }
        r1 = r1 ^ r3;
        monitor-exit(r0);	 Catch:{ all -> 0x00ac }
        return r1;
    L_0x008f:
        r1 = r4.mPartOfGyroscopeList;	 Catch:{ all -> 0x00ac }
        r1 = r1.isEmpty();	 Catch:{ all -> 0x00ac }
        if (r1 != 0) goto L_0x00a9;
    L_0x0097:
        r1 = r4.mPartOfAccelerometerList;	 Catch:{ all -> 0x00ac }
        r1 = r1.isEmpty();	 Catch:{ all -> 0x00ac }
        if (r1 != 0) goto L_0x00a9;
    L_0x009f:
        r1 = r4.mPartOfMagneticFieldList;	 Catch:{ all -> 0x00ac }
        r1 = r1.isEmpty();	 Catch:{ all -> 0x00ac }
        if (r1 != 0) goto L_0x00a9;
    L_0x00a7:
        r2 = r3;
    L_0x00a9:
        monitor-exit(r0);	 Catch:{ all -> 0x00ac }
        return r2;
    L_0x00ab:
        return r2;
    L_0x00ac:
        r1 = move-exception;
        monitor-exit(r0);	 Catch:{ all -> 0x00ac }
        throw r1;
        */
        throw new UnsupportedOperationException("Method not decompiled: com.android.camera.panorama.SensorFusion.isUpdateSensorMatrix():boolean");
    }

    /* JADX WARNING: Removed duplicated region for block: B:27:0x00e1  */
    /* JADX WARNING: Removed duplicated region for block: B:32:0x0106  */
    /* JADX WARNING: Removed duplicated region for block: B:37:0x012b  */
    /* JADX WARNING: Removed duplicated region for block: B:27:0x00e1  */
    /* JADX WARNING: Removed duplicated region for block: B:32:0x0106  */
    /* JADX WARNING: Removed duplicated region for block: B:37:0x012b  */
    private int updateSensorMatrix() {
        /*
        r13 = this;
        r0 = SensorSynchronizedObject;
        monitor-enter(r0);
        r1 = r13.mPartOfGyroscopeList;	 Catch:{ all -> 0x0173 }
        r1 = r1.clone();	 Catch:{ all -> 0x0173 }
        r1 = (java.util.ArrayList) r1;	 Catch:{ all -> 0x0173 }
        r2 = r13.mPartOfGyroscopeUncalibratedList;	 Catch:{ all -> 0x0173 }
        r2 = r2.clone();	 Catch:{ all -> 0x0173 }
        r2 = (java.util.ArrayList) r2;	 Catch:{ all -> 0x0173 }
        r3 = r13.mPartOfAccelerometerList;	 Catch:{ all -> 0x0173 }
        r3 = r3.clone();	 Catch:{ all -> 0x0173 }
        r3 = (java.util.ArrayList) r3;	 Catch:{ all -> 0x0173 }
        r4 = r13.mPartOfMagneticFieldList;	 Catch:{ all -> 0x0173 }
        r4 = r4.clone();	 Catch:{ all -> 0x0173 }
        r4 = (java.util.ArrayList) r4;	 Catch:{ all -> 0x0173 }
        r5 = r13.mPartOfRotationVectorList;	 Catch:{ all -> 0x0173 }
        r5 = r5.clone();	 Catch:{ all -> 0x0173 }
        r5 = (java.util.ArrayList) r5;	 Catch:{ all -> 0x0173 }
        r6 = r13.mPartOfGyroscopeList;	 Catch:{ all -> 0x0173 }
        r6.clear();	 Catch:{ all -> 0x0173 }
        r6 = r13.mPartOfGyroscopeUncalibratedList;	 Catch:{ all -> 0x0173 }
        r6.clear();	 Catch:{ all -> 0x0173 }
        r6 = r13.mPartOfAccelerometerList;	 Catch:{ all -> 0x0173 }
        r6.clear();	 Catch:{ all -> 0x0173 }
        r6 = r13.mPartOfMagneticFieldList;	 Catch:{ all -> 0x0173 }
        r6.clear();	 Catch:{ all -> 0x0173 }
        r6 = r13.mPartOfRotationVectorList;	 Catch:{ all -> 0x0173 }
        r6.clear();	 Catch:{ all -> 0x0173 }
        monitor-exit(r0);	 Catch:{ all -> 0x0173 }
        r0 = r13.mStock;
        r6 = 2;
        r7 = 3;
        r8 = 1;
        r9 = 0;
        if (r0 == 0) goto L_0x008a;
    L_0x004e:
        r0 = r13.mGyroCalibratedMode;
        if (r0 != 0) goto L_0x005e;
    L_0x0052:
        r0 = r13.mAllValueList;
        r0 = r0.get(r9);
        r0 = (java.util.ArrayList) r0;
        r0.addAll(r1);
        goto L_0x0069;
    L_0x005e:
        r0 = r13.mAllValueList;
        r0 = r0.get(r9);
        r0 = (java.util.ArrayList) r0;
        r0.addAll(r2);
    L_0x0069:
        r0 = r13.mAllValueList;
        r0 = r0.get(r8);
        r0 = (java.util.ArrayList) r0;
        r0.addAll(r3);
        r0 = r13.mAllValueList;
        r0 = r0.get(r6);
        r0 = (java.util.ArrayList) r0;
        r0.addAll(r4);
        r0 = r13.mAllValueList;
        r0 = r0.get(r7);
        r0 = (java.util.ArrayList) r0;
        r0.addAll(r5);
    L_0x008a:
        r0 = r13.mGyroCalibratedMode;
        if (r0 != 0) goto L_0x00b4;
    L_0x008e:
        r0 = r1.isEmpty();
        if (r0 != 0) goto L_0x00da;
    L_0x0094:
        r0 = r13.getSensorDataArray(r1);
        r0 = r13.setInputSensorData(r0, r9);
        if (r0 == 0) goto L_0x00db;
    L_0x009e:
        r1 = "SensorFusion";
        r2 = java.util.Locale.US;
        r10 = "SensorFusion.setSensorData(SENSOR_TYPE_GYROSCOPE) error ret:0x%08X";
        r11 = new java.lang.Object[r8];
        r12 = java.lang.Integer.valueOf(r0);
        r11[r9] = r12;
        r2 = java.lang.String.format(r2, r10, r11);
        com.android.camera.log.Log.e(r1, r2);
        goto L_0x00db;
    L_0x00b4:
        r0 = r2.isEmpty();
        if (r0 != 0) goto L_0x00da;
    L_0x00ba:
        r0 = r13.getSensorDataArray(r2);
        r0 = r13.setInputSensorData(r0, r9);
        if (r0 == 0) goto L_0x00db;
    L_0x00c4:
        r1 = "SensorFusion";
        r2 = java.util.Locale.US;
        r10 = "SensorFusion.setSensorData(SENSOR_TYPE_GYROSCOPE) error ret:0x%08X";
        r11 = new java.lang.Object[r8];
        r12 = java.lang.Integer.valueOf(r0);
        r11[r9] = r12;
        r2 = java.lang.String.format(r2, r10, r11);
        com.android.camera.log.Log.e(r1, r2);
        goto L_0x00db;
    L_0x00da:
        r0 = r9;
    L_0x00db:
        r1 = r3.isEmpty();
        if (r1 != 0) goto L_0x0100;
    L_0x00e1:
        r0 = r13.getSensorDataArray(r3);
        r0 = r13.setInputSensorData(r0, r8);
        if (r0 == 0) goto L_0x0100;
    L_0x00eb:
        r1 = "SensorFusion";
        r2 = java.util.Locale.US;
        r3 = "SensorFusion.setSensorData(SENSOR_TYPE_ACCELEROMETER) error ret:0x%08X";
        r10 = new java.lang.Object[r8];
        r11 = java.lang.Integer.valueOf(r0);
        r10[r9] = r11;
        r2 = java.lang.String.format(r2, r3, r10);
        com.android.camera.log.Log.e(r1, r2);
    L_0x0100:
        r1 = r4.isEmpty();
        if (r1 != 0) goto L_0x0125;
    L_0x0106:
        r0 = r13.getSensorDataArray(r4);
        r0 = r13.setInputSensorData(r0, r6);
        if (r0 == 0) goto L_0x0125;
    L_0x0110:
        r1 = "SensorFusion";
        r2 = java.util.Locale.US;
        r3 = "SensorFusion.setSensorData(SENSOR_TYPE_MAGNETIC_FIELD) error ret:0x%08X";
        r4 = new java.lang.Object[r8];
        r6 = java.lang.Integer.valueOf(r0);
        r4[r9] = r6;
        r2 = java.lang.String.format(r2, r3, r4);
        com.android.camera.log.Log.e(r1, r2);
    L_0x0125:
        r1 = r5.isEmpty();
        if (r1 != 0) goto L_0x014a;
    L_0x012b:
        r0 = r13.getSensorDataArray(r5);
        r0 = r13.setInputSensorData(r0, r7);
        if (r0 == 0) goto L_0x014a;
    L_0x0135:
        r1 = "SensorFusion";
        r2 = java.util.Locale.US;
        r3 = "SensorFusion.setSensorData(SENSOR_TYPE_ROTATION_VECTOR) error ret:0x%08X";
        r4 = new java.lang.Object[r8];
        r5 = java.lang.Integer.valueOf(r0);
        r4[r9] = r5;
        r2 = java.lang.String.format(r2, r3, r4);
        com.android.camera.log.Log.e(r1, r2);
    L_0x014a:
        r1 = r13.mMorphoSensorFusion;
        r1 = r1.calc();
        r0 = r0 | r1;
        r1 = r13.mMorphoSensorFusion;
        r2 = r13.mSensorMatrix;
        r2 = r2[r8];
        r1 = r1.outputRotationMatrix3x3(r8, r2);
        r0 = r0 | r1;
        r1 = r13.mMorphoSensorFusion;
        r2 = r13.mSensorMatrix;
        r2 = r2[r9];
        r1 = r1.outputRotationMatrix3x3(r9, r2);
        r0 = r0 | r1;
        r1 = r13.mMorphoSensorFusion;
        r2 = r13.mSensorMatrix;
        r2 = r2[r7];
        r1 = r1.outputRotationMatrix3x3(r7, r2);
        r0 = r0 | r1;
        return r0;
    L_0x0173:
        r1 = move-exception;
        monitor-exit(r0);	 Catch:{ all -> 0x0173 }
        throw r1;
        */
        throw new UnsupportedOperationException("Method not decompiled: com.android.camera.panorama.SensorFusion.updateSensorMatrix():int");
    }

    private Object[] getSensorDataArray(ArrayList<SensorData> arrayList) {
        int size = arrayList.size();
        Object[] objArr = new Object[size];
        for (int i = 0; i < size; i++) {
            objArr[i] = new SensorData(((SensorData) arrayList.get(i)).mTimeStamp, ((SensorData) arrayList.get(i)).mValues);
        }
        arrayList.clear();
        return objArr;
    }

    private int setInputSensorData(Object[] objArr, int i) {
        if (objArr == null) {
            return -2147483647;
        }
        return this.mMorphoSensorFusion.setSensorData(objArr, i);
    }

    private void calcRotationMatrix(double[] dArr, double d, double d2, double d3) {
        double[] createMatrix = createMatrix();
        double[] createMatrix2 = createMatrix();
        double[] createMatrix3 = createMatrix();
        double[] createMatrix4 = createMatrix();
        createMatrix[4] = Math.cos(d2);
        createMatrix[5] = -Math.sin(d2);
        createMatrix[7] = Math.sin(d2);
        createMatrix[8] = Math.cos(d2);
        createMatrix2[0] = Math.cos(d);
        createMatrix2[2] = Math.sin(d);
        createMatrix2[6] = -Math.sin(d);
        createMatrix2[8] = Math.cos(d);
        createMatrix3[0] = Math.cos(d3);
        createMatrix3[1] = -Math.sin(d3);
        createMatrix3[3] = Math.sin(d3);
        createMatrix3[4] = Math.cos(d3);
        multMatrix(createMatrix4, createMatrix, createMatrix2);
        multMatrix(dArr, createMatrix4, createMatrix3);
    }

    private double[] createMatrix() {
        return new double[]{1.0d, 0.0d, 0.0d, 0.0d, 1.0d, 0.0d, 0.0d, 0.0d, 1.0d};
    }

    private void multMatrix(double[] dArr, double[] dArr2, double[] dArr3) {
        Object obj = new double[9];
        for (int i = 0; i < 3; i++) {
            for (int i2 = 0; i2 < 3; i2++) {
                double d = 0.0d;
                for (int i3 = 0; i3 < 3; i3++) {
                    d += dArr2[(i * 3) + i3] * dArr3[(i3 * 3) + i2];
                }
                obj[(i * 3) + i2] = d;
            }
        }
        System.arraycopy(obj, 0, dArr, 0, obj.length);
    }
}
