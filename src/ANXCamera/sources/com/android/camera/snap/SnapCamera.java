package com.android.camera.snap;

import android.annotation.TargetApi;
import android.content.ContentValues;
import android.content.Context;
import android.graphics.SurfaceTexture;
import android.hardware.camera2.CameraAccessException;
import android.hardware.camera2.CameraCaptureSession;
import android.hardware.camera2.CameraCaptureSession.CaptureCallback;
import android.hardware.camera2.CameraDevice;
import android.hardware.camera2.CameraDevice.StateCallback;
import android.hardware.camera2.CameraManager;
import android.hardware.camera2.CaptureFailure;
import android.hardware.camera2.CaptureRequest;
import android.hardware.camera2.CaptureRequest.Builder;
import android.hardware.camera2.CaptureResult;
import android.hardware.camera2.TotalCaptureResult;
import android.location.Location;
import android.media.CamcorderProfile;
import android.media.Image;
import android.media.ImageReader;
import android.media.ImageReader.OnImageAvailableListener;
import android.media.MediaRecorder;
import android.media.MediaRecorder.OnErrorListener;
import android.media.MediaRecorder.OnInfoListener;
import android.net.Uri;
import android.os.Handler;
import android.os.HandlerThread;
import android.os.Message;
import android.os.ParcelFileDescriptor;
import android.os.Process;
import android.provider.MediaStore.Video.Media;
import android.provider.Settings.Secure;
import android.provider.Settings.System;
import android.support.annotation.NonNull;
import android.view.OrientationEventListener;
import android.view.Surface;
import com.android.camera.CameraSettings;
import com.android.camera.CameraSize;
import com.android.camera.Exif;
import com.android.camera.FileCompat;
import com.android.camera.LocationManager;
import com.android.camera.PictureSizeManager;
import com.android.camera.R;
import com.android.camera.Util;
import com.android.camera.data.DataRepository;
import com.android.camera.log.Log;
import com.android.camera.module.VideoModule;
import com.android.camera.module.loader.camera2.Camera2DataContainer;
import com.android.camera.storage.MediaProviderUtil;
import com.android.camera.storage.Storage;
import com.android.camera2.CameraCapabilities;
import com.mi.config.b;
import com.xiaomi.camera.core.PictureInfo;
import java.io.Closeable;
import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Arrays;
import java.util.List;
import java.util.Locale;

@TargetApi(26)
public class SnapCamera implements OnErrorListener, OnInfoListener {
    private static final int MSG_FOCUS_TIMEOUT = 1;
    private static final String SUFFIX = "_SNAP";
    private static final String TAG = SnapCamera.class.getSimpleName();
    private Handler mBackgroundHandler;
    private HandlerThread mBackgroundThread;
    private CameraCapabilities mCameraCapabilities;
    private CameraDevice mCameraDevice;
    private Handler mCameraHandler;
    private int mCameraId;
    private StateCallback mCameraStateCallback = new StateCallback() {
        public void onOpened(@NonNull CameraDevice cameraDevice) {
            synchronized (SnapCamera.this) {
                SnapCamera.this.mCameraDevice = cameraDevice;
            }
            if (SnapCamera.this.mStatusListener != null) {
                SnapCamera.this.mStatusListener.onCameraOpened();
            }
        }

        public void onDisconnected(@NonNull CameraDevice cameraDevice) {
            Log.w(SnapCamera.TAG, "onDisconnected");
            SnapCamera.this.release();
        }

        public void onError(@NonNull CameraDevice cameraDevice, int i) {
            String access$100 = SnapCamera.TAG;
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.append("onError: ");
            stringBuilder.append(i);
            Log.e(access$100, stringBuilder.toString());
            SnapCamera.this.release();
        }
    };
    private final CaptureCallback mCaptureCallback = new CaptureCallback() {
        public void onCaptureCompleted(CameraCaptureSession cameraCaptureSession, CaptureRequest captureRequest, TotalCaptureResult totalCaptureResult) {
            process(totalCaptureResult);
        }

        public void onCaptureFailed(@NonNull CameraCaptureSession cameraCaptureSession, @NonNull CaptureRequest captureRequest, @NonNull CaptureFailure captureFailure) {
            super.onCaptureFailed(cameraCaptureSession, captureRequest, captureFailure);
            Log.e(SnapCamera.TAG, "onCaptureFailed");
        }

        private void process(CaptureResult captureResult) {
            if (SnapCamera.this.mCameraDevice != null && !SnapCamera.this.mFocused && captureResult.get(CaptureResult.CONTROL_AF_STATE) != null) {
                Integer num = (Integer) captureResult.get(CaptureResult.CONTROL_AF_STATE);
                String access$100 = SnapCamera.TAG;
                StringBuilder stringBuilder = new StringBuilder();
                stringBuilder.append("process: afState=");
                stringBuilder.append(num);
                stringBuilder.append(" aeState=");
                stringBuilder.append(captureResult.get(CaptureResult.CONTROL_AE_STATE));
                stringBuilder.append(" mFocused=");
                stringBuilder.append(SnapCamera.this.mFocused);
                Log.d(access$100, stringBuilder.toString());
                if (2 == num.intValue()) {
                    SnapCamera.this.mFocused = true;
                    SnapCamera.this.mCameraHandler.removeMessages(1);
                }
            }
        }
    };
    private CameraCaptureSession mCaptureSession;
    private ContentValues mContentValues = null;
    private Context mContext;
    private volatile boolean mFocused = false;
    private HandlerThread mHandlerThread;
    private int mHeight;
    private boolean mIsCamcorder = false;
    private Handler mMainHandler;
    private MediaRecorder mMediaRecorder;
    private int mOrientation = 0;
    private OrientationEventListener mOrientationListener;
    private final OnImageAvailableListener mPhotoAvailableListener = new OnImageAvailableListener() {
        public void onImageAvailable(ImageReader imageReader) {
            Image acquireNextImage;
            try {
                acquireNextImage = imageReader.acquireNextImage();
                if (acquireNextImage == null) {
                    if (acquireNextImage != null) {
                        acquireNextImage.close();
                    }
                    return;
                }
                byte[] firstPlane = Util.getFirstPlane(acquireNextImage);
                if (firstPlane != null) {
                    SnapCamera.this.onPictureTaken(firstPlane);
                }
                if (acquireNextImage != null) {
                    acquireNextImage.close();
                }
            } catch (Throwable th) {
                Log.e(SnapCamera.TAG, th.getMessage(), th);
            } catch (Throwable th2) {
                r0.addSuppressed(th2);
            }
        }
    };
    private ImageReader mPhotoImageReader;
    private Builder mPreviewRequestBuilder;
    private Surface mPreviewSurface;
    private CamcorderProfile mProfile;
    private boolean mRecording = false;
    private CameraCaptureSession.StateCallback mSessionCallback = new CameraCaptureSession.StateCallback() {
        public void onConfigured(@NonNull CameraCaptureSession cameraCaptureSession) {
            synchronized (SnapCamera.this) {
                if (SnapCamera.this.mCameraDevice == null) {
                    Log.e(SnapCamera.TAG, "onConfigured: CameraDevice was already closed.");
                    cameraCaptureSession.close();
                    return;
                }
                SnapCamera.this.mCaptureSession = cameraCaptureSession;
                SnapCamera.this.startPreview();
                SnapCamera.this.capture();
            }
        }

        public void onConfigureFailed(@NonNull CameraCaptureSession cameraCaptureSession) {
            Log.e(SnapCamera.TAG, "sessionCb: onConfigureFailed");
        }
    };
    private SnapStatusListener mStatusListener;
    private SurfaceTexture mSurfaceTexture;
    private Builder mVideoRequestBuilder;
    private int mWidth;

    public interface SnapStatusListener {
        void onCameraOpened();

        void onDone(Uri uri);

        void onSkipCapture();
    }

    public void onError(MediaRecorder mediaRecorder, int i, int i2) {
        stopCamcorder();
    }

    public void onInfo(MediaRecorder mediaRecorder, int i, int i2) {
        if (i == 800 || i == 801) {
            Log.d(TAG, "duration or file size reach MAX");
            stopCamcorder();
        }
    }

    public SnapCamera(Context context, SnapStatusListener snapStatusListener) {
        try {
            LocationManager.instance().recordLocation(CameraSettings.isRecordLocation());
            this.mStatusListener = snapStatusListener;
            this.mContext = context;
            initHandler();
            initSnapType();
            initOrientationListener();
            initCamera();
        } catch (Exception e) {
            String str = TAG;
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.append("init failed ");
            stringBuilder.append(e.getMessage());
            Log.e(str, stringBuilder.toString());
        }
    }

    public static boolean isSnapEnabled(Context context) {
        String string = DataRepository.dataItemGlobal().getString(CameraSettings.KEY_CAMERA_SNAP, null);
        if (string != null) {
            Secure.putString(context.getContentResolver(), "key_long_press_volume_down", CameraSettings.getMiuiSettingsKeyForStreetSnap(string));
            DataRepository.dataItemGlobal().editor().remove(CameraSettings.KEY_CAMERA_SNAP).apply();
        }
        String string2 = Secure.getString(context.getContentResolver(), "key_long_press_volume_down");
        if ("public_transportation_shortcuts".equals(string2) || "none".equals(string2)) {
            return false;
        }
        return true;
    }

    private void initHandler() {
        this.mHandlerThread = new HandlerThread("SnapCameraThread");
        this.mHandlerThread.start();
        this.mMainHandler = new Handler();
        this.mCameraHandler = new Handler(this.mHandlerThread.getLooper()) {
            public void handleMessage(Message message) {
                if (1 == message.what) {
                    SnapCamera.this.mFocused = true;
                }
            }
        };
    }

    private void initSnapType() {
        String string = Secure.getString(this.mContext.getContentResolver(), "key_long_press_volume_down");
        if (string.equals("Street-snap-picture")) {
            this.mIsCamcorder = false;
        } else if (string.equals("Street-snap-movie")) {
            this.mIsCamcorder = true;
        } else {
            this.mIsCamcorder = false;
        }
    }

    /* JADX WARNING: Removed duplicated region for block: B:14:0x00dc A:{Splitter: B:4:0x0022, ExcHandler: android.hardware.camera2.CameraAccessException (r0_10 'e' java.lang.Throwable)} */
    /* JADX WARNING: Missing block: B:14:0x00dc, code:
            r0 = move-exception;
     */
    /* JADX WARNING: Missing block: B:15:0x00dd, code:
            r1 = TAG;
            r2 = new java.lang.StringBuilder();
            r2.append("initCamera: ");
            r2.append(r0.getMessage());
            com.android.camera.log.Log.e(r1, r2.toString(), r0);
     */
    /* JADX WARNING: Missing block: B:16:0x00f7, code:
            return;
     */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    private void initCamera() {
        this.mCameraId = 0;
        if (System.getInt(this.mContext.getContentResolver(), "persist.camera.snap.auto_switch", 0) == 1) {
            this.mCameraId = CameraSettings.readPreferredCameraId();
        }
        CameraManager cameraManager = (CameraManager) this.mContext.getSystemService("camera");
        try {
            String valueOf = String.valueOf(this.mCameraId);
            cameraManager.openCamera(valueOf, this.mCameraStateCallback, this.mMainHandler);
            this.mCameraCapabilities = new CameraCapabilities(cameraManager.getCameraCharacteristics(valueOf));
            if (isCamcorder()) {
                int preferVideoQuality = CameraSettings.getPreferVideoQuality();
                if (CamcorderProfile.hasProfile(this.mCameraId, preferVideoQuality)) {
                    this.mProfile = CamcorderProfile.get(this.mCameraId, preferVideoQuality);
                } else {
                    String str = TAG;
                    StringBuilder stringBuilder = new StringBuilder();
                    stringBuilder.append("invalid camcorder profile ");
                    stringBuilder.append(preferVideoQuality);
                    Log.w(str, stringBuilder.toString());
                    this.mProfile = CamcorderProfile.get(this.mCameraId, 5);
                }
            } else {
                PictureSizeManager.initialize(this.mCameraCapabilities.getSupportedOutputSize(256), 0);
                CameraSize bestPictureSize = PictureSizeManager.getBestPictureSize(Util.getRatio(DataRepository.provider().dataConfig(this.mCameraId, 0).getString("pref_camera_picturesize_key", PictureSizeManager.getDefaultValue())));
                CameraSize optimalPreviewSize = Util.getOptimalPreviewSize(163, this.mCameraId, this.mCameraCapabilities.getSupportedOutputSize(SurfaceTexture.class), (double) CameraSettings.getPreviewAspectRatio(bestPictureSize.width, bestPictureSize.height));
                this.mSurfaceTexture = new SurfaceTexture(false);
                this.mSurfaceTexture.setDefaultBufferSize(optimalPreviewSize.width, optimalPreviewSize.height);
                this.mPreviewSurface = new Surface(this.mSurfaceTexture);
                preparePhotoImageReader(bestPictureSize);
                this.mWidth = bestPictureSize.width;
                this.mHeight = bestPictureSize.height;
            }
        } catch (Throwable e) {
        }
    }

    private void initOrientationListener() {
        this.mOrientationListener = new OrientationEventListener(this.mContext, b.hI() ? 2 : 3) {
            public void onOrientationChanged(int i) {
                SnapCamera.this.mOrientation = Util.roundOrientation(i, SnapCamera.this.mOrientation);
            }
        };
        if (this.mOrientationListener.canDetectOrientation()) {
            Log.d(TAG, "Can detect orientation");
            this.mOrientationListener.enable();
            return;
        }
        Log.d(TAG, "Cannot detect orientation");
        this.mOrientationListener.disable();
    }

    private synchronized void startPreview() {
        if (this.mCameraDevice == null) {
            Log.e(TAG, "startPreview: CameraDevice was already closed");
            return;
        } else if (this.mCaptureSession == null) {
            Log.e(TAG, "startPreview: null capture session");
            return;
        } else {
            try {
                this.mPreviewRequestBuilder = this.mCameraDevice.createCaptureRequest(1);
                this.mPreviewRequestBuilder.addTarget(this.mPreviewSurface);
                applySettingsForPreview(this.mPreviewRequestBuilder);
                this.mCaptureSession.setRepeatingRequest(this.mPreviewRequestBuilder.build(), this.mCaptureCallback, this.mCameraHandler);
                this.mCameraHandler.sendEmptyMessageDelayed(1, 3000);
            } catch (CameraAccessException e) {
                Log.e(TAG, e.getMessage());
            }
        }
        return;
    }

    private void applySettingsForPreview(Builder builder) {
        builder.set(CaptureRequest.CONTROL_MODE, Integer.valueOf(1));
        builder.set(CaptureRequest.CONTROL_AF_MODE, Integer.valueOf(4));
        builder.set(CaptureRequest.CONTROL_AE_MODE, Integer.valueOf(1));
        builder.set(CaptureRequest.FLASH_MODE, Integer.valueOf(0));
        builder.set(CaptureRequest.CONTROL_AWB_MODE, Integer.valueOf(1));
    }

    private void preparePhotoImageReader(@NonNull CameraSize cameraSize) {
        if (this.mPhotoImageReader != null) {
            this.mPhotoImageReader.close();
        }
        this.mPhotoImageReader = ImageReader.newInstance(cameraSize.getWidth(), cameraSize.getHeight(), 256, 2);
        this.mPhotoImageReader.setOnImageAvailableListener(this.mPhotoAvailableListener, this.mCameraHandler);
    }

    public boolean isCamcorder() {
        return this.mIsCamcorder;
    }

    public synchronized void takeSnap() {
        if (this.mCameraDevice == null) {
            Log.e(TAG, "takeSnap: CameraDevice is opening or was already closed.");
        } else if (this.mCaptureSession == null) {
            try {
                this.mCameraDevice.createCaptureSession(Arrays.asList(new Surface[]{this.mPreviewSurface, this.mPhotoImageReader.getSurface()}), this.mSessionCallback, this.mCameraHandler);
            } catch (Throwable e) {
                String str = TAG;
                StringBuilder stringBuilder = new StringBuilder();
                stringBuilder.append("takeSnap: ");
                stringBuilder.append(e.getMessage());
                Log.e(str, stringBuilder.toString(), e);
            }
        } else {
            capture();
        }
    }

    private synchronized void capture() {
        if (this.mFocused) {
            try {
                Builder createCaptureRequest = this.mCameraDevice.createCaptureRequest(2);
                createCaptureRequest.addTarget(this.mPhotoImageReader.getSurface());
                int jpegRotation = Util.getJpegRotation(this.mCameraId, this.mOrientation);
                createCaptureRequest.set(CaptureRequest.JPEG_ORIENTATION, Integer.valueOf(jpegRotation));
                String str = TAG;
                StringBuilder stringBuilder = new StringBuilder();
                stringBuilder.append("orientation=");
                stringBuilder.append(jpegRotation);
                Log.d(str, stringBuilder.toString());
                Location currentLocation = LocationManager.instance().getCurrentLocation();
                if (currentLocation != null) {
                    createCaptureRequest.set(CaptureRequest.JPEG_GPS_LOCATION, currentLocation);
                }
                createCaptureRequest.set(CaptureRequest.CONTROL_AF_MODE, (Integer) this.mPreviewRequestBuilder.get(CaptureRequest.CONTROL_AF_MODE));
                this.mCaptureSession.capture(createCaptureRequest.build(), this.mCaptureCallback, this.mCameraHandler);
            } catch (Throwable e) {
                String str2 = TAG;
                StringBuilder stringBuilder2 = new StringBuilder();
                stringBuilder2.append("takeSnap: ");
                stringBuilder2.append(e.getMessage());
                Log.e(str2, stringBuilder2.toString(), e);
            }
        } else if (this.mStatusListener != null) {
            this.mStatusListener.onSkipCapture();
        }
    }

    public synchronized void release() {
        Log.d(TAG, "release(): E");
        try {
            this.mOrientation = 0;
            LocationManager.instance().recordLocation(false);
            if (this.mOrientationListener != null) {
                this.mOrientationListener.disable();
                this.mOrientationListener = null;
            }
        } catch (Throwable e) {
            Log.e(TAG, e.getMessage(), e);
        }
        try {
            stopCamcorder();
        } catch (Throwable e2) {
            Log.e(TAG, e2.getMessage(), e2);
        }
        try {
            if (this.mSurfaceTexture != null) {
                this.mSurfaceTexture.release();
                this.mSurfaceTexture = null;
            }
        } catch (Throwable e22) {
            Log.e(TAG, e22.getMessage(), e22);
        }
        if (this.mCameraHandler != null) {
            this.mCameraHandler.removeCallbacksAndMessages(null);
        }
        if (this.mHandlerThread != null) {
            this.mHandlerThread.quitSafely();
        }
        if (this.mCaptureSession != null) {
            this.mCaptureSession.close();
            this.mCaptureSession = null;
        }
        if (this.mCameraDevice != null) {
            this.mCameraDevice.close();
            this.mCameraDevice = null;
        }
        Log.d(TAG, "release(): X");
        return;
    }

    private void onPictureTaken(byte[] bArr) {
        try {
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.append(Util.createJpegName(System.currentTimeMillis()));
            stringBuilder.append(SUFFIX);
            Uri addImageForSnapCamera = Storage.addImageForSnapCamera(this.mContext, stringBuilder.toString(), System.currentTimeMillis(), LocationManager.instance().getCurrentLocation(), Exif.getOrientation(bArr), bArr, this.mWidth, this.mHeight, false, false, false, null, getPictureInfo());
            if (this.mStatusListener != null) {
                this.mStatusListener.onDone(addImageForSnapCamera);
            }
        } catch (Exception e) {
            String str = TAG;
            StringBuilder stringBuilder2 = new StringBuilder();
            stringBuilder2.append("save picture failed ");
            stringBuilder2.append(e.getMessage());
            Log.e(str, stringBuilder2.toString());
        }
    }

    private PictureInfo getPictureInfo() {
        PictureInfo pictureInfo = new PictureInfo();
        pictureInfo.setSensorType(this.mCameraId == Camera2DataContainer.getInstance().getFrontCameraId());
        return pictureInfo;
    }

    private void setupMediaRecorder() {
        ParcelFileDescriptor parcelFileDescriptor;
        Throwable e;
        this.mMediaRecorder = new MediaRecorder();
        this.mMediaRecorder.setAudioSource(5);
        this.mMediaRecorder.setVideoSource(2);
        this.mProfile.duration = SnapTrigger.MAX_VIDEO_DURATION;
        this.mMediaRecorder.setProfile(this.mProfile);
        this.mMediaRecorder.setMaxDuration(this.mProfile.duration);
        Location currentLocation = LocationManager.instance().getCurrentLocation();
        if (currentLocation != null) {
            this.mMediaRecorder.setLocation((float) currentLocation.getLatitude(), (float) currentLocation.getLongitude());
        }
        long currentTimeMillis = System.currentTimeMillis();
        String format = new SimpleDateFormat(this.mContext.getString(R.string.video_file_name_format), Locale.ENGLISH).format(Long.valueOf(currentTimeMillis));
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append(format);
        stringBuilder.append(SUFFIX);
        stringBuilder.append(Util.convertOutputFormatToFileExt(this.mProfile.fileFormat));
        String stringBuilder2 = stringBuilder.toString();
        String convertOutputFormatToMimeType = Util.convertOutputFormatToMimeType(this.mProfile.fileFormat);
        StringBuilder stringBuilder3 = new StringBuilder();
        stringBuilder3.append(Storage.DIRECTORY);
        stringBuilder3.append('/');
        stringBuilder3.append(stringBuilder2);
        String stringBuilder4 = stringBuilder3.toString();
        this.mContentValues = new ContentValues(7);
        this.mContentValues.put("title", format);
        this.mContentValues.put("_display_name", stringBuilder2);
        this.mContentValues.put("datetaken", Long.valueOf(currentTimeMillis));
        this.mContentValues.put("mime_type", convertOutputFormatToMimeType);
        this.mContentValues.put("_data", stringBuilder4);
        StringBuilder stringBuilder5 = new StringBuilder();
        stringBuilder5.append(Integer.toString(this.mProfile.videoFrameWidth));
        stringBuilder5.append("x");
        stringBuilder5.append(Integer.toString(this.mProfile.videoFrameHeight));
        this.mContentValues.put("resolution", stringBuilder5.toString());
        if (currentLocation != null) {
            this.mContentValues.put("latitude", Double.valueOf(currentLocation.getLatitude()));
            this.mContentValues.put("longitude", Double.valueOf(currentLocation.getLongitude()));
        }
        long availableSpace = Storage.getAvailableSpace() - Storage.LOW_STORAGE_THRESHOLD;
        if (VideoModule.VIDEO_MAX_SINGLE_FILE_SIZE < availableSpace && DataRepository.dataItemFeature().fj()) {
            stringBuilder2 = TAG;
            StringBuilder stringBuilder6 = new StringBuilder();
            stringBuilder6.append("need reduce , now maxFileSize = ");
            stringBuilder6.append(availableSpace);
            Log.d(stringBuilder2, stringBuilder6.toString());
            availableSpace = VideoModule.VIDEO_MAX_SINGLE_FILE_SIZE;
        }
        if (availableSpace < VideoModule.VIDEO_MIN_SINGLE_FILE_SIZE) {
            availableSpace = VideoModule.VIDEO_MIN_SINGLE_FILE_SIZE;
        }
        try {
            this.mMediaRecorder.setMaxFileSize(availableSpace);
        } catch (RuntimeException e2) {
        }
        setRecorderOrientationHint();
        this.mMediaRecorder.setOnErrorListener(this);
        this.mMediaRecorder.setOnInfoListener(this);
        Closeable closeable = null;
        try {
            String str = TAG;
            StringBuilder stringBuilder7 = new StringBuilder();
            stringBuilder7.append("save to ");
            stringBuilder7.append(stringBuilder4);
            Log.d(str, stringBuilder7.toString());
            if (Storage.isUseDocumentMode()) {
                ParcelFileDescriptor parcelFileDescriptor2 = FileCompat.getParcelFileDescriptor(stringBuilder4, true);
                try {
                    this.mMediaRecorder.setOutputFile(parcelFileDescriptor2.getFileDescriptor());
                    closeable = parcelFileDescriptor2;
                } catch (Throwable e3) {
                    parcelFileDescriptor = parcelFileDescriptor2;
                    e = e3;
                    closeable = parcelFileDescriptor;
                    try {
                        String str2 = TAG;
                        stringBuilder5 = new StringBuilder();
                        stringBuilder5.append("prepare failed for ");
                        stringBuilder5.append(stringBuilder4);
                        Log.e(str2, stringBuilder5.toString(), e);
                        Util.closeSilently(closeable);
                    } catch (Throwable th) {
                        e = th;
                        Util.closeSilently(closeable);
                        throw e;
                    }
                } catch (Throwable e32) {
                    parcelFileDescriptor = parcelFileDescriptor2;
                    e = e32;
                    closeable = parcelFileDescriptor;
                    Util.closeSilently(closeable);
                    throw e;
                }
            }
            this.mMediaRecorder.setOutputFile(stringBuilder4);
            this.mMediaRecorder.prepare();
        } catch (IOException e4) {
            e = e4;
        }
        Util.closeSilently(closeable);
    }

    private void setRecorderOrientationHint() {
        int sensorOrientation = this.mCameraCapabilities.getSensorOrientation();
        if (this.mOrientation != -1) {
            if (this.mCameraCapabilities.getFacing() == 0) {
                sensorOrientation = ((sensorOrientation - this.mOrientation) + 360) % 360;
            } else {
                sensorOrientation = (sensorOrientation + this.mOrientation) % 360;
            }
        }
        String str = TAG;
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("setOrientationHint: ");
        stringBuilder.append(sensorOrientation);
        Log.d(str, stringBuilder.toString());
        this.mMediaRecorder.setOrientationHint(sensorOrientation);
    }

    private void startBackgroundThread() {
        this.mBackgroundThread = new HandlerThread("CameraBackground");
        this.mBackgroundThread.start();
        Process.setThreadPriority(-16);
        this.mBackgroundHandler = new Handler(this.mBackgroundThread.getLooper());
    }

    private void stopBackgroundThread() {
        this.mBackgroundThread.quitSafely();
        try {
            this.mBackgroundThread.join();
            this.mBackgroundThread = null;
            this.mBackgroundHandler = null;
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
    }

    public synchronized void startCamcorder() {
        if (this.mCameraDevice == null) {
            Log.e(TAG, "startCamcorder: CameraDevice is opening or was already closed");
            return;
        }
        startBackgroundThread();
        setupMediaRecorder();
        List asList = Arrays.asList(new Surface[]{this.mMediaRecorder.getSurface()});
        try {
            this.mVideoRequestBuilder = this.mCameraDevice.createCaptureRequest(3);
            this.mVideoRequestBuilder.addTarget(this.mMediaRecorder.getSurface());
            this.mCameraDevice.createCaptureSession(asList, new CameraCaptureSession.StateCallback() {
                public void onConfigured(@NonNull CameraCaptureSession cameraCaptureSession) {
                    try {
                        cameraCaptureSession.setRepeatingRequest(SnapCamera.this.mVideoRequestBuilder.build(), new CaptureCallback() {
                            public void onCaptureStarted(CameraCaptureSession cameraCaptureSession, CaptureRequest captureRequest, long j, long j2) {
                                if (!SnapCamera.this.mRecording) {
                                    try {
                                        SnapCamera.this.mMediaRecorder.start();
                                    } catch (Throwable e) {
                                        String access$100 = SnapCamera.TAG;
                                        StringBuilder stringBuilder = new StringBuilder();
                                        stringBuilder.append("failed to start media recorder: ");
                                        stringBuilder.append(e.getMessage());
                                        Log.e(access$100, stringBuilder.toString(), e);
                                        e.printStackTrace();
                                        SnapCamera.this.stopCamcorder();
                                    }
                                    SnapCamera.this.mRecording = true;
                                }
                            }
                        }, SnapCamera.this.mBackgroundHandler);
                    } catch (Throwable e) {
                        String access$100 = SnapCamera.TAG;
                        StringBuilder stringBuilder = new StringBuilder();
                        stringBuilder.append("videoSessionCb::onConfigured: ");
                        stringBuilder.append(e.getMessage());
                        Log.e(access$100, stringBuilder.toString(), e);
                    }
                }

                public void onConfigureFailed(@NonNull CameraCaptureSession cameraCaptureSession) {
                    Log.e(SnapCamera.TAG, "videoSessionCb::onConfigureFailed");
                    SnapCamera.this.stopCamcorder();
                }
            }, this.mCameraHandler);
        } catch (Throwable e) {
            String str = TAG;
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.append("failed to startCamcorder: ");
            stringBuilder.append(e.getMessage());
            Log.e(str, stringBuilder.toString(), e);
        }
        return;
    }

    /* JADX WARNING: Removed duplicated region for block: B:58:0x00f5 A:{Catch:{ Exception -> 0x0012 }} */
    /* JADX WARNING: Removed duplicated region for block: B:58:0x00f5 A:{Catch:{ Exception -> 0x0012 }} */
    /* JADX WARNING: Removed duplicated region for block: B:58:0x00f5 A:{Catch:{ Exception -> 0x0012 }} */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    private synchronized void stopCamcorder() {
        Closeable closeable;
        Exception e;
        String str;
        StringBuilder stringBuilder;
        Throwable th;
        if (this.mMediaRecorder != null) {
            if (this.mRecording) {
                try {
                    this.mMediaRecorder.stop();
                } catch (Throwable e2) {
                    this.mRecording = false;
                    Log.w(TAG, "mMediaRecorder stop failed", e2);
                }
            }
            this.mMediaRecorder.reset();
            this.mMediaRecorder.release();
            Uri uri = null;
            this.mMediaRecorder = null;
            stopBackgroundThread();
            if (this.mRecording) {
                String str2 = (String) this.mContentValues.get("_data");
                try {
                    long length = new File(str2).length();
                    if (length > 0) {
                        long j;
                        if (Storage.isUseDocumentMode()) {
                            ParcelFileDescriptor parcelFileDescriptor = FileCompat.getParcelFileDescriptor(str2, false);
                            try {
                                long duration = Util.getDuration(parcelFileDescriptor.getFileDescriptor());
                                if (0 == duration) {
                                    FileCompat.deleteFile(str2);
                                }
                                closeable = parcelFileDescriptor;
                                j = duration;
                            } catch (Exception e3) {
                                e = e3;
                                closeable = parcelFileDescriptor;
                                try {
                                    e.printStackTrace();
                                    str = TAG;
                                    stringBuilder = new StringBuilder();
                                    stringBuilder.append("Failed to write MediaStore ");
                                    stringBuilder.append(e);
                                    Log.e(str, stringBuilder.toString());
                                    Util.closeSilently(closeable);
                                    if (this.mStatusListener != null) {
                                    }
                                    this.mRecording = false;
                                } catch (Throwable th2) {
                                    th = th2;
                                }
                            } catch (Throwable th3) {
                                th = th3;
                                closeable = parcelFileDescriptor;
                                Util.closeSilently(closeable);
                                throw th;
                            }
                        }
                        j = Util.getDuration(str2);
                        if (j == 0) {
                            new File(str2).delete();
                        }
                        closeable = null;
                        if (j > 0) {
                            try {
                                this.mContentValues.put("_size", Long.valueOf(length));
                                this.mContentValues.put("duration", Long.valueOf(j));
                                Uri insert = this.mContext.getContentResolver().insert(Media.EXTERNAL_CONTENT_URI, this.mContentValues);
                                if (insert == null) {
                                    str = TAG;
                                    stringBuilder = new StringBuilder();
                                    stringBuilder.append("insert MediaProvider failed, attempt to find uri by path, ");
                                    stringBuilder.append(str2);
                                    Log.d(str, stringBuilder.toString());
                                    uri = MediaProviderUtil.getContentUriFromPath(this.mContext, str2);
                                } else {
                                    uri = insert;
                                }
                            } catch (Exception e4) {
                                e = e4;
                                e.printStackTrace();
                                str = TAG;
                                stringBuilder = new StringBuilder();
                                stringBuilder.append("Failed to write MediaStore ");
                                stringBuilder.append(e);
                                Log.e(str, stringBuilder.toString());
                                Util.closeSilently(closeable);
                                if (this.mStatusListener != null) {
                                }
                                this.mRecording = false;
                            }
                        }
                    }
                    closeable = null;
                } catch (Exception e5) {
                    e = e5;
                    closeable = null;
                    e.printStackTrace();
                    str = TAG;
                    stringBuilder = new StringBuilder();
                    stringBuilder.append("Failed to write MediaStore ");
                    stringBuilder.append(e);
                    Log.e(str, stringBuilder.toString());
                    Util.closeSilently(closeable);
                    if (this.mStatusListener != null) {
                    }
                    this.mRecording = false;
                } catch (Throwable th4) {
                    th = th4;
                    closeable = null;
                    Util.closeSilently(closeable);
                    throw th;
                }
                Util.closeSilently(closeable);
                if (this.mStatusListener != null) {
                    this.mStatusListener.onDone(uri);
                }
            }
            this.mRecording = false;
        }
    }
}
