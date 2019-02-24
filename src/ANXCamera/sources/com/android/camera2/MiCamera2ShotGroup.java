package com.android.camera2;

import android.content.Context;
import android.hardware.camera2.CameraAccessException;
import android.hardware.camera2.CameraCaptureSession;
import android.hardware.camera2.CameraCaptureSession.CaptureCallback;
import android.hardware.camera2.CaptureFailure;
import android.hardware.camera2.CaptureRequest;
import android.hardware.camera2.CaptureRequest.Builder;
import android.hardware.camera2.CaptureResult;
import android.hardware.camera2.TotalCaptureResult;
import android.hardware.camera2.params.Face;
import android.media.Image;
import android.media.ImageReader;
import android.os.AsyncTask;
import android.support.annotation.NonNull;
import com.android.camera.CameraSettings;
import com.android.camera.CameraSize;
import com.android.camera.Exif;
import com.android.camera.Util;
import com.android.camera.groupshot.GroupShot;
import com.android.camera.log.Log;
import com.android.camera.module.SaveOutputImageTask;
import com.android.camera.module.loader.camera2.Camera2DataContainer;
import com.android.camera.storage.SaverCallback;
import com.android.camera.storage.Storage;
import com.android.camera2.Camera2Proxy.PictureCallback;
import com.mi.config.b;
import com.xiaomi.camera.base.PerformanceTracker;
import com.xiaomi.camera.core.ParallelCallback;
import com.xiaomi.camera.core.ParallelTaskData;
import com.xiaomi.camera.core.ParallelTaskDataParameter;
import java.util.Locale;

public class MiCamera2ShotGroup extends MiCamera2Shot<byte[]> {
    private static final String TAG = MiCamera2ShotGroup.class.getSimpleName();
    private final int MAX_GROUP_FACE_NUM = 10;
    private CaptureResult mCaptureResult;
    private Context mContext;
    private ParallelTaskData mCurrentParallelTaskData;
    private GroupShot mGroupShot;
    private String mGroupShotFolderName;
    private int mReceivedJpegCallbackNum;
    private int mTotalJpegCallbackNum;

    public MiCamera2ShotGroup(MiCamera2 miCamera2, int i, Context context, CaptureResult captureResult) {
        super(miCamera2);
        this.mTotalJpegCallbackNum = i;
        this.mContext = context;
        this.mCaptureResult = captureResult;
    }

    protected void prepare() {
        prepareGroupShot();
    }

    private void prepareGroupShot() {
        this.mTotalJpegCallbackNum = getGroupShotNum();
        initGroupShot(this.mTotalJpegCallbackNum);
        if (this.mGroupShot != null) {
            this.mGroupShot.attach_start(1);
        } else {
            this.mTotalJpegCallbackNum = 1;
        }
    }

    private int getGroupShotNum() {
        if (Util.isMemoryRich(this.mContext)) {
            return getGroupShotMaxImage();
        }
        return 1;
    }

    private void initGroupShot(int i) {
        if (this.mGroupShot == null || this.mGroupShot.isUsed()) {
            this.mGroupShot = new GroupShot();
        }
        int deviceOrientation = this.mMiCamera.getCameraConfigs().getDeviceOrientation();
        if (deviceOrientation == -1) {
            deviceOrientation = 0;
        }
        CameraSize pictureSize = this.mMiCamera.getPictureSize();
        CameraSize previewSize = this.mMiCamera.getPreviewSize();
        if (deviceOrientation % 180 == 0 && b.hI()) {
            this.mGroupShot.initialize(i, 10, pictureSize.getHeight(), pictureSize.getWidth(), previewSize.getHeight(), previewSize.getWidth());
            return;
        }
        this.mGroupShot.initialize(i, 10, pictureSize.getWidth(), pictureSize.getHeight(), previewSize.getWidth(), previewSize.getHeight());
    }

    private int getGroupShotMaxImage() {
        Face[] faceArr = (Face[]) this.mCaptureResult.get(CaptureResult.STATISTICS_FACES);
        return Util.clamp((faceArr != null ? faceArr.length : 0) + 1, 2, 4);
    }

    protected void startSessionCapture() {
        try {
            if (this.mCurrentParallelTaskData == null) {
                this.mCurrentParallelTaskData = generateParallelTaskData(0);
                if (this.mCurrentParallelTaskData == null) {
                    Log.w(TAG, "startSessionCapture: null task data");
                    return;
                }
            }
            CaptureCallback generateCaptureCallback = generateCaptureCallback();
            Builder generateRequestBuilder = generateRequestBuilder();
            PerformanceTracker.trackPictureCapture(0);
            this.mMiCamera.getCaptureSession().capture(generateRequestBuilder.build(), generateCaptureCallback, this.mCameraHandler);
        } catch (CameraAccessException e) {
            e.printStackTrace();
            Log.e(TAG, "Cannot capture a still picture");
            this.mMiCamera.notifyOnError(e.getReason());
        } catch (Throwable e2) {
            Log.e(TAG, "Failed to capture a still picture, IllegalState", e2);
            this.mMiCamera.notifyOnError(256);
        }
    }

    protected CaptureCallback generateCaptureCallback() {
        return new CaptureCallback() {
            public void onCaptureStarted(@NonNull CameraCaptureSession cameraCaptureSession, @NonNull CaptureRequest captureRequest, long j, long j2) {
                super.onCaptureStarted(cameraCaptureSession, captureRequest, j, j2);
                if (0 == MiCamera2ShotGroup.this.mCurrentParallelTaskData.getTimestamp()) {
                    MiCamera2ShotGroup.this.mCurrentParallelTaskData.setTimestamp(j);
                }
            }

            public void onCaptureCompleted(@NonNull CameraCaptureSession cameraCaptureSession, @NonNull CaptureRequest captureRequest, @NonNull TotalCaptureResult totalCaptureResult) {
                String access$100 = MiCamera2ShotGroup.TAG;
                StringBuilder stringBuilder = new StringBuilder();
                stringBuilder.append("onCaptureCompleted: ");
                stringBuilder.append(totalCaptureResult.getFrameNumber());
                Log.d(access$100, stringBuilder.toString());
                MiCamera2ShotGroup.this.mMiCamera.onCapturePictureFinished(MiCamera2ShotGroup.this.mReceivedJpegCallbackNum >= MiCamera2ShotGroup.this.mTotalJpegCallbackNum);
            }

            public void onCaptureFailed(@NonNull CameraCaptureSession cameraCaptureSession, @NonNull CaptureRequest captureRequest, @NonNull CaptureFailure captureFailure) {
                super.onCaptureFailed(cameraCaptureSession, captureRequest, captureFailure);
                String access$100 = MiCamera2ShotGroup.TAG;
                StringBuilder stringBuilder = new StringBuilder();
                stringBuilder.append("onCaptureFailed: ");
                stringBuilder.append(captureFailure.getReason());
                Log.e(access$100, stringBuilder.toString());
                MiCamera2ShotGroup.this.mMiCamera.onCapturePictureFinished(false);
            }
        };
    }

    protected Builder generateRequestBuilder() throws CameraAccessException, IllegalStateException {
        Builder createCaptureRequest = this.mMiCamera.getCameraDevice().createCaptureRequest(2);
        ImageReader photoImageReader = this.mMiCamera.getPhotoImageReader();
        createCaptureRequest.addTarget(photoImageReader.getSurface());
        String str = TAG;
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("size=");
        stringBuilder.append(photoImageReader.getWidth());
        stringBuilder.append("x");
        stringBuilder.append(photoImageReader.getHeight());
        Log.d(str, stringBuilder.toString());
        if (!isInQcfaMode() || Camera2DataContainer.getInstance().getBokehFrontCameraId() == this.mMiCamera.getId()) {
            createCaptureRequest.addTarget(this.mMiCamera.getPreviewSurface());
        }
        createCaptureRequest.set(CaptureRequest.CONTROL_AF_MODE, (Integer) this.mMiCamera.getPreviewRequestBuilder().get(CaptureRequest.CONTROL_AF_MODE));
        this.mMiCamera.applySettingsForCapture(createCaptureRequest, 3);
        return createCaptureRequest;
    }

    protected void onImageReceived(Image image, int i) {
        String str = TAG;
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("onImageReceived: ");
        stringBuilder.append(this.mReceivedJpegCallbackNum);
        stringBuilder.append("/");
        stringBuilder.append(this.mTotalJpegCallbackNum);
        Log.d(str, stringBuilder.toString());
        long timestamp = image.getTimestamp();
        if (0 == this.mCurrentParallelTaskData.getTimestamp()) {
            Log.w(TAG, "onImageReceived: image arrived first");
            this.mCurrentParallelTaskData.setTimestamp(timestamp);
        }
        byte[] firstPlane = Util.getFirstPlane(image);
        image.close();
        notifyResultData(firstPlane);
        if (this.mReceivedJpegCallbackNum < this.mTotalJpegCallbackNum && !this.mDeparted) {
            startSessionCapture();
        }
    }

    protected void notifyResultData(byte[] bArr) {
        byte[] bArr2 = bArr;
        this.mReceivedJpegCallbackNum++;
        ParallelCallback parallelCallback = this.mMiCamera.getParallelCallback();
        if (parallelCallback != null) {
            ParallelTaskDataParameter dataParameter = this.mCurrentParallelTaskData.getDataParameter();
            if (this.mGroupShotFolderName == null) {
                StringBuilder stringBuilder = new StringBuilder();
                stringBuilder.append(Util.createJpegName(System.currentTimeMillis()));
                stringBuilder.append(dataParameter.getSuffix());
                this.mGroupShotFolderName = stringBuilder.toString();
            }
            int attach = this.mGroupShot.attach(bArr2);
            if (Util.sIsDumpOrigJpg) {
                Storage.saveOriginalPic(bArr2, this.mReceivedJpegCallbackNum, this.mGroupShotFolderName);
            }
            Log.v(TAG, String.format(Locale.ENGLISH, "groupShot attach() = 0x%08x index=%d", new Object[]{Integer.valueOf(attach), Integer.valueOf(this.mReceivedJpegCallbackNum)}));
            if (this.mReceivedJpegCallbackNum >= this.mTotalJpegCallbackNum) {
                int i;
                int i2;
                int width = dataParameter.getPictureSize().getWidth();
                attach = dataParameter.getPictureSize().getHeight();
                int orientation = Exif.getOrientation(bArr);
                if ((dataParameter.getJpegRotation() + orientation) % 180 == 0) {
                    i = width;
                    i2 = attach;
                } else {
                    i2 = width;
                    i = attach;
                }
                new SaveOutputImageTask((SaverCallback) this.mMiCamera.getParallelCallback(), System.currentTimeMillis(), dataParameter.getLocation(), i, i2, orientation, this.mGroupShotFolderName, this.mGroupShot).executeOnExecutor(AsyncTask.THREAD_POOL_EXECUTOR, new Void[0]);
                PictureCallback pictureCallback = this.mMiCamera.getPictureCallback();
                if (pictureCallback != null) {
                    pictureCallback.onPictureTakenFinished(true);
                }
            } else if (this.mReceivedJpegCallbackNum == 1 && CameraSettings.isSaveGroushotPrimitiveOn()) {
                this.mCurrentParallelTaskData.setNeedThumbnail(false);
                this.mCurrentParallelTaskData.fillJpegData(bArr2, 0);
                parallelCallback.onParallelProcessFinish(this.mCurrentParallelTaskData);
            }
        }
    }
}
