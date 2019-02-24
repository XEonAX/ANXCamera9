package com.xiaomi.protocol;

import android.hardware.camera2.CaptureRequest;
import android.hardware.camera2.TotalCaptureResult;
import android.os.Build.VERSION;
import android.os.Parcel;
import android.os.Parcelable;
import android.os.Parcelable.Creator;
import android.util.Log;
import java.lang.reflect.Array;
import java.lang.reflect.Constructor;

public class ICustomCaptureResult implements Parcelable {
    private static final String CAPTURE_RESULT_EXTRA_CLASS = "android.hardware.camera2.impl.CaptureResultExtras";
    public static final Creator<ICustomCaptureResult> CREATOR = new Creator<ICustomCaptureResult>() {
        public ICustomCaptureResult createFromParcel(Parcel parcel) {
            return new ICustomCaptureResult(parcel);
        }

        public ICustomCaptureResult[] newArray(int i) {
            return new ICustomCaptureResult[i];
        }
    };
    private static final String PHYSICAL_CAPTURE_RESULT_CLASS = "android.hardware.camera2.impl.PhysicalCaptureResultInfo";
    private static final String TAG = ICustomCaptureResult.class.getSimpleName();
    private long mFrameNumber;
    private CaptureRequest mRequest;
    private Parcelable mResults;
    private int mSequenceId;
    private int mSessionId;
    private long mTimeStamp;

    public ICustomCaptureResult(int i, int i2, long j, Parcelable parcelable, CaptureRequest captureRequest) {
        this.mSessionId = i;
        this.mSequenceId = i2;
        this.mFrameNumber = j;
        this.mResults = parcelable;
        this.mRequest = captureRequest;
    }

    public Parcelable getResults() {
        return this.mResults;
    }

    public void setResults(Parcelable parcelable) {
        this.mResults = parcelable;
    }

    public CaptureRequest getRequest() {
        return this.mRequest;
    }

    public int getSequenceId() {
        return this.mSequenceId;
    }

    public long getFrameNumber() {
        return this.mFrameNumber;
    }

    public int getSessionId() {
        return this.mSessionId;
    }

    public void setSessionId(int i) {
        this.mSessionId = i;
    }

    public void setRequest(CaptureRequest captureRequest) {
        this.mRequest = captureRequest;
    }

    public void setSequenceId(int i) {
        this.mSequenceId = i;
    }

    public void setFrameNumber(long j) {
        this.mFrameNumber = j;
    }

    public long getTimeStamp() {
        return this.mTimeStamp;
    }

    public void setTimeStamp(long j) {
        this.mTimeStamp = j;
    }

    public static TotalCaptureResult toTotalCaptureResult(ICustomCaptureResult iCustomCaptureResult, int i) {
        try {
            int sequenceId = iCustomCaptureResult.getSequenceId();
            long frameNumber = iCustomCaptureResult.getFrameNumber();
            String str = TAG;
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.append("toTotalCaptureResult: ");
            stringBuilder.append(i);
            stringBuilder.append("|");
            stringBuilder.append(sequenceId);
            stringBuilder.append("|");
            stringBuilder.append(frameNumber);
            Log.d(str, stringBuilder.toString());
            Constructor declaredConstructor = Class.forName(CAPTURE_RESULT_EXTRA_CLASS).getDeclaredConstructor(new Class[]{Integer.TYPE, Integer.TYPE, Integer.TYPE, Integer.TYPE, Long.TYPE, Integer.TYPE, Integer.TYPE});
            Object newInstance = declaredConstructor.newInstance(new Object[]{Integer.valueOf(sequenceId), Integer.valueOf(0), Integer.valueOf(0), Integer.valueOf(0), Long.valueOf(frameNumber), Integer.valueOf(0), Integer.valueOf(0)});
            for (Constructor constructor : TotalCaptureResult.class.getDeclaredConstructors()) {
                if (constructor.getParameters().length > 2) {
                    declaredConstructor = constructor;
                    break;
                }
            }
            if (getCameraMetaDataCopy(iCustomCaptureResult.getResults()) == null) {
                return null;
            }
            if (VERSION.SDK_INT < 28) {
                return (TotalCaptureResult) declaredConstructor.newInstance(new Object[]{r2, iCustomCaptureResult.getRequest(), newInstance, null, Integer.valueOf(i)});
            }
            Object newInstance2 = Array.newInstance(Class.forName(PHYSICAL_CAPTURE_RESULT_CLASS), 0);
            return (TotalCaptureResult) declaredConstructor.newInstance(new Object[]{r2, iCustomCaptureResult.getRequest(), newInstance, null, Integer.valueOf(i), newInstance2});
        } catch (Exception e) {
            e.printStackTrace();
            Log.e(TAG, "null capture result!");
            return null;
        }
    }

    /* JADX WARNING: Removed duplicated region for block: B:3:0x0019 A:{ExcHandler: java.lang.ClassNotFoundException (r4_3 'e' java.lang.Throwable), Splitter: B:0:0x0000} */
    /* JADX WARNING: Removed duplicated region for block: B:3:0x0019 A:{ExcHandler: java.lang.ClassNotFoundException (r4_3 'e' java.lang.Throwable), Splitter: B:0:0x0000} */
    /* JADX WARNING: Removed duplicated region for block: B:3:0x0019 A:{ExcHandler: java.lang.ClassNotFoundException (r4_3 'e' java.lang.Throwable), Splitter: B:0:0x0000} */
    /* JADX WARNING: Removed duplicated region for block: B:3:0x0019 A:{ExcHandler: java.lang.ClassNotFoundException (r4_3 'e' java.lang.Throwable), Splitter: B:0:0x0000} */
    /* JADX WARNING: Missing block: B:3:0x0019, code:
            r4 = move-exception;
     */
    /* JADX WARNING: Missing block: B:4:0x001a, code:
            android.util.Log.e(TAG, "getCameraMetaDataCopy: failed: ", r4);
     */
    /* JADX WARNING: Missing block: B:5:0x0022, code:
            return null;
     */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    public static Object getCameraMetaDataCopy(Object obj) {
        try {
            return Class.forName("android.hardware.camera2.impl.CameraMetadataNative").getDeclaredConstructor(new Class[]{Class.forName("android.hardware.camera2.impl.CameraMetadataNative")}).newInstance(new Object[]{obj});
        } catch (Throwable e) {
        }
    }

    public String toString() {
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("ICustomCaptureResult{mSessionId=");
        stringBuilder.append(this.mSessionId);
        stringBuilder.append(", mSequenceId=");
        stringBuilder.append(this.mSequenceId);
        stringBuilder.append(", mFrameNumber=");
        stringBuilder.append(this.mFrameNumber);
        stringBuilder.append(", mResults=");
        stringBuilder.append(this.mResults);
        stringBuilder.append(", mRequest=");
        stringBuilder.append(this.mRequest);
        stringBuilder.append('}');
        return stringBuilder.toString();
    }

    public int describeContents() {
        return 0;
    }

    public void writeToParcel(Parcel parcel, int i) {
        parcel.writeInt(this.mSessionId);
        parcel.writeInt(this.mSequenceId);
        parcel.writeLong(this.mFrameNumber);
        parcel.writeLong(this.mTimeStamp);
        parcel.writeParcelable(this.mResults, i);
        parcel.writeParcelable(this.mRequest, i);
    }

    protected ICustomCaptureResult(Parcel parcel) {
        this.mSessionId = parcel.readInt();
        this.mSequenceId = parcel.readInt();
        this.mFrameNumber = parcel.readLong();
        this.mTimeStamp = parcel.readLong();
        this.mResults = parcel.readParcelable(Parcelable.class.getClassLoader());
        this.mRequest = (CaptureRequest) parcel.readParcelable(CaptureRequest.class.getClassLoader());
    }
}
