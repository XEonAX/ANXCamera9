package com.android.camera2;

import android.hardware.camera2.CameraAccessException;
import android.hardware.camera2.CameraCaptureSession;
import android.hardware.camera2.CameraCaptureSession.CaptureCallback;
import android.hardware.camera2.CaptureFailure;
import android.hardware.camera2.CaptureRequest;
import android.hardware.camera2.CaptureRequest.Builder;
import android.hardware.camera2.TotalCaptureResult;
import android.media.Image;
import android.media.ImageReader;
import android.os.AsyncTask;
import android.support.annotation.NonNull;
import com.android.camera.CameraSettings;
import com.android.camera.Exif;
import com.android.camera.Util;
import com.android.camera.data.DataRepository;
import com.android.camera.groupshot.GroupShot;
import com.android.camera.log.Log;
import com.android.camera.module.SaveOutputImageTask;
import com.android.camera.module.loader.camera2.Camera2DataContainer;
import com.android.camera.storage.SaverCallback;
import com.android.camera.storage.Storage;
import com.android.camera2.Camera2Proxy.PictureCallback;
import com.xiaomi.camera.base.PerformanceTracker;
import com.xiaomi.camera.core.ParallelCallback;
import com.xiaomi.camera.core.ParallelTaskData;
import java.util.Locale;

public class MiCamera2ShotGroup extends MiCamera2Shot<byte[]> {
    private ParallelTaskData mCurrentParallelTaskData;
    private GroupShot mGroupShot;
    private String mGroupShotFolderName;
    private int mReceivedJpegCallbackNum;
    private int mTotalJpegCallbackNum;

    public MiCamera2ShotGroup(MiCamera2 miCamera2, int i, GroupShot groupShot) {
        super(miCamera2);
        this.mTotalJpegCallbackNum = i;
        this.mGroupShot = groupShot;
    }

    protected void prepare() {
    }

    protected void startShot() {
        try {
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
                if (MiCamera2ShotGroup.this.mCurrentParallelTaskData == null) {
                    MiCamera2ShotGroup.this.mCurrentParallelTaskData = MiCamera2ShotGroup.this.generateParallelTaskData(j);
                }
            }

            public void onCaptureCompleted(@NonNull CameraCaptureSession cameraCaptureSession, @NonNull CaptureRequest captureRequest, @NonNull TotalCaptureResult totalCaptureResult) {
                String str = MiCamera2Shot.TAG;
                StringBuilder stringBuilder = new StringBuilder();
                stringBuilder.append("onCaptureCompleted: ");
                stringBuilder.append(totalCaptureResult.getFrameNumber());
                Log.d(str, stringBuilder.toString());
                MiCamera2ShotGroup.this.mMiCamera.onCapturePictureFinished(true);
            }

            public void onCaptureFailed(@NonNull CameraCaptureSession cameraCaptureSession, @NonNull CaptureRequest captureRequest, @NonNull CaptureFailure captureFailure) {
                super.onCaptureFailed(cameraCaptureSession, captureRequest, captureFailure);
                String str = MiCamera2Shot.TAG;
                StringBuilder stringBuilder = new StringBuilder();
                stringBuilder.append("Capture a still picture failed ");
                stringBuilder.append(String.valueOf(captureFailure.getReason()));
                Log.e(str, stringBuilder.toString());
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
        stringBuilder.append("captureStillPicture: size=");
        stringBuilder.append(photoImageReader.getWidth());
        stringBuilder.append("x");
        stringBuilder.append(photoImageReader.getHeight());
        Log.d(str, stringBuilder.toString());
        if (!isInQcfaMode() || Camera2DataContainer.getInstance().getBokehFrontCameraId() == this.mMiCamera.getId()) {
            createCaptureRequest.addTarget(this.mMiCamera.getPreviewSurface());
        }
        createCaptureRequest.set(CaptureRequest.CONTROL_AF_MODE, (Integer) this.mMiCamera.getPreviewRequestBuilder().get(CaptureRequest.CONTROL_AF_MODE));
        this.mMiCamera.applySettingsForCapture(createCaptureRequest, 3);
        PerformanceTracker.trackPictureCapture(0);
        return createCaptureRequest;
    }

    protected void onImageReceived(Image image, int i) {
        if (this.mCurrentParallelTaskData == null) {
            this.mCurrentParallelTaskData = generateParallelTaskData(image.getTimestamp());
        }
        byte[] firstPlane = Util.getFirstPlane(image);
        image.close();
        notifyResultData(firstPlane);
        if (this.mReceivedJpegCallbackNum < this.mTotalJpegCallbackNum && !this.mDeparted) {
            String str = TAG;
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.append("onPictureTaken: GroupShot mReceivedJpegCallbackNum = ");
            stringBuilder.append(this.mReceivedJpegCallbackNum);
            Log.d(str, stringBuilder.toString());
            startShot();
        }
    }

    protected void notifyResultData(byte[] bArr) {
        byte[] bArr2 = bArr;
        ParallelCallback parallelCallback = this.mMiCamera.getParallelCallback();
        if (parallelCallback != null && this.mCurrentParallelTaskData != null) {
            this.mReceivedJpegCallbackNum++;
            if (this.mGroupShotFolderName == null) {
                StringBuilder stringBuilder = new StringBuilder();
                stringBuilder.append(Util.createJpegName(System.currentTimeMillis()));
                stringBuilder.append(this.mCurrentParallelTaskData.getSuffix());
                this.mGroupShotFolderName = stringBuilder.toString();
            }
            int attach = this.mGroupShot.attach(bArr2);
            if (Util.sIsDumpOrigJpg) {
                Storage.saveOriginalPic(bArr2, this.mReceivedJpegCallbackNum, this.mGroupShotFolderName);
            }
            Log.v(TAG, String.format(Locale.ENGLISH, "mGroupShot attach() = 0x%08x index=%d", new Object[]{Integer.valueOf(attach), Integer.valueOf(this.mReceivedJpegCallbackNum)}));
            if (this.mReceivedJpegCallbackNum >= this.mTotalJpegCallbackNum) {
                int i;
                int i2;
                int pictureWidth = this.mCurrentParallelTaskData.getPictureWidth();
                attach = this.mCurrentParallelTaskData.getPictureHeight();
                int orientation = Exif.getOrientation(bArr);
                if ((this.mCurrentParallelTaskData.getJpegRotation() + orientation) % 180 == 0) {
                    i = pictureWidth;
                    i2 = attach;
                } else {
                    i2 = pictureWidth;
                    i = attach;
                }
                new SaveOutputImageTask((SaverCallback) this.mMiCamera.getParallelCallback(), System.currentTimeMillis(), this.mCurrentParallelTaskData.getLocation(), i, i2, orientation, this.mGroupShotFolderName, this.mGroupShot).executeOnExecutor(AsyncTask.THREAD_POOL_EXECUTOR, new Void[0]);
                PictureCallback pictureCallback = this.mMiCamera.getPictureCallback();
                if (pictureCallback != null) {
                    pictureCallback.onPictureTakenFinished(true);
                }
            } else if (this.mReceivedJpegCallbackNum == 1 && DataRepository.dataItemGlobal().getBoolean(CameraSettings.KEY_CAMERA_GROUPSHOT_PRIMITIVE, false)) {
                this.mCurrentParallelTaskData.setNeedCreateThumbnail(false);
                this.mCurrentParallelTaskData.fillJpegData(bArr2, 1);
                parallelCallback.onParallelProcessFinish(this.mCurrentParallelTaskData);
            }
        }
    }
}
