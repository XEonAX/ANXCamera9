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
import com.xiaomi.protocol.ICustomCaptureResult;
import java.lang.reflect.Field;
import java.nio.ByteBuffer;
import java.util.Arrays;
import java.util.LinkedList;

public class JpegEncoder {
    private static String BACK_VT_CAMERA_ID_DEFAULT = "100";
    private static String FRONT_VT_CAMERA_ID_DEFAULT = ComponentConfigFlash.FLASH_VALUE_SCREEN_LIGHT_ON;
    private static final int MAX_IMAGE_BUFFER_SIZE = 2;
    private static final String TAG = JpegEncoder.class.getSimpleName();
    private static JpegEncoder sInstance = new JpegEncoder();
    private String mBackVtCameraId = BACK_VT_CAMERA_ID_DEFAULT;
    private final Object mCameraLock = new Object();
    private CameraManager mCameraManager;
    private Handler mCameraOperationHandler;
    private HandlerThread mCameraOperationThread;
    private volatile boolean mCreatingReprocessSession;
    private ReprocessData mCurrentProcessingData;
    private int mCurrentSessionId = -1;
    private final Object mDataLock = new Object();
    private String mFrontVtCameraId = FRONT_VT_CAMERA_ID_DEFAULT;
    private boolean mInitialized;
    private InputConfiguration mInputConfiguration;
    private boolean mNeedReopenCamera;
    private JpegOutputConfiguration mOutputConfiguration;
    private Handler mReprocessHandler;
    private ImageReader mReprocessImageReader;
    private ImageWriter mReprocessImageWriter;
    private long mReprocessStartTime;
    private HandlerThread mReprocessThread;
    private LinkedList<ReprocessData> mTaskDataList = new LinkedList();
    private CameraDevice mVTCameraDevice;
    private CameraCaptureSession mVTCaptureSession;

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
                            String access$000 = JpegEncoder.TAG;
                            StringBuilder stringBuilder = new StringBuilder();
                            stringBuilder.append("close current VtCamera: ");
                            stringBuilder.append(JpegEncoder.this.mVTCameraDevice);
                            Log.d(access$000, stringBuilder.toString());
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

    @AnyThread
    public static JpegEncoder instance() {
        return sInstance;
    }

    private JpegEncoder() {
    }

    @AnyThread
    public void init(Context context) {
        Log.d(TAG, "init >>");
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
        Log.d(TAG, "init <<");
    }

    /* JADX WARNING: Missing block: B:9:0x0019, code:
            r2 = r3.mCameraLock;
     */
    /* JADX WARNING: Missing block: B:10:0x001b, code:
            monitor-enter(r2);
     */
    /* JADX WARNING: Missing block: B:13:0x001e, code:
            if (r3.mVTCaptureSession == null) goto L_0x002b;
     */
    /* JADX WARNING: Missing block: B:14:0x0020, code:
            r3.mVTCaptureSession.close();
            r3.mVTCaptureSession = null;
            r3.mReprocessImageReader = null;
            r3.mReprocessImageWriter = null;
     */
    /* JADX WARNING: Missing block: B:16:0x002d, code:
            if (r3.mVTCameraDevice == null) goto L_0x0036;
     */
    /* JADX WARNING: Missing block: B:17:0x002f, code:
            r3.mVTCameraDevice.close();
            r3.mVTCameraDevice = null;
     */
    /* JADX WARNING: Missing block: B:18:0x0036, code:
            monitor-exit(r2);
     */
    /* JADX WARNING: Missing block: B:20:0x0039, code:
            if (r3.mCameraOperationThread == null) goto L_0x004e;
     */
    /* JADX WARNING: Missing block: B:21:0x003b, code:
            r3.mCameraOperationThread.quitSafely();
     */
    /* JADX WARNING: Missing block: B:23:?, code:
            r3.mCameraOperationThread.join();
            r3.mCameraOperationThread = null;
            r3.mCameraOperationHandler = null;
     */
    /* JADX WARNING: Missing block: B:24:0x004a, code:
            r0 = move-exception;
     */
    /* JADX WARNING: Missing block: B:25:0x004b, code:
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
        Log.d(TAG, "deInit<<");
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
        stringBuilder.append(reprocessData);
        Log.d(str, stringBuilder.toString());
        if (reprocessData.getResultListener() == null) {
            Log.d(TAG, "doReprocess: data's callback is null, we need not process this data!");
        } else if (this.mInitialized) {
            synchronized (this.mDataLock) {
                this.mTaskDataList.add(reprocessData);
            }
            sendReprocessRequest();
        } else {
            throw new RuntimeException("JpegEncoder has not been initialized, please call init() first!");
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
            android.util.Log.d(TAG, "sendReprocessRequest: there is no tasks to process, try to close camera after 30s");
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
            android.util.Log.d(TAG, "sendReprocessRequest: there is other task in message queue");
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
                    Log.d(TAG, "sendReprocessRequest: creating reprocess session...");
                    return;
                }
            }
        }
        Log.w(TAG, "sendReprocessRequest: JpegEncoder has not initialized! Ignore all request.");
    }

    /* JADX WARNING: Removed duplicated region for block: B:51:0x0155  */
    /* JADX WARNING: Missing block: B:26:0x00b3, code:
            return true;
     */
    /* JADX WARNING: Missing block: B:58:0x0170, code:
            return r4;
     */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    @WorkerThread
    private boolean createCaptureSessionIfNeed(@NonNull ReprocessData reprocessData) {
        MiImage yuvImage = reprocessData.getYuvImage();
        InputConfiguration inputConfiguration = new InputConfiguration(yuvImage.getWidth(), yuvImage.getHeight(), yuvImage.getFormat());
        JpegOutputConfiguration jpegOutputConfiguration = new JpegOutputConfiguration(reprocessData.getOutputWidth(), reprocessData.getOutputHeight());
        String str = reprocessData.isFrontCamera() ? this.mFrontVtCameraId : this.mBackVtCameraId;
        synchronized (this.mCameraLock) {
            boolean z = false;
            int i = (this.mVTCameraDevice == null || !str.equals(this.mVTCameraDevice.getId())) ? true : 0;
            if (i == 0) {
                if (this.mVTCaptureSession != null) {
                    if (!(inputConfiguration.equals(this.mInputConfiguration) && jpegOutputConfiguration.equals(this.mOutputConfiguration))) {
                        int height;
                        str = TAG;
                        String str2 = "recreate session settings: %dx%d->%dx%d %dx%d->%dx%d";
                        Object[] objArr = new Object[8];
                        objArr[0] = Integer.valueOf(this.mInputConfiguration == null ? 0 : this.mInputConfiguration.getWidth());
                        objArr[1] = Integer.valueOf(this.mInputConfiguration == null ? 0 : this.mInputConfiguration.getHeight());
                        objArr[2] = Integer.valueOf(inputConfiguration.getWidth());
                        objArr[3] = Integer.valueOf(inputConfiguration.getHeight());
                        objArr[4] = Integer.valueOf(this.mOutputConfiguration == null ? 0 : this.mOutputConfiguration.getWidth());
                        if (this.mOutputConfiguration != null) {
                            height = this.mOutputConfiguration.getHeight();
                        }
                        objArr[5] = Integer.valueOf(height);
                        objArr[6] = Integer.valueOf(jpegOutputConfiguration.getWidth());
                        objArr[7] = Integer.valueOf(jpegOutputConfiguration.getHeight());
                        Log.d(str, String.format(str2, objArr));
                    }
                    if (z) {
                        if (this.mCreatingReprocessSession) {
                            Log.d(TAG, "creating reprocess session...");
                            return true;
                        }
                        this.mCreatingReprocessSession = true;
                        this.mInputConfiguration = inputConfiguration;
                        this.mOutputConfiguration = jpegOutputConfiguration;
                        createReprocessSession(this.mInputConfiguration, this.mOutputConfiguration);
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
                    String str3 = TAG;
                    StringBuilder stringBuilder = new StringBuilder();
                    stringBuilder.append("createCaptureSessionIfNeed: expected device id is not matched, The old is :");
                    stringBuilder.append(this.mVTCameraDevice.getId());
                    stringBuilder.append("; the new is :");
                    stringBuilder.append(str);
                    Log.d(str3, stringBuilder.toString());
                    str = TAG;
                    StringBuilder stringBuilder2 = new StringBuilder();
                    stringBuilder2.append("createCaptureSessionIfNeed: close old camera ");
                    stringBuilder2.append(this.mVTCameraDevice);
                    Log.d(str, stringBuilder2.toString());
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
            android.util.Log.d(TAG, "checkConditionIsReady: reprocess data is null!");
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
                Log.d(TAG, "sendReprocessRequest: mCurrentProcessingData is not null, there is other tasks has be doing");
                return false;
            }
            ReprocessData reprocessData = (ReprocessData) this.mTaskDataList.peek();
        }
    }

    /* JADX WARNING: Missing block: B:10:0x0048, code:
            r6.mReprocessStartTime = java.lang.System.currentTimeMillis();
            r2 = r6.mCameraLock;
     */
    /* JADX WARNING: Missing block: B:11:0x0050, code:
            monitor-enter(r2);
     */
    /* JADX WARNING: Missing block: B:13:?, code:
            r0 = r6.mVTCameraDevice.createReprocessCaptureRequest(r1);
            r0.addTarget(r6.mReprocessImageReader.getSurface());
            r0.set(android.hardware.camera2.CaptureRequest.JPEG_THUMBNAIL_SIZE, new android.util.Size(320, 240));
            r0.set(android.hardware.camera2.CaptureRequest.JPEG_THUMBNAIL_QUALITY, java.lang.Byte.valueOf((byte) 100));
            r0.set(android.hardware.camera2.CaptureRequest.JPEG_QUALITY, java.lang.Byte.valueOf((byte) 100));
            r1 = r6.mReprocessImageWriter.dequeueInputImage();
            r3 = r6.mCurrentProcessingData.getYuvImage();
            r3.toImage(r1);
            r3.close();
            r6.mReprocessImageWriter.queueInputImage(r1);
            r6.mVTCaptureSession.capture(r0.build(), new com.xiaomi.camera.imagecodec.JpegEncoder.AnonymousClass1(r6), r6.mCameraOperationHandler);
     */
    /* JADX WARNING: Missing block: B:15:0x00ac, code:
            r0 = move-exception;
     */
    /* JADX WARNING: Missing block: B:17:?, code:
            r0.printStackTrace();
     */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    @WorkerThread
    private void reprocessImage() {
        Log.d(TAG, "reprocessImage: reprocessImage start");
        synchronized (this.mDataLock) {
            this.mCurrentProcessingData = (ReprocessData) this.mTaskDataList.poll();
            TotalCaptureResult toTotalCaptureResult = ICustomCaptureResult.toTotalCaptureResult(this.mCurrentProcessingData.getTotalCaptureResult(), this.mCurrentSessionId);
            if (toTotalCaptureResult == null) {
                Log.wtf(TAG, "reprocessImage: captureResult is NULL!");
                return;
            }
            String str = TAG;
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.append("reprocessImage: tag=");
            stringBuilder.append(this.mCurrentProcessingData.getImageTag());
            Log.d(str, stringBuilder.toString());
        }
        Log.d(TAG, "reprocessImage: reprocessImage end");
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
                        String access$000 = JpegEncoder.TAG;
                        StringBuilder stringBuilder = new StringBuilder();
                        stringBuilder.append("onOpened>>id=");
                        stringBuilder.append(cameraDevice.getId());
                        Log.d(access$000, stringBuilder.toString());
                        JpegEncoder.this.mVTCameraDevice = cameraDevice;
                        String access$0002 = JpegEncoder.TAG;
                        StringBuilder stringBuilder2 = new StringBuilder();
                        stringBuilder2.append("onOpened: ");
                        stringBuilder2.append(JpegEncoder.this.mVTCameraDevice);
                        Log.d(access$0002, stringBuilder2.toString());
                        JpegEncoder.this.mCurrentSessionId = -1;
                        JpegEncoder.this.mVTCaptureSession = null;
                        JpegEncoder.this.mCreatingReprocessSession = false;
                        JpegEncoder.this.sendReprocessRequest();
                        Log.d(JpegEncoder.TAG, "onOpened<<");
                    }
                }

                public void onClosed(@NonNull CameraDevice cameraDevice) {
                    synchronized (JpegEncoder.this.mCameraLock) {
                        String access$000 = JpegEncoder.TAG;
                        StringBuilder stringBuilder = new StringBuilder();
                        stringBuilder.append("onClosed: >>id=");
                        stringBuilder.append(cameraDevice.getId());
                        Log.d(access$000, stringBuilder.toString());
                        JpegEncoder.this.mCreatingReprocessSession = false;
                        if (cameraDevice == JpegEncoder.this.mVTCameraDevice) {
                            String access$0002 = JpegEncoder.TAG;
                            StringBuilder stringBuilder2 = new StringBuilder();
                            stringBuilder2.append("onClosed: ");
                            stringBuilder2.append(JpegEncoder.this.mVTCameraDevice);
                            Log.d(access$0002, stringBuilder2.toString());
                            JpegEncoder.this.mVTCameraDevice = null;
                        }
                        if (JpegEncoder.this.mNeedReopenCamera) {
                            JpegEncoder.this.sendReprocessRequest();
                            JpegEncoder.this.mNeedReopenCamera = false;
                        }
                        Log.d(JpegEncoder.TAG, "onClosed: <<");
                    }
                }

                public void onDisconnected(@NonNull CameraDevice cameraDevice) {
                    synchronized (JpegEncoder.this.mCameraLock) {
                        String access$000 = JpegEncoder.TAG;
                        StringBuilder stringBuilder = new StringBuilder();
                        stringBuilder.append("onDisconnected: >>id=");
                        stringBuilder.append(cameraDevice.getId());
                        Log.d(access$000, stringBuilder.toString());
                        cameraDevice.close();
                        JpegEncoder.this.mCreatingReprocessSession = false;
                        if (cameraDevice == JpegEncoder.this.mVTCameraDevice) {
                            String access$0002 = JpegEncoder.TAG;
                            StringBuilder stringBuilder2 = new StringBuilder();
                            stringBuilder2.append("onDisconnected: ");
                            stringBuilder2.append(JpegEncoder.this.mVTCameraDevice);
                            Log.d(access$0002, stringBuilder2.toString());
                            JpegEncoder.this.mVTCameraDevice = null;
                        }
                        Log.d(JpegEncoder.TAG, "onDisconnected: <<");
                    }
                }

                public void onError(@NonNull CameraDevice cameraDevice, int i) {
                    synchronized (JpegEncoder.this.mCameraLock) {
                        String access$000 = JpegEncoder.TAG;
                        StringBuilder stringBuilder = new StringBuilder();
                        stringBuilder.append("onError: >>id=");
                        stringBuilder.append(cameraDevice.getId());
                        Log.e(access$000, stringBuilder.toString());
                        cameraDevice.close();
                        JpegEncoder.this.mCreatingReprocessSession = false;
                        if (cameraDevice == JpegEncoder.this.mVTCameraDevice) {
                            String access$0002 = JpegEncoder.TAG;
                            StringBuilder stringBuilder2 = new StringBuilder();
                            stringBuilder2.append("onError: ");
                            stringBuilder2.append(JpegEncoder.this.mVTCameraDevice);
                            Log.d(access$0002, stringBuilder2.toString());
                            JpegEncoder.this.mVTCameraDevice = null;
                        }
                        Log.e(JpegEncoder.TAG, "onError: <<");
                    }
                }
            }, this.mCameraOperationHandler);
        } catch (Throwable e) {
            Log.e(TAG, "openVTCamera: open camera failed! No permission Exception.", e);
        }
    }

    @WorkerThread
    private void createReprocessSession(@NonNull InputConfiguration inputConfiguration, @NonNull JpegOutputConfiguration jpegOutputConfiguration) {
        Log.d(TAG, "createReprocessSession>>");
        initReprocessImageReader(jpegOutputConfiguration.getWidth(), jpegOutputConfiguration.getHeight());
        try {
            this.mVTCameraDevice.createReprocessableCaptureSession(new InputConfiguration(inputConfiguration.getWidth(), inputConfiguration.getHeight(), inputConfiguration.getFormat()), Arrays.asList(new Surface[]{this.mReprocessImageReader.getSurface()}), new CameraCaptureSession.StateCallback() {
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
                        int access$900 = JpegEncoder.getSessionId(cameraCaptureSession);
                        Log.d(JpegEncoder.TAG, String.format("sessionId: %d %d", new Object[]{Integer.valueOf(JpegEncoder.this.mCurrentSessionId), Integer.valueOf(access$900)}));
                        if (!(access$900 == -1 || JpegEncoder.this.mCurrentSessionId == access$900)) {
                            Log.w(JpegEncoder.TAG, String.format("sessionId: %d->%d", new Object[]{Integer.valueOf(JpegEncoder.this.mCurrentSessionId), Integer.valueOf(access$900)}));
                            JpegEncoder.this.mCurrentSessionId = access$900;
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
    private void initReprocessImageReader(int i, int i2) {
        Log.d(TAG, "initReprocessImageReader>>");
        if (!(this.mReprocessImageReader == null || (this.mReprocessImageReader.getWidth() == i && this.mReprocessImageReader.getHeight() == i2))) {
            Log.d(TAG, "closing obsolete reprocess reader");
            this.mReprocessImageReader.close();
        }
        this.mReprocessImageReader = ImageReader.newInstance(i, i2, 256, 2);
        this.mReprocessImageReader.setOnImageAvailableListener(new OnImageAvailableListener() {
            public void onImageAvailable(ImageReader imageReader) {
                Image acquireNextImage = imageReader.acquireNextImage();
                String access$000 = JpegEncoder.TAG;
                StringBuilder stringBuilder = new StringBuilder();
                stringBuilder.append("onImageAvailable: received reprocessed image");
                stringBuilder.append(acquireNextImage);
                Log.d(access$000, stringBuilder.toString());
                byte[] access$1100 = JpegEncoder.getJpegData(acquireNextImage);
                acquireNextImage.close();
                synchronized (JpegEncoder.this.mDataLock) {
                    JpegEncoder.this.mCurrentProcessingData.getResultListener().onJpegAvailable(access$1100, JpegEncoder.this.mCurrentProcessingData.getImageTag());
                    Log.d(JpegEncoder.TAG, String.format("jpeg return for %s. cost=%d", new Object[]{JpegEncoder.this.mCurrentProcessingData.getImageTag(), Long.valueOf(System.currentTimeMillis() - JpegEncoder.this.mReprocessStartTime)}));
                    JpegEncoder.this.mCurrentProcessingData = null;
                }
                JpegEncoder.this.sendReprocessRequest();
            }
        }, this.mCameraOperationHandler);
        Log.d(TAG, "initReprocessImageReader<<");
    }

    /* JADX WARNING: Removed duplicated region for block: B:4:0x0017 A:{Splitter: B:1:0x0002, ExcHandler: java.lang.ClassNotFoundException (r2_2 'e' java.lang.Throwable)} */
    /* JADX WARNING: Removed duplicated region for block: B:4:0x0017 A:{Splitter: B:1:0x0002, ExcHandler: java.lang.ClassNotFoundException (r2_2 'e' java.lang.Throwable)} */
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
