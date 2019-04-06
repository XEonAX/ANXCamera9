package com.android.camera.wideselfie;

import android.annotation.SuppressLint;
import android.content.Context;
import android.graphics.Point;
import android.graphics.Rect;
import android.hardware.Sensor;
import android.hardware.SensorEvent;
import android.hardware.SensorEventListener;
import android.hardware.SensorManager;
import android.hardware.camera2.CameraAccessException;
import android.hardware.camera2.CameraCharacteristics;
import android.hardware.camera2.CameraManager;
import android.os.Handler;
import android.os.Looper;
import android.os.Message;
import android.text.TextUtils;
import android.util.SizeF;
import com.android.camera.R;
import com.android.camera.constant.DurationConstant;
import com.android.camera.log.Log;
import com.arcsoft.camera.wideselfie.ArcWideSelfieDef.ResultCode;
import com.arcsoft.camera.wideselfie.AwsInitParameter;
import com.arcsoft.camera.wideselfie.ProcessResult;
import com.arcsoft.camera.wideselfie.WideSelfieCallback;
import com.arcsoft.camera.wideselfie.WideSelfieEngine;

public class WideSelfieEngineWrapper {
    private static final int AWS_STATE_CAPTURING = 8194;
    private static final int AWS_STATE_PREVIEW = 8193;
    private static final int AWS_STATE_STITCHING = 8195;
    public static final int DIRECTION_MOVE_LEFT = 1;
    public static final int DIRECTION_MOVE_RIGHT = 0;
    public static final int DIRECTION_NONE = -1;
    private static final String TAG = "WideSelfieEngine";
    private SizeF mAngleSize;
    private Context mContext = null;
    private volatile boolean mEngineReady = false;
    private int mFullImageHeight = 0;
    private int mFullImageWidth = 0;
    @SuppressLint({"HandlerLeak"})
    private Handler mHandle = new Handler(Looper.getMainLooper()) {
        /* JADX WARNING: Removed duplicated region for block: B:27:0x0109  */
        /* JADX WARNING: Removed duplicated region for block: B:26:0x0104  */
        /* JADX WARNING: Removed duplicated region for block: B:26:0x0104  */
        /* JADX WARNING: Removed duplicated region for block: B:27:0x0109  */
        /* Code decompiled incorrectly, please refer to instructions dump. */
        public void handleMessage(Message message) {
            ProcessResult processResult = (ProcessResult) message.obj;
            int i = message.arg1;
            if (i != 0) {
                String str = WideSelfieEngineWrapper.TAG;
                StringBuilder stringBuilder = new StringBuilder();
                stringBuilder.append("ProcessResult resultCode ");
                stringBuilder.append(i);
                Log.w(str, stringBuilder.toString());
            }
            boolean z = false;
            if (WideSelfieEngineWrapper.this.mWideSelfieCurrentCommand == 0) {
                Rect rect = WideSelfieEngineWrapper.this.mWideSelfieOrientation % 180 == 90 ? new Rect(processResult.progressBarThumbOffset.x, WideSelfieEngineWrapper.this.mPreviewRect.top + processResult.progressBarThumbOffset.y, WideSelfieEngineWrapper.this.mPreviewRect.width() + processResult.progressBarThumbOffset.x, (WideSelfieEngineWrapper.this.mPreviewRect.height() + WideSelfieEngineWrapper.this.mPreviewRect.top) + processResult.progressBarThumbOffset.y) : new Rect(WideSelfieEngineWrapper.this.mPreviewRect.left + processResult.progressBarThumbOffset.x, -processResult.progressBarThumbOffset.y, (WideSelfieEngineWrapper.this.mPreviewRect.width() + WideSelfieEngineWrapper.this.mPreviewRect.left) + processResult.progressBarThumbOffset.x, WideSelfieEngineWrapper.this.mPreviewRect.height() - processResult.progressBarThumbOffset.y);
                if (WideSelfieEngineWrapper.this.mWideSelfCallback != null) {
                    int i2;
                    int i3 = WideSelfieEngineWrapper.this.mWideSelfieOrientation % 180 == 90 ? processResult.progressBarThumbOffset.y : -processResult.progressBarThumbOffset.x;
                    if (i3 > 0) {
                        if (i3 > WideSelfieEngineWrapper.this.mPreviewRect.top) {
                            i3 -= WideSelfieEngineWrapper.this.mPreviewRect.top;
                            i2 = WideSelfieEngineWrapper.this.mWideSelfieOrientation % 180 == 90 ? processResult.progressBarThumbOffset.x : -processResult.progressBarThumbOffset.y;
                            WideSelfieEngineWrapper.this.mWideSelfCallback.onPreviewUpdate(processResult.progressBarThumbArray, processResult.progressBarThumbImageWidth, processResult.progressBarThumbImageHeight, processResult.progressBarThumbRect, rect);
                            if (processResult.progress == 100 || i == ResultCode.AWS_ERR_UNABLE_CALCULATE) {
                                z = true;
                            }
                            WideSelfieEngineWrapper.this.mWideSelfCallback.onMove(processResult.direction, processResult.progress, new Point(i3, i2), processResult.progressBarThumbOffset, z);
                        }
                    } else if ((-i3) > WideSelfieEngineWrapper.this.mPreviewRect.top) {
                        i3 += WideSelfieEngineWrapper.this.mPreviewRect.top;
                        if (WideSelfieEngineWrapper.this.mWideSelfieOrientation % 180 == 90) {
                        }
                        WideSelfieEngineWrapper.this.mWideSelfCallback.onPreviewUpdate(processResult.progressBarThumbArray, processResult.progressBarThumbImageWidth, processResult.progressBarThumbImageHeight, processResult.progressBarThumbRect, rect);
                        z = true;
                        WideSelfieEngineWrapper.this.mWideSelfCallback.onMove(processResult.direction, processResult.progress, new Point(i3, i2), processResult.progressBarThumbOffset, z);
                    }
                    i3 = 0;
                    if (WideSelfieEngineWrapper.this.mWideSelfieOrientation % 180 == 90) {
                    }
                    WideSelfieEngineWrapper.this.mWideSelfCallback.onPreviewUpdate(processResult.progressBarThumbArray, processResult.progressBarThumbImageWidth, processResult.progressBarThumbImageHeight, processResult.progressBarThumbRect, rect);
                    z = true;
                    WideSelfieEngineWrapper.this.mWideSelfCallback.onMove(processResult.direction, processResult.progress, new Point(i3, i2), processResult.progressBarThumbOffset, z);
                }
            } else if (WideSelfieEngineWrapper.this.mWideSelfieCurrentCommand == 2) {
                WideSelfieEngineWrapper.this.mWideSelfieCurrentCommand = -1;
                if (WideSelfieEngineWrapper.this.mWideSelfCallback == null || processResult.resultImageArray == null) {
                    String str2 = WideSelfieEngineWrapper.TAG;
                    StringBuilder stringBuilder2 = new StringBuilder();
                    stringBuilder2.append("not save, mWideSelfCallback ");
                    stringBuilder2.append(WideSelfieEngineWrapper.this.mWideSelfCallback);
                    stringBuilder2.append(", resultImageArray = ");
                    stringBuilder2.append(processResult.resultImageArray);
                    Log.w(str2, stringBuilder2.toString());
                } else {
                    WideSelfieEngineWrapper.this.mWideSelfCallback.onNv21Available(processResult.resultImageArray, processResult.resultImageWidth, processResult.resultImageHeight);
                }
                WideSelfieEngine.getSingleInstance().uninit();
                WideSelfieEngineWrapper.this.mEngineReady = false;
                Log.d(WideSelfieEngineWrapper.TAG, "WideSelfieEngine uninit");
            }
        }
    };
    private int mPreviewHeight = 0;
    private Rect mPreviewRect;
    private int mPreviewWidth = 0;
    private Sensor mSensor;
    private SensorEventListener mSensorEventListener = new SensorEventListener() {
        public void onAccuracyChanged(Sensor sensor, int i) {
        }

        /* JADX WARNING: Missing block: B:8:0x0024, code:
            return;
     */
        /* Code decompiled incorrectly, please refer to instructions dump. */
        public void onSensorChanged(SensorEvent sensorEvent) {
            if (!(sensorEvent.sensor == null || sensorEvent.accuracy == 0 || sensorEvent.sensor.getType() != 4)) {
                WideSelfieEngine.getSingleInstance().setSensorData(sensorEvent.values, sensorEvent.timestamp, sensorEvent.sensor.getType());
            }
        }
    };
    private SensorManager mSensorManager;
    private volatile int mState = AWS_STATE_PREVIEW;
    private int mThumbBgWidth;
    private WideSelfStateCallback mWideSelfCallback;
    private final WideSelfieCallback mWideSelfieCallback = new WideSelfieCallback() {
        public void onProcessCallback(int i, ProcessResult processResult) {
            if (processResult != null) {
                Message obtainMessage = WideSelfieEngineWrapper.this.mHandle.obtainMessage();
                obtainMessage.obj = processResult;
                obtainMessage.arg1 = i;
                WideSelfieEngineWrapper.this.mHandle.sendMessage(obtainMessage);
            }
        }
    };
    private int mWideSelfieCurrentCommand;
    private int mWideSelfieOrientation = 90;
    private int nThumbnailHeight = 0;
    private int nThumbnailWidth = 0;

    public interface WideSelfStateCallback {
        void onMove(int i, int i2, Point point, Point point2, boolean z);

        void onNv21Available(byte[] bArr, int i, int i2);

        void onPreviewUpdate(byte[] bArr, int i, int i2, Rect rect, Rect rect2);

        void onWideSelfCompleted();
    }

    public WideSelfieEngineWrapper(Context context, WideSelfStateCallback wideSelfStateCallback) {
        this.mContext = context;
        this.mWideSelfCallback = wideSelfStateCallback;
        this.mSensorManager = (SensorManager) context.getSystemService("sensor");
        this.mSensor = this.mSensorManager.getDefaultSensor(4);
        this.mThumbBgWidth = this.mContext.getResources().getDimensionPixelSize(R.dimen.chips_icon_margin_right);
    }

    private SizeF getAngleValue(CameraCharacteristics cameraCharacteristics) {
        SizeF sizeF = (SizeF) cameraCharacteristics.get(CameraCharacteristics.SENSOR_INFO_PHYSICAL_SIZE);
        float[] fArr = (float[]) cameraCharacteristics.get(CameraCharacteristics.LENS_INFO_AVAILABLE_FOCAL_LENGTHS);
        return (fArr == null || fArr.length <= 0) ? null : new SizeF((float) Math.toDegrees(StrictMath.atan((double) (sizeF.getWidth() / (fArr[0] * 2.0f))) * 2.0d), (float) Math.toDegrees(2.0d * StrictMath.atan((double) (sizeF.getHeight() / (2.0f * fArr[0])))));
    }

    public void onBurstCapture(byte[] bArr) {
        if (this.mEngineReady) {
            if (this.mState == 8194) {
                this.mWideSelfieCurrentCommand = 0;
                WideSelfieEngine.getSingleInstance().process(0, bArr);
            } else if (this.mState == AWS_STATE_STITCHING) {
                this.mState = AWS_STATE_PREVIEW;
                Log.d(TAG, "onBurstCapture STITCHING");
                byte[] bArr2 = new byte[1];
                if (this.mWideSelfCallback != null) {
                    this.mWideSelfCallback.onWideSelfCompleted();
                }
                this.mWideSelfieCurrentCommand = 1;
                WideSelfieEngine.getSingleInstance().process(1, bArr2);
                this.mWideSelfieCurrentCommand = 2;
                WideSelfieEngine.getSingleInstance().process(2, bArr2);
            }
        }
    }

    public void onDestroy() {
        this.mHandle.removeCallbacksAndMessages(null);
    }

    public void pause() {
        this.mSensorManager.unregisterListener(this.mSensorEventListener);
    }

    public void resume() {
        this.mSensorManager.registerListener(this.mSensorEventListener, this.mSensor, DurationConstant.DURATION_VIDEO_RECORDING_CIRCLE);
    }

    public void setCameraParameter(String str, int i, int i2, int i3, int i4) {
        if (!TextUtils.isEmpty(str)) {
            this.mPreviewWidth = i;
            this.mPreviewHeight = i2;
            this.mFullImageWidth = i3;
            this.mFullImageHeight = i4;
            float dimensionPixelSize = ((float) i) / ((float) this.mContext.getResources().getDimensionPixelSize(R.dimen.chips_close_padding));
            this.nThumbnailWidth = (int) (((float) this.mPreviewWidth) / dimensionPixelSize);
            this.nThumbnailHeight = (int) (((float) this.mPreviewHeight) / dimensionPixelSize);
            String str2 = TAG;
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.append("mFullImageWidth = ");
            stringBuilder.append(this.mFullImageWidth);
            stringBuilder.append(", mFullImageHeight = ");
            stringBuilder.append(this.mFullImageHeight);
            Log.d(str2, stringBuilder.toString());
            try {
                this.mAngleSize = getAngleValue(((CameraManager) this.mContext.getSystemService("camera")).getCameraCharacteristics(str));
            } catch (CameraAccessException e) {
                e.printStackTrace();
            }
        }
    }

    public void setOrientation(int i) {
        this.mWideSelfieOrientation = i;
    }

    public int startCapture() {
        int thumbBgWidth;
        int i;
        String str = TAG;
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("startCapture orientation = ");
        stringBuilder.append(this.mWideSelfieOrientation);
        Log.d(str, stringBuilder.toString());
        AwsInitParameter defaultInitParams = AwsInitParameter.getDefaultInitParams(this.mFullImageWidth, this.mFullImageHeight, 2050, this.mWideSelfieOrientation);
        WideSelfieConfig instance = WideSelfieConfig.getInstance(this.mContext);
        if (this.mWideSelfieOrientation % 180 == 90) {
            thumbBgWidth = (this.mFullImageHeight * (instance.getThumbBgWidth() - 2)) / instance.getStillPreviewWidth();
            i = (this.mThumbBgWidth - this.nThumbnailHeight) / 2;
            this.mPreviewRect = new Rect(0, i, this.nThumbnailWidth, this.nThumbnailHeight + i);
        } else {
            thumbBgWidth = (this.mFullImageWidth * (instance.getThumbBgHeightVertical() - 2)) / instance.getStillPreviewHeight();
            i = (this.mThumbBgWidth - this.nThumbnailWidth) / 2;
            this.mPreviewRect = new Rect(i, 0, this.nThumbnailWidth + i, this.nThumbnailHeight);
        }
        i = (this.mThumbBgWidth - this.nThumbnailHeight) / 2;
        this.mPreviewRect = new Rect(0, i, this.nThumbnailWidth, this.nThumbnailHeight + i);
        defaultInitParams.maxResultWidth = thumbBgWidth;
        defaultInitParams.progressBarThumbHeight = this.mWideSelfieOrientation % 180 == 90 ? this.nThumbnailWidth : this.nThumbnailHeight;
        defaultInitParams.thumbnailWidth = this.nThumbnailWidth;
        defaultInitParams.thumbnailHeight = this.nThumbnailHeight;
        defaultInitParams.guideStopBarThumbHeight = 0;
        defaultInitParams.cameraViewAngleForWidth = this.mAngleSize.getWidth();
        defaultInitParams.cameraViewAngleForHeight = this.mAngleSize.getHeight();
        Log.d(TAG, String.format("startCapture maxResultWidth = %d, progressBarThumbHeight = %d, thumbnailWidth = %d, thumbnailHeight = %d,  guideStopBarThumbHeight = %d", new Object[]{Integer.valueOf(thumbBgWidth), Integer.valueOf(defaultInitParams.progressBarThumbHeight), Integer.valueOf(this.nThumbnailWidth), Integer.valueOf(this.nThumbnailHeight), Integer.valueOf(defaultInitParams.guideStopBarThumbHeight)}));
        int init = WideSelfieEngine.getSingleInstance().init(defaultInitParams);
        this.mEngineReady = true;
        Log.d(TAG, "WideSelfieEngine init");
        WideSelfieEngine.getSingleInstance().setOnCallback(this.mWideSelfieCallback);
        this.mState = 8194;
        return init;
    }

    public void stopCapture() {
        this.mState = AWS_STATE_STITCHING;
        Log.d(TAG, "stopCapture set AWS_STATE_STITCHING");
    }
}
