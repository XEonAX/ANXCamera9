package com.xiaomi.camera.imagecodec;

import android.annotation.SuppressLint;
import android.content.Context;
import android.hardware.camera2.CameraAccessException;
import android.hardware.camera2.CameraCaptureSession;
import android.hardware.camera2.CameraDevice;
import android.hardware.camera2.CameraDevice.StateCallback;
import android.hardware.camera2.CameraManager;
import android.hardware.camera2.TotalCaptureResult;
import android.hardware.camera2.params.InputConfiguration;
import android.media.Image;
import android.media.Image.Plane;
import android.media.ImageReader;
import android.media.ImageReader.OnImageAvailableListener;
import android.media.ImageWriter;
import android.os.Handler;
import android.os.HandlerThread;
import android.os.Looper;
import android.os.Message;
import android.support.annotation.AnyThread;
import android.support.annotation.NonNull;
import android.support.annotation.WorkerThread;
import android.util.Log;
import android.view.Surface;
import com.android.camera.data.data.config.ComponentConfigFlash;
import com.xiaomi.camera.imagecodec.ImagePool.ImageFormat;
import com.xiaomi.protocol.ICustomCaptureResult;
import java.lang.reflect.Field;
import java.nio.ByteBuffer;
import java.util.Arrays;
import java.util.LinkedList;
import java.util.List;
import java.util.Locale;

public class JpegEncoder {
    private static String BACK_VT_CAMERA_ID_DEFAULT = "100";
    private static String FRONT_VT_CAMERA_ID_DEFAULT = ComponentConfigFlash.FLASH_VALUE_SCREEN_LIGHT_ON;
    private static final int MAX_IMAGE_BUFFER_SIZE = 2;
    private static final String TAG = JpegEncoder.class.getSimpleName();
    private String mBackVtCameraId;
    private final Object mCameraLock;
    private CameraManager mCameraManager;
    private Handler mCameraOperationHandler;
    private HandlerThread mCameraOperationThread;
    private volatile boolean mCreatingReprocessSession;
    private ReprocessData mCurrentProcessingData;
    private int mCurrentSessionId;
    private final Object mDataLock;
    private String mFrontVtCameraId;
    private boolean mInitialized;
    private InputConfiguration mInputConfiguration;
    private ImageReader mJpegImageReader;
    private OutputConfiguration mJpegOutputConfiguration;
    private boolean mNeedReopenCamera;
    private Handler mReprocessHandler;
    private ImageWriter mReprocessImageWriter;
    private long mReprocessStartTime;
    private HandlerThread mReprocessThread;
    private LinkedList<ReprocessData> mTaskDataList;
    private CameraDevice mVTCameraDevice;
    private CameraCaptureSession mVTCaptureSession;
    private ImageReader mYuvImageReader;
    private OutputConfiguration mYuvOutputConfiguration;

    static class JpegEncoderHolder {
        static JpegEncoder sInstance = new JpegEncoder();

        JpegEncoderHolder() {
        }
    }

    private class ReprocessHandler extends Handler {
        private static final int MSG_CLOSE_VT_CAMERA = 2;
        private static final int MSG_REPROCESS_IMG = 1;

        ReprocessHandler(Looper looper) {
            super(looper);
        }

        public void handleMessage(Message message) {
            switch (message.what) {
                case 1:
                    Log.d(JpegEncoder.TAG, "recv MSG_REPROCESS_IMG");
                    if (JpegEncoder.this.checkConditionIsReady()) {
                        JpegEncoder.this.reprocessImage();
                        return;
                    }
                    return;
                case 2:
                    Log.d(JpegEncoder.TAG, "recv MSG_CLOSE_VT_CAMERA");
                    synchronized (JpegEncoder.this.mCameraLock) {
                        if (JpegEncoder.this.mVTCameraDevice != null) {
                            String access$100 = JpegEncoder.TAG;
                            StringBuilder stringBuilder = new StringBuilder();
                            stringBuilder.append("close current VtCamera: ");
                            stringBuilder.append(JpegEncoder.this.mVTCameraDevice);
                            Log.d(access$100, stringBuilder.toString());
                            JpegEncoder.this.mVTCameraDevice.close();
                            JpegEncoder.this.mVTCameraDevice = null;
                        }
                    }
                    return;
                default:
                    super.handleMessage(message);
                    return;
            }
        }
    }

    /* synthetic */ JpegEncoder(AnonymousClass1 anonymousClass1) {
        this();
    }

    @AnyThread
    public static JpegEncoder instance() {
        return JpegEncoderHolder.sInstance;
    }

    private JpegEncoder() {
        this.mBackVtCameraId = BACK_VT_CAMERA_ID_DEFAULT;
        this.mFrontVtCameraId = FRONT_VT_CAMERA_ID_DEFAULT;
        this.mCurrentSessionId = -1;
        this.mCameraLock = new Object();
        this.mTaskDataList = new LinkedList();
        this.mDataLock = new Object();
        this.mYuvOutputConfiguration = new OutputConfiguration(0, 0, 35);
    }

    @AnyThread
    public void init(Context context) {
        Log.d(TAG, "init>>");
        synchronized (this.mDataLock) {
            if (!this.mInitialized) {
                this.mCameraManager = (CameraManager) context.getSystemService("camera");
                this.mCameraOperationThread = new HandlerThread("CameraOperationThread");
                this.mCameraOperationThread.start();
                this.mCameraOperationHandler = new Handler(this.mCameraOperationThread.getLooper());
                this.mReprocessThread = new HandlerThread("JpegEncoderThread");
                this.mReprocessThread.start();
                this.mReprocessHandler = new ReprocessHandler(this.mReprocessThread.getLooper());
                this.mInitialized = true;
            }
        }
        Log.d(TAG, "init<<");
    }

    /* JADX WARNING: Missing block: B:9:0x0019, code:
            r2 = r3.mCameraLock;
     */
    /* JADX WARNING: Missing block: B:10:0x001b, code:
            monitor-enter(r2);
     */
    /* JADX WARNING: Missing block: B:13:0x001e, code:
            if (r3.mVTCaptureSession == null) goto L_0x002d;
     */
    /* JADX WARNING: Missing block: B:14:0x0020, code:
            r3.mVTCaptureSession.close();
            r3.mVTCaptureSession = null;
            r3.mJpegImageReader = null;
            r3.mYuvImageReader = null;
            r3.mReprocessImageWriter = null;
     */
    /* JADX WARNING: Missing block: B:16:0x002f, code:
            if (r3.mVTCameraDevice == null) goto L_0x0038;
     */
    /* JADX WARNING: Missing block: B:17:0x0031, code:
            r3.mVTCameraDevice.close();
            r3.mVTCameraDevice = null;
     */
    /* JADX WARNING: Missing block: B:18:0x0038, code:
            monitor-exit(r2);
     */
    /* JADX WARNING: Missing block: B:20:0x003b, code:
            if (r3.mCameraOperationThread == null) goto L_0x0050;
     */
    /* JADX WARNING: Missing block: B:21:0x003d, code:
            r3.mCameraOperationThread.quitSafely();
     */
    /* JADX WARNING: Missing block: B:23:?, code:
            r3.mCameraOperationThread.join();
            r3.mCameraOperationThread = null;
            r3.mCameraOperationHandler = null;
     */
    /* JADX WARNING: Missing block: B:24:0x004c, code:
            r0 = move-exception;
     */
    /* JADX WARNING: Missing block: B:25:0x004d, code:
            r0.printStackTrace();
     */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    @AnyThread
    public void deInit() {
        Log.d(TAG, "deInit>>");
        synchronized (this.mDataLock) {
            if (this.mInitialized) {
                this.mInitialized = false;
                this.mCameraManager = null;
                this.mCurrentProcessingData = null;
            } else {
                return;
            }
        }
        if (this.mReprocessThread != null) {
            this.mReprocessThread.quitSafely();
            try {
                this.mReprocessThread.join();
                this.mReprocessThread = null;
                this.mReprocessHandler = null;
            } catch (InterruptedException e) {
                e.printStackTrace();
            }
        }
        Log.d(TAG, "deInit<<");
        Log.d(TAG, "deInit<<");
    }

    public void setJpegOutputSize(int i, int i2) {
        if (this.mJpegOutputConfiguration == null) {
            String str = TAG;
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.append("setJpegOutputSize: ");
            stringBuilder.append(i);
            stringBuilder.append("x");
            stringBuilder.append(i2);
            Log.d(str, stringBuilder.toString());
            this.mJpegOutputConfiguration = new OutputConfiguration(i, i2, 256);
        }
    }

    @AnyThread
    public void setVTCameraIds(@NonNull String str, @NonNull String str2) {
        Log.d(TAG, String.format("setVTCameraIds: backId=%s frontId=%s", new Object[]{str, str2}));
        this.mBackVtCameraId = str;
        this.mFrontVtCameraId = str2;
    }

    @AnyThread
    public void doReprocess(ReprocessData reprocessData) {
        String str = TAG;
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("doReprocess: ");
        stringBuilder.append(reprocessData.getImageTag());
        Log.d(str, stringBuilder.toString());
        if (reprocessData.getResultListener() == null) {
            Log.d(TAG, "doReprocess: drop this request due to no callback was provided!");
        } else if (this.mInitialized) {
            if (!reprocessData.isImageFromPool()) {
                Image yuvImage = reprocessData.getYuvImage();
                ImageFormat toImageQueueKey = ImagePool.getInstance().toImageQueueKey(yuvImage);
                if (ImagePool.getInstance().isImageQueueFull(toImageQueueKey, 0)) {
                    Log.w(TAG, "doReprocess: wait image pool>>");
                    ImagePool.getInstance().waitIfImageQueueFull(toImageQueueKey, 0, 0);
                    Log.w(TAG, "doReprocess: wait image pool<<");
                }
                long timestamp = yuvImage.getTimestamp();
                ImagePool.getInstance().queueImage(yuvImage);
                yuvImage = ImagePool.getInstance().getImage(timestamp);
                String str2 = TAG;
                StringBuilder stringBuilder2 = new StringBuilder();
                stringBuilder2.append("doReprocess: image: ");
                stringBuilder2.append(yuvImage);
                stringBuilder2.append(" | ");
                stringBuilder2.append(timestamp);
                Log.d(str2, stringBuilder2.toString());
                reprocessData.setYuvImage(yuvImage);
                ImagePool.getInstance().holdImage(yuvImage);
            }
            synchronized (this.mDataLock) {
                this.mTaskDataList.add(reprocessData);
            }
            sendReprocessRequest();
        } else {
            throw new RuntimeException("NOT initialized. Call init() first!");
        }
    }

    /* JADX WARNING: Missing block: B:13:0x0024, code:
            r1 = r5.mDataLock;
     */
    /* JADX WARNING: Missing block: B:14:0x0026, code:
            monitor-enter(r1);
     */
    /* JADX WARNING: Missing block: B:17:0x002e, code:
            if (r5.mTaskDataList.isEmpty() == false) goto L_0x0040;
     */
    /* JADX WARNING: Missing block: B:18:0x0030, code:
            android.util.Log.d(TAG, "sendReprocessRequest: idle. Try to close device 30s later.");
            r5.mReprocessHandler.sendEmptyMessageDelayed(2, 30000);
     */
    /* JADX WARNING: Missing block: B:19:0x003e, code:
            monitor-exit(r1);
     */
    /* JADX WARNING: Missing block: B:20:0x003f, code:
            return;
     */
    /* JADX WARNING: Missing block: B:22:0x0046, code:
            if (r5.mReprocessHandler.hasMessages(2) == false) goto L_0x004d;
     */
    /* JADX WARNING: Missing block: B:23:0x0048, code:
            r5.mReprocessHandler.removeMessages(2);
     */
    /* JADX WARNING: Missing block: B:24:0x004d, code:
            monitor-exit(r1);
     */
    /* JADX WARNING: Missing block: B:26:0x0055, code:
            if (r5.mReprocessHandler.hasMessages(1) == false) goto L_0x005f;
     */
    /* JADX WARNING: Missing block: B:27:0x0057, code:
            android.util.Log.d(TAG, "sendReprocessRequest: busy");
     */
    /* JADX WARNING: Missing block: B:28:0x005f, code:
            android.util.Log.d(TAG, "sendReprocessRequest: send MSG_REPROCESS_IMG");
            r5.mReprocessHandler.sendEmptyMessageDelayed(1, 0);
     */
    /* JADX WARNING: Missing block: B:29:0x006d, code:
            return;
     */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    @AnyThread
    private void sendReprocessRequest() {
        Log.i(TAG, "=============================================================");
        if (this.mInitialized) {
            synchronized (this.mCameraLock) {
                if (this.mCreatingReprocessSession) {
                    Log.d(TAG, "sendReprocessRequest: creating session...");
                    return;
                }
            }
        }
        Log.w(TAG, "sendReprocessRequest: NOT initialized!");
    }

    /* JADX WARNING: Removed duplicated region for block: B:62:0x0154  */
    /* JADX WARNING: Missing block: B:26:0x009f, code:
            return true;
     */
    /* JADX WARNING: Missing block: B:73:0x0176, code:
            return r4;
     */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    @WorkerThread
    private boolean createCaptureSessionIfNeed(@NonNull ReprocessData reprocessData) {
        Image yuvImage = reprocessData.getYuvImage();
        InputConfiguration inputConfiguration = new InputConfiguration(yuvImage.getWidth(), yuvImage.getHeight(), yuvImage.getFormat());
        OutputConfiguration outputConfiguration = new OutputConfiguration(reprocessData.getOutputWidth(), reprocessData.getOutputHeight(), reprocessData.getOutputFormat());
        String str = reprocessData.isFrontCamera() ? this.mFrontVtCameraId : this.mBackVtCameraId;
        synchronized (this.mCameraLock) {
            boolean z = false;
            int i = (this.mVTCameraDevice == null || !str.equals(this.mVTCameraDevice.getId())) ? true : 0;
            if (i == 0) {
                boolean z2 = 256 == outputConfiguration.mFormat;
                OutputConfiguration outputConfiguration2 = z2 ? this.mJpegOutputConfiguration : this.mYuvOutputConfiguration;
                if (this.mVTCaptureSession != null) {
                    if (!(inputConfiguration.equals(this.mInputConfiguration) && outputConfiguration.equals(outputConfiguration2))) {
                        int height;
                        String str2 = TAG;
                        String str3 = "recreate session. in: %dx%d->%dx%d %sOut: %dx%d->%dx%d";
                        Object[] objArr = new Object[9];
                        objArr[0] = Integer.valueOf(this.mInputConfiguration == null ? 0 : this.mInputConfiguration.getWidth());
                        objArr[1] = Integer.valueOf(this.mInputConfiguration == null ? 0 : this.mInputConfiguration.getHeight());
                        objArr[2] = Integer.valueOf(inputConfiguration.getWidth());
                        objArr[3] = Integer.valueOf(inputConfiguration.getHeight());
                        objArr[4] = z2 ? "jpeg" : "yuv";
                        objArr[5] = Integer.valueOf(outputConfiguration2 == null ? 0 : outputConfiguration2.getWidth());
                        if (outputConfiguration2 != null) {
                            height = outputConfiguration2.getHeight();
                        }
                        objArr[6] = Integer.valueOf(height);
                        objArr[7] = Integer.valueOf(outputConfiguration.getWidth());
                        objArr[8] = Integer.valueOf(outputConfiguration.getHeight());
                        Log.d(str2, String.format(str3, objArr));
                    }
                    if (z) {
                        if (this.mCreatingReprocessSession) {
                            Log.d(TAG, "creating reprocess session...");
                            return true;
                        }
                        this.mCreatingReprocessSession = true;
                        this.mInputConfiguration = inputConfiguration;
                        if (z2) {
                            this.mJpegOutputConfiguration = outputConfiguration;
                        } else {
                            this.mYuvOutputConfiguration = outputConfiguration;
                        }
                        createReprocessSession(this.mInputConfiguration, this.mYuvOutputConfiguration, this.mJpegOutputConfiguration);
                    }
                }
                z = true;
                if (z) {
                }
            } else if (this.mCreatingReprocessSession) {
                Log.d(TAG, "creating reprocess session...");
                return true;
            } else {
                this.mCreatingReprocessSession = true;
                if (this.mVTCameraDevice == null) {
                    openVTCamera(str);
                } else if (!str.equals(this.mVTCameraDevice.getId())) {
                    String str4 = TAG;
                    StringBuilder stringBuilder = new StringBuilder();
                    stringBuilder.append("createCaptureSessionIfNeed: expected device changed. oldId=");
                    stringBuilder.append(this.mVTCameraDevice.getId());
                    stringBuilder.append(" newId=");
                    stringBuilder.append(str);
                    Log.d(str4, stringBuilder.toString());
                    this.mVTCameraDevice.close();
                    this.mVTCameraDevice = null;
                    this.mNeedReopenCamera = true;
                }
            }
        }
    }

    /* JADX WARNING: Missing block: B:10:0x001b, code:
            if (r1 != null) goto L_0x0025;
     */
    /* JADX WARNING: Missing block: B:11:0x001d, code:
            android.util.Log.w(TAG, "checkConditionIsReady: ignore null request!");
     */
    /* JADX WARNING: Missing block: B:12:0x0024, code:
            return false;
     */
    /* JADX WARNING: Missing block: B:14:0x002b, code:
            return createCaptureSessionIfNeed(r1) ^ 1;
     */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    @WorkerThread
    private boolean checkConditionIsReady() {
        synchronized (this.mDataLock) {
            if (this.mCurrentProcessingData != null) {
                Log.d(TAG, "checkConditionIsReady: processor is busy!");
                return false;
            }
            ReprocessData reprocessData = (ReprocessData) this.mTaskDataList.peek();
        }
    }

    /* JADX WARNING: Missing block: B:10:0x005b, code:
            r8.mReprocessStartTime = java.lang.System.currentTimeMillis();
            r5 = r8.mCameraLock;
     */
    /* JADX WARNING: Missing block: B:11:0x0063, code:
            monitor-enter(r5);
     */
    /* JADX WARNING: Missing block: B:13:?, code:
            r0 = r8.mVTCameraDevice.createReprocessCaptureRequest(r1);
     */
    /* JADX WARNING: Missing block: B:14:0x006c, code:
            if (256 != r3) goto L_0x0081;
     */
    /* JADX WARNING: Missing block: B:15:0x006e, code:
            r0.addTarget(r8.mJpegImageReader.getSurface());
            r0.set(android.hardware.camera2.CaptureRequest.JPEG_QUALITY, java.lang.Byte.valueOf(r2));
     */
    /* JADX WARNING: Missing block: B:16:0x0081, code:
            r0.addTarget(r8.mYuvImageReader.getSurface());
     */
    /* JADX WARNING: Missing block: B:17:0x008a, code:
            r1 = TAG;
            r2 = new java.lang.StringBuilder();
            r2.append("reprocessImage: ");
            r2.append(r4);
            r2.append(" | ");
            r2.append(r4.getTimestamp());
            android.util.Log.d(r1, r2.toString());
            r8.mReprocessImageWriter.queueInputImage(r4);
            com.xiaomi.camera.imagecodec.ImagePool.getInstance().releaseImage(r4);
            r8.mVTCaptureSession.capture(r0.build(), new com.xiaomi.camera.imagecodec.JpegEncoder.AnonymousClass1(r8), r8.mCameraOperationHandler);
     */
    /* JADX WARNING: Missing block: B:19:0x00cb, code:
            r0 = move-exception;
     */
    /* JADX WARNING: Missing block: B:21:?, code:
            r0.printStackTrace();
     */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    @WorkerThread
    private void reprocessImage() {
        Log.d(TAG, "reprocessImage>>");
        synchronized (this.mDataLock) {
            this.mCurrentProcessingData = (ReprocessData) this.mTaskDataList.poll();
            TotalCaptureResult toTotalCaptureResult = ICustomCaptureResult.toTotalCaptureResult(this.mCurrentProcessingData.getTotalCaptureResult(), this.mCurrentSessionId);
            if (toTotalCaptureResult == null) {
                Log.wtf(TAG, "reprocessImage<<null metadata!");
                return;
            }
            String str = TAG;
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.append("reprocessImage: tag=");
            stringBuilder.append(this.mCurrentProcessingData.getImageTag());
            Log.d(str, stringBuilder.toString());
            byte jpegQuality = (byte) this.mCurrentProcessingData.getJpegQuality();
            int outputFormat = this.mCurrentProcessingData.getOutputFormat();
            Image yuvImage = this.mCurrentProcessingData.getYuvImage();
        }
        Log.d(TAG, "reprocessImage<<");
    }

    @WorkerThread
    @SuppressLint({"MissingPermission"})
    private void openVTCamera(String str) {
        String str2 = TAG;
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("openVTCamera: ");
        stringBuilder.append(str);
        Log.d(str2, stringBuilder.toString());
        try {
            this.mCameraManager.openCamera(str, new StateCallback() {
                public void onOpened(@NonNull CameraDevice cameraDevice) {
                    synchronized (JpegEncoder.this.mCameraLock) {
                        String access$100 = JpegEncoder.TAG;
                        StringBuilder stringBuilder = new StringBuilder();
                        stringBuilder.append("onOpened>>id=");
                        stringBuilder.append(cameraDevice.getId());
                        Log.d(access$100, stringBuilder.toString());
                        JpegEncoder.this.mVTCameraDevice = cameraDevice;
                        String access$1002 = JpegEncoder.TAG;
                        StringBuilder stringBuilder2 = new StringBuilder();
                        stringBuilder2.append("onOpened: ");
                        stringBuilder2.append(JpegEncoder.this.mVTCameraDevice);
                        Log.d(access$1002, stringBuilder2.toString());
                        JpegEncoder.this.mCurrentSessionId = -1;
                        JpegEncoder.this.mVTCaptureSession = null;
                        JpegEncoder.this.mCreatingReprocessSession = false;
                        JpegEncoder.this.sendReprocessRequest();
                        Log.d(JpegEncoder.TAG, "onOpened<<");
                    }
                }

                public void onClosed(@NonNull CameraDevice cameraDevice) {
                    synchronized (JpegEncoder.this.mCameraLock) {
                        String access$100 = JpegEncoder.TAG;
                        StringBuilder stringBuilder = new StringBuilder();
                        stringBuilder.append("onClosed>>id=");
                        stringBuilder.append(cameraDevice.getId());
                        Log.d(access$100, stringBuilder.toString());
                        JpegEncoder.this.mCreatingReprocessSession = false;
                        if (cameraDevice == JpegEncoder.this.mVTCameraDevice) {
                            String access$1002 = JpegEncoder.TAG;
                            StringBuilder stringBuilder2 = new StringBuilder();
                            stringBuilder2.append("onClosed: ");
                            stringBuilder2.append(JpegEncoder.this.mVTCameraDevice);
                            Log.d(access$1002, stringBuilder2.toString());
                            JpegEncoder.this.mVTCameraDevice = null;
                        }
                        if (JpegEncoder.this.mNeedReopenCamera) {
                            JpegEncoder.this.sendReprocessRequest();
                            JpegEncoder.this.mNeedReopenCamera = false;
                        }
                        Log.d(JpegEncoder.TAG, "onClosed<<");
                    }
                }

                public void onDisconnected(@NonNull CameraDevice cameraDevice) {
                    synchronized (JpegEncoder.this.mCameraLock) {
                        String access$100 = JpegEncoder.TAG;
                        StringBuilder stringBuilder = new StringBuilder();
                        stringBuilder.append("onDisconnected>>id=");
                        stringBuilder.append(cameraDevice.getId());
                        Log.d(access$100, stringBuilder.toString());
                        cameraDevice.close();
                        JpegEncoder.this.mCreatingReprocessSession = false;
                        if (cameraDevice == JpegEncoder.this.mVTCameraDevice) {
                            String access$1002 = JpegEncoder.TAG;
                            StringBuilder stringBuilder2 = new StringBuilder();
                            stringBuilder2.append("onDisconnected: ");
                            stringBuilder2.append(JpegEncoder.this.mVTCameraDevice);
                            Log.d(access$1002, stringBuilder2.toString());
                            JpegEncoder.this.mVTCameraDevice = null;
                        }
                        Log.d(JpegEncoder.TAG, "onDisconnected<<");
                    }
                }

                public void onError(@NonNull CameraDevice cameraDevice, int i) {
                    synchronized (JpegEncoder.this.mCameraLock) {
                        String access$100 = JpegEncoder.TAG;
                        StringBuilder stringBuilder = new StringBuilder();
                        stringBuilder.append("onError>>id=");
                        stringBuilder.append(cameraDevice.getId());
                        Log.e(access$100, stringBuilder.toString());
                        cameraDevice.close();
                        JpegEncoder.this.mCreatingReprocessSession = false;
                        if (cameraDevice == JpegEncoder.this.mVTCameraDevice) {
                            String access$1002 = JpegEncoder.TAG;
                            StringBuilder stringBuilder2 = new StringBuilder();
                            stringBuilder2.append("onError: ");
                            stringBuilder2.append(JpegEncoder.this.mVTCameraDevice);
                            Log.d(access$1002, stringBuilder2.toString());
                            JpegEncoder.this.mVTCameraDevice = null;
                        }
                        Log.e(JpegEncoder.TAG, "onError<<");
                    }
                }
            }, this.mCameraOperationHandler);
        } catch (Throwable e) {
            Log.e(TAG, "openVTCamera: open camera failed! No permission Exception.", e);
        }
    }

    @WorkerThread
    private void createReprocessSession(@NonNull InputConfiguration inputConfiguration, @NonNull OutputConfiguration outputConfiguration, @NonNull OutputConfiguration outputConfiguration2) {
        Log.d(TAG, String.format(Locale.ENGLISH, "createReprocessSession>>input[%dx%d] output[%dx%d]", new Object[]{Integer.valueOf(inputConfiguration.getWidth()), Integer.valueOf(inputConfiguration.getHeight()), Integer.valueOf(outputConfiguration2.getWidth()), Integer.valueOf(outputConfiguration2.getHeight())}));
        initYuvImageReader(outputConfiguration.getWidth(), outputConfiguration.getHeight());
        initJpegImageReader(outputConfiguration2.getWidth(), outputConfiguration2.getHeight());
        try {
            List asList;
            if (outputConfiguration.getWidth() <= 0 || this.mYuvImageReader == null) {
                asList = Arrays.asList(new Surface[]{this.mJpegImageReader.getSurface()});
            } else {
                asList = Arrays.asList(new Surface[]{this.mJpegImageReader.getSurface(), this.mYuvImageReader.getSurface()});
            }
            this.mVTCameraDevice.createReprocessableCaptureSession(new InputConfiguration(inputConfiguration.getWidth(), inputConfiguration.getHeight(), inputConfiguration.getFormat()), asList, new CameraCaptureSession.StateCallback() {
                public void onConfigured(@NonNull CameraCaptureSession cameraCaptureSession) {
                    Log.d(JpegEncoder.TAG, "onConfigured>>");
                    synchronized (JpegEncoder.this.mCameraLock) {
                        if (JpegEncoder.this.mVTCameraDevice == null) {
                            Log.e(JpegEncoder.TAG, "onConfigured: null camera device");
                            JpegEncoder.this.mCreatingReprocessSession = false;
                            return;
                        }
                        JpegEncoder.this.mVTCaptureSession = cameraCaptureSession;
                        JpegEncoder.this.mCurrentSessionId = JpegEncoder.this.mCurrentSessionId + 1;
                        int access$1000 = JpegEncoder.getSessionId(cameraCaptureSession);
                        Log.d(JpegEncoder.TAG, String.format("sessionId: %d %d", new Object[]{Integer.valueOf(JpegEncoder.this.mCurrentSessionId), Integer.valueOf(access$1000)}));
                        if (!(access$1000 == -1 || JpegEncoder.this.mCurrentSessionId == access$1000)) {
                            Log.w(JpegEncoder.TAG, String.format("sessionId: %d->%d", new Object[]{Integer.valueOf(JpegEncoder.this.mCurrentSessionId), Integer.valueOf(access$1000)}));
                            JpegEncoder.this.mCurrentSessionId = access$1000;
                        }
                        if (JpegEncoder.this.mReprocessImageWriter != null) {
                            JpegEncoder.this.mReprocessImageWriter.close();
                        }
                        JpegEncoder.this.mReprocessImageWriter = ImageWriter.newInstance(cameraCaptureSession.getInputSurface(), 2);
                        JpegEncoder.this.mCreatingReprocessSession = false;
                        JpegEncoder.this.sendReprocessRequest();
                        Log.d(JpegEncoder.TAG, "onConfigured<<");
                    }
                }

                public void onConfigureFailed(@NonNull CameraCaptureSession cameraCaptureSession) {
                    Log.d(JpegEncoder.TAG, "onConfigureFailed");
                    synchronized (JpegEncoder.this.mCameraLock) {
                        JpegEncoder.this.mCreatingReprocessSession = false;
                        JpegEncoder.this.mVTCaptureSession = null;
                        JpegEncoder.this.mReprocessImageWriter = null;
                    }
                }
            }, this.mCameraOperationHandler);
        } catch (CameraAccessException e) {
            e.printStackTrace();
        }
        Log.d(TAG, "createReprocessSession<<");
    }

    @WorkerThread
    private void initJpegImageReader(int i, int i2) {
        Log.d(TAG, "initJpegImageReader>>");
        if (!(this.mJpegImageReader == null || (this.mJpegImageReader.getWidth() == i && this.mJpegImageReader.getHeight() == i2))) {
            Log.d(TAG, "closing obsolete reprocess reader");
            this.mJpegImageReader.close();
        }
        this.mJpegImageReader = ImageReader.newInstance(i, i2, 256, 2);
        this.mJpegImageReader.setOnImageAvailableListener(new OnImageAvailableListener() {
            public void onImageAvailable(ImageReader imageReader) {
                Image acquireNextImage = imageReader.acquireNextImage();
                String access$100 = JpegEncoder.TAG;
                StringBuilder stringBuilder = new StringBuilder();
                stringBuilder.append("onImageAvailable: received reprocessed image");
                stringBuilder.append(acquireNextImage);
                Log.d(access$100, stringBuilder.toString());
                byte[] access$1200 = JpegEncoder.getJpegData(acquireNextImage);
                acquireNextImage.close();
                synchronized (JpegEncoder.this.mDataLock) {
                    JpegEncoder.this.mCurrentProcessingData.getResultListener().onJpegAvailable(access$1200, JpegEncoder.this.mCurrentProcessingData.getImageTag());
                    Log.d(JpegEncoder.TAG, String.format("jpeg return for %s. cost=%d", new Object[]{JpegEncoder.this.mCurrentProcessingData.getImageTag(), Long.valueOf(System.currentTimeMillis() - JpegEncoder.this.mReprocessStartTime)}));
                    JpegEncoder.this.mCurrentProcessingData = null;
                }
                JpegEncoder.this.sendReprocessRequest();
            }
        }, this.mCameraOperationHandler);
        Log.d(TAG, "initJpegImageReader<<");
    }

    @WorkerThread
    private void initYuvImageReader(int i, int i2) {
        String str = TAG;
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("initYuvImageReader>>");
        stringBuilder.append(i);
        stringBuilder.append("x");
        stringBuilder.append(i2);
        Log.d(str, stringBuilder.toString());
        if (!(this.mYuvImageReader == null || (this.mYuvImageReader.getWidth() == i && this.mYuvImageReader.getHeight() == i2))) {
            Log.d(TAG, "closing obsolete yuv reader");
            this.mYuvImageReader.close();
            this.mYuvImageReader = null;
        }
        if (i > 0 && i2 > 0) {
            this.mYuvImageReader = ImageReader.newInstance(i, i2, 35, 2);
            this.mYuvImageReader.setOnImageAvailableListener(new OnImageAvailableListener() {
                public void onImageAvailable(ImageReader imageReader) {
                    Image acquireNextImage = imageReader.acquireNextImage();
                    long timeStamp = JpegEncoder.this.mCurrentProcessingData.getTotalCaptureResult().getTimeStamp();
                    acquireNextImage.setTimestamp(timeStamp);
                    ImagePool.getInstance().queueImage(acquireNextImage);
                    acquireNextImage = ImagePool.getInstance().getImage(timeStamp);
                    String access$100 = JpegEncoder.TAG;
                    StringBuilder stringBuilder = new StringBuilder();
                    stringBuilder.append("receive yuv image: ");
                    stringBuilder.append(acquireNextImage);
                    stringBuilder.append(" | ");
                    stringBuilder.append(timeStamp);
                    Log.d(access$100, stringBuilder.toString());
                    ImagePool.getInstance().holdImage(acquireNextImage);
                    synchronized (JpegEncoder.this.mDataLock) {
                        JpegEncoder.this.mCurrentProcessingData.getResultListener().onYuvAvailable(acquireNextImage, JpegEncoder.this.mCurrentProcessingData.getImageTag());
                        Log.d(JpegEncoder.TAG, String.format("yuv return for %s. cost=%d", new Object[]{JpegEncoder.this.mCurrentProcessingData.getImageTag(), Long.valueOf(System.currentTimeMillis() - JpegEncoder.this.mReprocessStartTime)}));
                        JpegEncoder.this.mCurrentProcessingData = null;
                    }
                    JpegEncoder.this.sendReprocessRequest();
                }
            }, this.mCameraOperationHandler);
            Log.d(TAG, "initYuvImageReader<<");
        }
    }

    /* JADX WARNING: Removed duplicated region for block: B:4:0x0017 A:{ExcHandler: java.lang.ClassNotFoundException (r2_2 'e' java.lang.Throwable), Splitter: B:1:0x0002} */
    /* JADX WARNING: Removed duplicated region for block: B:4:0x0017 A:{ExcHandler: java.lang.ClassNotFoundException (r2_2 'e' java.lang.Throwable), Splitter: B:1:0x0002} */
    /* JADX WARNING: Missing block: B:4:0x0017, code:
            r2 = move-exception;
     */
    /* JADX WARNING: Missing block: B:5:0x0018, code:
            android.util.Log.w(TAG, "getSessionId: failed! ", r2);
     */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    private static int getSessionId(CameraCaptureSession cameraCaptureSession) {
        if (cameraCaptureSession != null) {
            try {
                Field declaredField = Class.forName("android.hardware.camera2.impl.CameraCaptureSessionImpl").getDeclaredField("mId");
                declaredField.setAccessible(true);
                return declaredField.getInt(cameraCaptureSession);
            } catch (Throwable e) {
            }
        }
        return -1;
    }

    private static byte[] getJpegData(Image image) {
        Plane[] planes = image.getPlanes();
        if (planes.length <= 0) {
            return null;
        }
        ByteBuffer buffer = planes[0].getBuffer();
        byte[] bArr = new byte[buffer.remaining()];
        buffer.get(bArr);
        return bArr;
    }
}
