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
    /* Code decompiled incorrectly, please refer to instructions dump. */
    private boolean isUpdateSensorMatrix() {
        synchronized (SensorSynchronizedObject) {
            boolean z = false;
            switch (this.mMode) {
                case 0:
                    if (!(this.mPartOfGyroscopeList.isEmpty() || this.mPartOfAccelerometerList.isEmpty() || this.mPartOfMagneticFieldList.isEmpty())) {
                        z = true;
                        break;
                    }
                case 1:
                    boolean isEmpty;
                    if (this.mGyroCalibratedMode == 0) {
                        isEmpty = this.mPartOfGyroscopeList.isEmpty() ^ true;
                        return isEmpty;
                    }
                    isEmpty = this.mPartOfGyroscopeUncalibratedList.isEmpty() ^ true;
                    return isEmpty;
                case 2:
                    if (this.mGyroCalibratedMode != 0) {
                        if (!(this.mPartOfGyroscopeUncalibratedList.isEmpty() || this.mPartOfAccelerometerList.isEmpty())) {
                            z = true;
                            break;
                        }
                    } else if (!(this.mPartOfGyroscopeList.isEmpty() || this.mPartOfAccelerometerList.isEmpty())) {
                        z = true;
                        break;
                    }
                case 3:
                    if (!(this.mPartOfAccelerometerList.isEmpty() || this.mPartOfMagneticFieldList.isEmpty())) {
                        z = true;
                        break;
                    }
                case 4:
                    if (this.mGyroCalibratedMode != 0) {
                        if (!(this.mPartOfGyroscopeUncalibratedList.isEmpty() || this.mPartOfRotationVectorList.isEmpty())) {
                            z = true;
                            break;
                        }
                    } else if (!(this.mPartOfGyroscopeList.isEmpty() || this.mPartOfRotationVectorList.isEmpty())) {
                        z = true;
                        break;
                    }
                default:
                    return false;
            }
        }
    }

    /* JADX WARNING: Removed duplicated region for block: B:27:0x00e1  */
    /* JADX WARNING: Removed duplicated region for block: B:32:0x0106  */
    /* JADX WARNING: Removed duplicated region for block: B:37:0x012b  */
    /* JADX WARNING: Removed duplicated region for block: B:27:0x00e1  */
    /* JADX WARNING: Removed duplicated region for block: B:32:0x0106  */
    /* JADX WARNING: Removed duplicated region for block: B:37:0x012b  */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    private int updateSensorMatrix() {
        ArrayList arrayList;
        ArrayList arrayList2;
        ArrayList arrayList3;
        ArrayList arrayList4;
        ArrayList arrayList5;
        int inputSensorData;
        synchronized (SensorSynchronizedObject) {
            arrayList = (ArrayList) this.mPartOfGyroscopeList.clone();
            arrayList2 = (ArrayList) this.mPartOfGyroscopeUncalibratedList.clone();
            arrayList3 = (ArrayList) this.mPartOfAccelerometerList.clone();
            arrayList4 = (ArrayList) this.mPartOfMagneticFieldList.clone();
            arrayList5 = (ArrayList) this.mPartOfRotationVectorList.clone();
            this.mPartOfGyroscopeList.clear();
            this.mPartOfGyroscopeUncalibratedList.clear();
            this.mPartOfAccelerometerList.clear();
            this.mPartOfMagneticFieldList.clear();
            this.mPartOfRotationVectorList.clear();
        }
        if (this.mStock) {
            if (this.mGyroCalibratedMode == 0) {
                ((ArrayList) this.mAllValueList.get(0)).addAll(arrayList);
            } else {
                ((ArrayList) this.mAllValueList.get(0)).addAll(arrayList2);
            }
            ((ArrayList) this.mAllValueList.get(1)).addAll(arrayList3);
            ((ArrayList) this.mAllValueList.get(2)).addAll(arrayList4);
            ((ArrayList) this.mAllValueList.get(3)).addAll(arrayList5);
        }
        if (this.mGyroCalibratedMode == 0) {
            if (!arrayList.isEmpty()) {
                inputSensorData = setInputSensorData(getSensorDataArray(arrayList), 0);
                if (inputSensorData != 0) {
                    Log.e(LOG_TAG, String.format(Locale.US, "SensorFusion.setSensorData(SENSOR_TYPE_GYROSCOPE) error ret:0x%08X", new Object[]{Integer.valueOf(inputSensorData)}));
                }
                if (!arrayList3.isEmpty()) {
                    inputSensorData = setInputSensorData(getSensorDataArray(arrayList3), 1);
                    if (inputSensorData != 0) {
                        Log.e(LOG_TAG, String.format(Locale.US, "SensorFusion.setSensorData(SENSOR_TYPE_ACCELEROMETER) error ret:0x%08X", new Object[]{Integer.valueOf(inputSensorData)}));
                    }
                }
                if (!arrayList4.isEmpty()) {
                    inputSensorData = setInputSensorData(getSensorDataArray(arrayList4), 2);
                    if (inputSensorData != 0) {
                        Log.e(LOG_TAG, String.format(Locale.US, "SensorFusion.setSensorData(SENSOR_TYPE_MAGNETIC_FIELD) error ret:0x%08X", new Object[]{Integer.valueOf(inputSensorData)}));
                    }
                }
                if (!arrayList5.isEmpty()) {
                    inputSensorData = setInputSensorData(getSensorDataArray(arrayList5), 3);
                    if (inputSensorData != 0) {
                        Log.e(LOG_TAG, String.format(Locale.US, "SensorFusion.setSensorData(SENSOR_TYPE_ROTATION_VECTOR) error ret:0x%08X", new Object[]{Integer.valueOf(inputSensorData)}));
                    }
                }
                return (((inputSensorData | this.mMorphoSensorFusion.calc()) | this.mMorphoSensorFusion.outputRotationMatrix3x3(1, this.mSensorMatrix[1])) | this.mMorphoSensorFusion.outputRotationMatrix3x3(0, this.mSensorMatrix[0])) | this.mMorphoSensorFusion.outputRotationMatrix3x3(3, this.mSensorMatrix[3]);
            }
        } else if (!arrayList2.isEmpty()) {
            inputSensorData = setInputSensorData(getSensorDataArray(arrayList2), 0);
            if (inputSensorData != 0) {
                Log.e(LOG_TAG, String.format(Locale.US, "SensorFusion.setSensorData(SENSOR_TYPE_GYROSCOPE) error ret:0x%08X", new Object[]{Integer.valueOf(inputSensorData)}));
            }
            if (arrayList3.isEmpty()) {
            }
            if (arrayList4.isEmpty()) {
            }
            if (arrayList5.isEmpty()) {
            }
            return (((inputSensorData | this.mMorphoSensorFusion.calc()) | this.mMorphoSensorFusion.outputRotationMatrix3x3(1, this.mSensorMatrix[1])) | this.mMorphoSensorFusion.outputRotationMatrix3x3(0, this.mSensorMatrix[0])) | this.mMorphoSensorFusion.outputRotationMatrix3x3(3, this.mSensorMatrix[3]);
        }
        inputSensorData = 0;
        if (arrayList3.isEmpty()) {
        }
        if (arrayList4.isEmpty()) {
        }
        if (arrayList5.isEmpty()) {
        }
        return (((inputSensorData | this.mMorphoSensorFusion.calc()) | this.mMorphoSensorFusion.outputRotationMatrix3x3(1, this.mSensorMatrix[1])) | this.mMorphoSensorFusion.outputRotationMatrix3x3(0, this.mSensorMatrix[0])) | this.mMorphoSensorFusion.outputRotationMatrix3x3(3, this.mSensorMatrix[3]);
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
