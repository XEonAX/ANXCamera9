package com.xiaomi.camera.imagecodec;

import android.annotation.SuppressLint;
import android.content.Context;
import android.hardware.camera2.CameraAccessException;
import android.hardware.camera2.CameraCaptureSession;
import android.hardware.camera2.CameraDevice;
import android.hardware.camera2.CameraDevice.StateCallback;
import android.hardware.camera2.CameraManager;
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
    @android.support.annotation.AnyThread
    public void deInit() {
        /*
        r3 = this;
        r0 = TAG;
        r1 = "deInit>>";
        android.util.Log.d(r0, r1);
        r0 = r3.mDataLock;
        monitor-enter(r0);
        r1 = r3.mInitialized;	 Catch:{ all -> 0x0070 }
        if (r1 != 0) goto L_0x0010;
    L_0x000e:
        monitor-exit(r0);	 Catch:{ all -> 0x0070 }
        return;
    L_0x0010:
        r1 = 0;
        r3.mInitialized = r1;	 Catch:{ all -> 0x0070 }
        r1 = 0;
        r3.mCameraManager = r1;	 Catch:{ all -> 0x0070 }
        r3.mCurrentProcessingData = r1;	 Catch:{ all -> 0x0070 }
        monitor-exit(r0);	 Catch:{ all -> 0x0070 }
        r2 = r3.mCameraLock;
        monitor-enter(r2);
        r0 = r3.mVTCaptureSession;	 Catch:{ all -> 0x006d }
        if (r0 == 0) goto L_0x002b;
    L_0x0020:
        r0 = r3.mVTCaptureSession;	 Catch:{ all -> 0x006d }
        r0.close();	 Catch:{ all -> 0x006d }
        r3.mVTCaptureSession = r1;	 Catch:{ all -> 0x006d }
        r3.mReprocessImageReader = r1;	 Catch:{ all -> 0x006d }
        r3.mReprocessImageWriter = r1;	 Catch:{ all -> 0x006d }
    L_0x002b:
        r0 = r3.mVTCameraDevice;	 Catch:{ all -> 0x006d }
        if (r0 == 0) goto L_0x0036;
    L_0x002f:
        r0 = r3.mVTCameraDevice;	 Catch:{ all -> 0x006d }
        r0.close();	 Catch:{ all -> 0x006d }
        r3.mVTCameraDevice = r1;	 Catch:{ all -> 0x006d }
    L_0x0036:
        monitor-exit(r2);	 Catch:{ all -> 0x006d }
        r0 = r3.mCameraOperationThread;
        if (r0 == 0) goto L_0x004e;
    L_0x003b:
        r0 = r3.mCameraOperationThread;
        r0.quitSafely();
        r0 = r3.mCameraOperationThread;	 Catch:{ InterruptedException -> 0x004a }
        r0.join();	 Catch:{ InterruptedException -> 0x004a }
        r3.mCameraOperationThread = r1;	 Catch:{ InterruptedException -> 0x004a }
        r3.mCameraOperationHandler = r1;	 Catch:{ InterruptedException -> 0x004a }
        goto L_0x004e;
    L_0x004a:
        r0 = move-exception;
        r0.printStackTrace();
    L_0x004e:
        r0 = r3.mReprocessThread;
        if (r0 == 0) goto L_0x0065;
    L_0x0052:
        r0 = r3.mReprocessThread;
        r0.quitSafely();
        r0 = r3.mReprocessThread;	 Catch:{ InterruptedException -> 0x0061 }
        r0.join();	 Catch:{ InterruptedException -> 0x0061 }
        r3.mReprocessThread = r1;	 Catch:{ InterruptedException -> 0x0061 }
        r3.mReprocessHandler = r1;	 Catch:{ InterruptedException -> 0x0061 }
        goto L_0x0065;
    L_0x0061:
        r0 = move-exception;
        r0.printStackTrace();
    L_0x0065:
        r0 = TAG;
        r1 = "deInit<<";
        android.util.Log.d(r0, r1);
        return;
    L_0x006d:
        r0 = move-exception;
        monitor-exit(r2);	 Catch:{ all -> 0x006d }
        throw r0;
    L_0x0070:
        r1 = move-exception;
        monitor-exit(r0);	 Catch:{ all -> 0x0070 }
        throw r1;
        */
        throw new UnsupportedOperationException("Method not decompiled: com.xiaomi.camera.imagecodec.JpegEncoder.deInit():void");
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
    @android.support.annotation.AnyThread
    private void sendReprocessRequest() {
        /*
        r5 = this;
        r0 = TAG;
        r1 = "=============================================================";
        android.util.Log.i(r0, r1);
        r0 = r5.mInitialized;
        if (r0 != 0) goto L_0x0013;
    L_0x000b:
        r0 = TAG;
        r1 = "sendReprocessRequest: JpegEncoder has not initialized! Ignore all request.";
        android.util.Log.w(r0, r1);
        return;
    L_0x0013:
        r0 = r5.mCameraLock;
        monitor-enter(r0);
        r1 = r5.mCreatingReprocessSession;	 Catch:{ all -> 0x0071 }
        if (r1 == 0) goto L_0x0023;
    L_0x001a:
        r1 = TAG;	 Catch:{ all -> 0x0071 }
        r2 = "sendReprocessRequest: creating reprocess session...";
        android.util.Log.d(r1, r2);	 Catch:{ all -> 0x0071 }
        monitor-exit(r0);	 Catch:{ all -> 0x0071 }
        return;
    L_0x0023:
        monitor-exit(r0);	 Catch:{ all -> 0x0071 }
        r1 = r5.mDataLock;
        monitor-enter(r1);
        r0 = r5.mTaskDataList;	 Catch:{ all -> 0x006e }
        r0 = r0.isEmpty();	 Catch:{ all -> 0x006e }
        r2 = 2;
        if (r0 == 0) goto L_0x0040;
    L_0x0030:
        r0 = TAG;	 Catch:{ all -> 0x006e }
        r3 = "sendReprocessRequest: there is no tasks to process, try to close camera after 30s";
        android.util.Log.d(r0, r3);	 Catch:{ all -> 0x006e }
        r0 = r5.mReprocessHandler;	 Catch:{ all -> 0x006e }
        r3 = 30000; // 0x7530 float:4.2039E-41 double:1.4822E-319;
        r0.sendEmptyMessageDelayed(r2, r3);	 Catch:{ all -> 0x006e }
        monitor-exit(r1);	 Catch:{ all -> 0x006e }
        return;
    L_0x0040:
        r0 = r5.mReprocessHandler;	 Catch:{ all -> 0x006e }
        r0 = r0.hasMessages(r2);	 Catch:{ all -> 0x006e }
        if (r0 == 0) goto L_0x004d;
    L_0x0048:
        r0 = r5.mReprocessHandler;	 Catch:{ all -> 0x006e }
        r0.removeMessages(r2);	 Catch:{ all -> 0x006e }
    L_0x004d:
        monitor-exit(r1);	 Catch:{ all -> 0x006e }
        r0 = r5.mReprocessHandler;
        r1 = 1;
        r0 = r0.hasMessages(r1);
        if (r0 == 0) goto L_0x005f;
    L_0x0057:
        r0 = TAG;
        r1 = "sendReprocessRequest: there is other task in message queue";
        android.util.Log.d(r0, r1);
        goto L_0x006d;
    L_0x005f:
        r0 = TAG;
        r2 = "sendReprocessRequest: send MSG_REPROCESS_IMG";
        android.util.Log.d(r0, r2);
        r0 = r5.mReprocessHandler;
        r2 = 0;
        r0.sendEmptyMessageDelayed(r1, r2);
    L_0x006d:
        return;
    L_0x006e:
        r0 = move-exception;
        monitor-exit(r1);	 Catch:{ all -> 0x006e }
        throw r0;
    L_0x0071:
        r1 = move-exception;
        monitor-exit(r0);	 Catch:{ all -> 0x0071 }
        throw r1;
        */
        throw new UnsupportedOperationException("Method not decompiled: com.xiaomi.camera.imagecodec.JpegEncoder.sendReprocessRequest():void");
    }

    /* JADX WARNING: Removed duplicated region for block: B:51:0x0155  */
    /* JADX WARNING: Missing block: B:26:0x00b3, code:
            return true;
     */
    /* JADX WARNING: Missing block: B:58:0x0170, code:
            return r4;
     */
    @android.support.annotation.WorkerThread
    private boolean createCaptureSessionIfNeed(@android.support.annotation.NonNull com.xiaomi.camera.imagecodec.ReprocessData r10) {
        /*
        r9 = this;
        r0 = r10.getYuvImage();
        r1 = new android.hardware.camera2.params.InputConfiguration;
        r2 = r0.getWidth();
        r3 = r0.getHeight();
        r0 = r0.getFormat();
        r1.<init>(r2, r3, r0);
        r0 = new com.xiaomi.camera.imagecodec.JpegOutputConfiguration;
        r2 = r10.getOutputWidth();
        r3 = r10.getOutputHeight();
        r0.<init>(r2, r3);
        r10 = r10.isFrontCamera();
        if (r10 == 0) goto L_0x002b;
    L_0x0028:
        r10 = r9.mFrontVtCameraId;
        goto L_0x002d;
    L_0x002b:
        r10 = r9.mBackVtCameraId;
    L_0x002d:
        r2 = r9.mCameraLock;
        monitor-enter(r2);
        r3 = r9.mVTCameraDevice;	 Catch:{ all -> 0x0171 }
        r4 = 0;
        r5 = 1;
        if (r3 == 0) goto L_0x0045;
    L_0x0036:
        r3 = r9.mVTCameraDevice;	 Catch:{ all -> 0x0171 }
        r3 = r3.getId();	 Catch:{ all -> 0x0171 }
        r3 = r10.equals(r3);	 Catch:{ all -> 0x0171 }
        if (r3 != 0) goto L_0x0043;
    L_0x0042:
        goto L_0x0045;
    L_0x0043:
        r3 = r4;
        goto L_0x0047;
        r3 = r5;
    L_0x0047:
        if (r3 == 0) goto L_0x00b4;
    L_0x0049:
        r0 = r9.mCreatingReprocessSession;	 Catch:{ all -> 0x0171 }
        if (r0 == 0) goto L_0x0056;
    L_0x004d:
        r10 = TAG;	 Catch:{ all -> 0x0171 }
        r0 = "creating reprocess session...";
        android.util.Log.d(r10, r0);	 Catch:{ all -> 0x0171 }
        monitor-exit(r2);	 Catch:{ all -> 0x0171 }
        return r5;
    L_0x0056:
        r9.mCreatingReprocessSession = r5;	 Catch:{ all -> 0x0171 }
        r0 = r9.mVTCameraDevice;	 Catch:{ all -> 0x0171 }
        if (r0 != 0) goto L_0x0060;
    L_0x005c:
        r9.openVTCamera(r10);	 Catch:{ all -> 0x0171 }
        goto L_0x00b2;
    L_0x0060:
        r0 = r9.mVTCameraDevice;	 Catch:{ all -> 0x0171 }
        r0 = r0.getId();	 Catch:{ all -> 0x0171 }
        r0 = r10.equals(r0);	 Catch:{ all -> 0x0171 }
        if (r0 != 0) goto L_0x00b2;
    L_0x006c:
        r0 = TAG;	 Catch:{ all -> 0x0171 }
        r1 = new java.lang.StringBuilder;	 Catch:{ all -> 0x0171 }
        r1.<init>();	 Catch:{ all -> 0x0171 }
        r3 = "createCaptureSessionIfNeed: expected device id is not matched, The old is :";
        r1.append(r3);	 Catch:{ all -> 0x0171 }
        r3 = r9.mVTCameraDevice;	 Catch:{ all -> 0x0171 }
        r3 = r3.getId();	 Catch:{ all -> 0x0171 }
        r1.append(r3);	 Catch:{ all -> 0x0171 }
        r3 = "; the new is :";
        r1.append(r3);	 Catch:{ all -> 0x0171 }
        r1.append(r10);	 Catch:{ all -> 0x0171 }
        r10 = r1.toString();	 Catch:{ all -> 0x0171 }
        android.util.Log.d(r0, r10);	 Catch:{ all -> 0x0171 }
        r10 = TAG;	 Catch:{ all -> 0x0171 }
        r0 = new java.lang.StringBuilder;	 Catch:{ all -> 0x0171 }
        r0.<init>();	 Catch:{ all -> 0x0171 }
        r1 = "createCaptureSessionIfNeed: close old camera ";
        r0.append(r1);	 Catch:{ all -> 0x0171 }
        r1 = r9.mVTCameraDevice;	 Catch:{ all -> 0x0171 }
        r0.append(r1);	 Catch:{ all -> 0x0171 }
        r0 = r0.toString();	 Catch:{ all -> 0x0171 }
        android.util.Log.d(r10, r0);	 Catch:{ all -> 0x0171 }
        r10 = r9.mVTCameraDevice;	 Catch:{ all -> 0x0171 }
        r10.close();	 Catch:{ all -> 0x0171 }
        r10 = 0;
        r9.mVTCameraDevice = r10;	 Catch:{ all -> 0x0171 }
        r9.mNeedReopenCamera = r5;	 Catch:{ all -> 0x0171 }
    L_0x00b2:
        monitor-exit(r2);	 Catch:{ all -> 0x0171 }
        return r5;
        r10 = r9.mVTCaptureSession;	 Catch:{ all -> 0x0171 }
        if (r10 != 0) goto L_0x00bd;
    L_0x00ba:
        r4 = r5;
        goto L_0x0153;
    L_0x00bd:
        r10 = r9.mInputConfiguration;	 Catch:{ all -> 0x0171 }
        r10 = r1.equals(r10);	 Catch:{ all -> 0x0171 }
        if (r10 == 0) goto L_0x00cd;
    L_0x00c5:
        r10 = r9.mOutputConfiguration;	 Catch:{ all -> 0x0171 }
        r10 = r0.equals(r10);	 Catch:{ all -> 0x0171 }
        if (r10 != 0) goto L_0x0153;
    L_0x00cd:
        r10 = TAG;	 Catch:{ all -> 0x0171 }
        r3 = "recreate session settings: %dx%d->%dx%d %dx%d->%dx%d";
        r6 = 8;
        r6 = new java.lang.Object[r6];	 Catch:{ all -> 0x0171 }
        r7 = r9.mInputConfiguration;	 Catch:{ all -> 0x0171 }
        if (r7 != 0) goto L_0x00db;
    L_0x00d9:
        r7 = r4;
        goto L_0x00e1;
    L_0x00db:
        r7 = r9.mInputConfiguration;	 Catch:{ all -> 0x0171 }
        r7 = r7.getWidth();	 Catch:{ all -> 0x0171 }
    L_0x00e1:
        r7 = java.lang.Integer.valueOf(r7);	 Catch:{ all -> 0x0171 }
        r6[r4] = r7;	 Catch:{ all -> 0x0171 }
        r7 = r9.mInputConfiguration;	 Catch:{ all -> 0x0171 }
        if (r7 != 0) goto L_0x00ed;
    L_0x00eb:
        r7 = r4;
        goto L_0x00f3;
    L_0x00ed:
        r7 = r9.mInputConfiguration;	 Catch:{ all -> 0x0171 }
        r7 = r7.getHeight();	 Catch:{ all -> 0x0171 }
    L_0x00f3:
        r7 = java.lang.Integer.valueOf(r7);	 Catch:{ all -> 0x0171 }
        r6[r5] = r7;	 Catch:{ all -> 0x0171 }
        r7 = 2;
        r8 = r1.getWidth();	 Catch:{ all -> 0x0171 }
        r8 = java.lang.Integer.valueOf(r8);	 Catch:{ all -> 0x0171 }
        r6[r7] = r8;	 Catch:{ all -> 0x0171 }
        r7 = 3;
        r8 = r1.getHeight();	 Catch:{ all -> 0x0171 }
        r8 = java.lang.Integer.valueOf(r8);	 Catch:{ all -> 0x0171 }
        r6[r7] = r8;	 Catch:{ all -> 0x0171 }
        r7 = 4;
        r8 = r9.mOutputConfiguration;	 Catch:{ all -> 0x0171 }
        if (r8 != 0) goto L_0x0116;
    L_0x0114:
        r8 = r4;
        goto L_0x011c;
    L_0x0116:
        r8 = r9.mOutputConfiguration;	 Catch:{ all -> 0x0171 }
        r8 = r8.getWidth();	 Catch:{ all -> 0x0171 }
    L_0x011c:
        r8 = java.lang.Integer.valueOf(r8);	 Catch:{ all -> 0x0171 }
        r6[r7] = r8;	 Catch:{ all -> 0x0171 }
        r7 = 5;
        r8 = r9.mOutputConfiguration;	 Catch:{ all -> 0x0171 }
        if (r8 != 0) goto L_0x0128;
    L_0x0127:
        goto L_0x012e;
    L_0x0128:
        r4 = r9.mOutputConfiguration;	 Catch:{ all -> 0x0171 }
        r4 = r4.getHeight();	 Catch:{ all -> 0x0171 }
    L_0x012e:
        r4 = java.lang.Integer.valueOf(r4);	 Catch:{ all -> 0x0171 }
        r6[r7] = r4;	 Catch:{ all -> 0x0171 }
        r4 = 6;
        r7 = r0.getWidth();	 Catch:{ all -> 0x0171 }
        r7 = java.lang.Integer.valueOf(r7);	 Catch:{ all -> 0x0171 }
        r6[r4] = r7;	 Catch:{ all -> 0x0171 }
        r4 = 7;
        r7 = r0.getHeight();	 Catch:{ all -> 0x0171 }
        r7 = java.lang.Integer.valueOf(r7);	 Catch:{ all -> 0x0171 }
        r6[r4] = r7;	 Catch:{ all -> 0x0171 }
        r3 = java.lang.String.format(r3, r6);	 Catch:{ all -> 0x0171 }
        android.util.Log.d(r10, r3);	 Catch:{ all -> 0x0171 }
        goto L_0x00ba;
    L_0x0153:
        if (r4 == 0) goto L_0x016f;
    L_0x0155:
        r10 = r9.mCreatingReprocessSession;	 Catch:{ all -> 0x0171 }
        if (r10 == 0) goto L_0x0162;
    L_0x0159:
        r10 = TAG;	 Catch:{ all -> 0x0171 }
        r0 = "creating reprocess session...";
        android.util.Log.d(r10, r0);	 Catch:{ all -> 0x0171 }
        monitor-exit(r2);	 Catch:{ all -> 0x0171 }
        return r5;
    L_0x0162:
        r9.mCreatingReprocessSession = r5;	 Catch:{ all -> 0x0171 }
        r9.mInputConfiguration = r1;	 Catch:{ all -> 0x0171 }
        r9.mOutputConfiguration = r0;	 Catch:{ all -> 0x0171 }
        r10 = r9.mInputConfiguration;	 Catch:{ all -> 0x0171 }
        r0 = r9.mOutputConfiguration;	 Catch:{ all -> 0x0171 }
        r9.createReprocessSession(r10, r0);	 Catch:{ all -> 0x0171 }
    L_0x016f:
        monitor-exit(r2);	 Catch:{ all -> 0x0171 }
        return r4;
    L_0x0171:
        r10 = move-exception;
        monitor-exit(r2);	 Catch:{ all -> 0x0171 }
        throw r10;
        */
        throw new UnsupportedOperationException("Method not decompiled: com.xiaomi.camera.imagecodec.JpegEncoder.createCaptureSessionIfNeed(com.xiaomi.camera.imagecodec.ReprocessData):boolean");
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
    @android.support.annotation.WorkerThread
    private boolean checkConditionIsReady() {
        /*
        r4 = this;
        r0 = r4.mDataLock;
        monitor-enter(r0);
        r1 = r4.mCurrentProcessingData;	 Catch:{ all -> 0x002c }
        r2 = 0;
        if (r1 == 0) goto L_0x0012;
    L_0x0009:
        r1 = TAG;	 Catch:{ all -> 0x002c }
        r3 = "sendReprocessRequest: mCurrentProcessingData is not null, there is other tasks has be doing";
        android.util.Log.d(r1, r3);	 Catch:{ all -> 0x002c }
        monitor-exit(r0);	 Catch:{ all -> 0x002c }
        return r2;
    L_0x0012:
        r1 = r4.mTaskDataList;	 Catch:{ all -> 0x002c }
        r1 = r1.peek();	 Catch:{ all -> 0x002c }
        r1 = (com.xiaomi.camera.imagecodec.ReprocessData) r1;	 Catch:{ all -> 0x002c }
        monitor-exit(r0);	 Catch:{ all -> 0x002c }
        if (r1 != 0) goto L_0x0025;
    L_0x001d:
        r0 = TAG;
        r1 = "checkConditionIsReady: reprocess data is null!";
        android.util.Log.d(r0, r1);
        return r2;
    L_0x0025:
        r0 = r4.createCaptureSessionIfNeed(r1);
        r0 = r0 ^ 1;
        return r0;
    L_0x002c:
        r1 = move-exception;
        monitor-exit(r0);	 Catch:{ all -> 0x002c }
        throw r1;
        */
        throw new UnsupportedOperationException("Method not decompiled: com.xiaomi.camera.imagecodec.JpegEncoder.checkConditionIsReady():boolean");
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
    @android.support.annotation.WorkerThread
    private void reprocessImage() {
        /*
        r6 = this;
        r0 = TAG;
        r1 = "reprocessImage: reprocessImage start";
        android.util.Log.d(r0, r1);
        r0 = r6.mDataLock;
        monitor-enter(r0);
        r1 = r6.mTaskDataList;	 Catch:{ all -> 0x00bb }
        r1 = r1.poll();	 Catch:{ all -> 0x00bb }
        r1 = (com.xiaomi.camera.imagecodec.ReprocessData) r1;	 Catch:{ all -> 0x00bb }
        r6.mCurrentProcessingData = r1;	 Catch:{ all -> 0x00bb }
        r1 = r6.mCurrentProcessingData;	 Catch:{ all -> 0x00bb }
        r1 = r1.getTotalCaptureResult();	 Catch:{ all -> 0x00bb }
        r2 = r6.mCurrentSessionId;	 Catch:{ all -> 0x00bb }
        r1 = com.xiaomi.protocol.ICustomCaptureResult.toTotalCaptureResult(r1, r2);	 Catch:{ all -> 0x00bb }
        if (r1 != 0) goto L_0x002b;
    L_0x0022:
        r1 = TAG;	 Catch:{ all -> 0x00bb }
        r2 = "reprocessImage: captureResult is NULL!";
        android.util.Log.wtf(r1, r2);	 Catch:{ all -> 0x00bb }
        monitor-exit(r0);	 Catch:{ all -> 0x00bb }
        return;
    L_0x002b:
        r2 = TAG;	 Catch:{ all -> 0x00bb }
        r3 = new java.lang.StringBuilder;	 Catch:{ all -> 0x00bb }
        r3.<init>();	 Catch:{ all -> 0x00bb }
        r4 = "reprocessImage: tag=";
        r3.append(r4);	 Catch:{ all -> 0x00bb }
        r4 = r6.mCurrentProcessingData;	 Catch:{ all -> 0x00bb }
        r4 = r4.getImageTag();	 Catch:{ all -> 0x00bb }
        r3.append(r4);	 Catch:{ all -> 0x00bb }
        r3 = r3.toString();	 Catch:{ all -> 0x00bb }
        android.util.Log.d(r2, r3);	 Catch:{ all -> 0x00bb }
        monitor-exit(r0);	 Catch:{ all -> 0x00bb }
        r2 = java.lang.System.currentTimeMillis();
        r6.mReprocessStartTime = r2;
        r2 = r6.mCameraLock;
        monitor-enter(r2);
        r0 = r6.mVTCameraDevice;	 Catch:{ CameraAccessException -> 0x00ac }
        r0 = r0.createReprocessCaptureRequest(r1);	 Catch:{ CameraAccessException -> 0x00ac }
        r1 = r6.mReprocessImageReader;	 Catch:{ CameraAccessException -> 0x00ac }
        r1 = r1.getSurface();	 Catch:{ CameraAccessException -> 0x00ac }
        r0.addTarget(r1);	 Catch:{ CameraAccessException -> 0x00ac }
        r1 = android.hardware.camera2.CaptureRequest.JPEG_THUMBNAIL_SIZE;	 Catch:{ CameraAccessException -> 0x00ac }
        r3 = new android.util.Size;	 Catch:{ CameraAccessException -> 0x00ac }
        r4 = 320; // 0x140 float:4.48E-43 double:1.58E-321;
        r5 = 240; // 0xf0 float:3.36E-43 double:1.186E-321;
        r3.<init>(r4, r5);	 Catch:{ CameraAccessException -> 0x00ac }
        r0.set(r1, r3);	 Catch:{ CameraAccessException -> 0x00ac }
        r1 = android.hardware.camera2.CaptureRequest.JPEG_THUMBNAIL_QUALITY;	 Catch:{ CameraAccessException -> 0x00ac }
        r3 = 100;
        r4 = java.lang.Byte.valueOf(r3);	 Catch:{ CameraAccessException -> 0x00ac }
        r0.set(r1, r4);	 Catch:{ CameraAccessException -> 0x00ac }
        r1 = android.hardware.camera2.CaptureRequest.JPEG_QUALITY;	 Catch:{ CameraAccessException -> 0x00ac }
        r3 = java.lang.Byte.valueOf(r3);	 Catch:{ CameraAccessException -> 0x00ac }
        r0.set(r1, r3);	 Catch:{ CameraAccessException -> 0x00ac }
        r1 = r6.mReprocessImageWriter;	 Catch:{ CameraAccessException -> 0x00ac }
        r1 = r1.dequeueInputImage();	 Catch:{ CameraAccessException -> 0x00ac }
        r3 = r6.mCurrentProcessingData;	 Catch:{ CameraAccessException -> 0x00ac }
        r3 = r3.getYuvImage();	 Catch:{ CameraAccessException -> 0x00ac }
        r3.toImage(r1);	 Catch:{ CameraAccessException -> 0x00ac }
        r3.close();	 Catch:{ CameraAccessException -> 0x00ac }
        r3 = r6.mReprocessImageWriter;	 Catch:{ CameraAccessException -> 0x00ac }
        r3.queueInputImage(r1);	 Catch:{ CameraAccessException -> 0x00ac }
        r1 = new com.xiaomi.camera.imagecodec.JpegEncoder$1;	 Catch:{ CameraAccessException -> 0x00ac }
        r1.<init>();	 Catch:{ CameraAccessException -> 0x00ac }
        r3 = r6.mVTCaptureSession;	 Catch:{ CameraAccessException -> 0x00ac }
        r0 = r0.build();	 Catch:{ CameraAccessException -> 0x00ac }
        r4 = r6.mCameraOperationHandler;	 Catch:{ CameraAccessException -> 0x00ac }
        r3.capture(r0, r1, r4);	 Catch:{ CameraAccessException -> 0x00ac }
        goto L_0x00b0;
    L_0x00aa:
        r0 = move-exception;
        goto L_0x00b9;
    L_0x00ac:
        r0 = move-exception;
        r0.printStackTrace();	 Catch:{ all -> 0x00aa }
    L_0x00b0:
        monitor-exit(r2);	 Catch:{ all -> 0x00aa }
        r0 = TAG;
        r1 = "reprocessImage: reprocessImage end";
        android.util.Log.d(r0, r1);
        return;
    L_0x00b9:
        monitor-exit(r2);	 Catch:{ all -> 0x00aa }
        throw r0;
    L_0x00bb:
        r1 = move-exception;
        monitor-exit(r0);	 Catch:{ all -> 0x00bb }
        throw r1;
        */
        throw new UnsupportedOperationException("Method not decompiled: com.xiaomi.camera.imagecodec.JpegEncoder.reprocessImage():void");
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

    /* JADX WARNING: Removed duplicated region for block: B:4:0x0017 A:{ExcHandler: java.lang.ClassNotFoundException (r2_2 'e' java.lang.Throwable), Splitter: B:1:0x0002} */
    /* JADX WARNING: Removed duplicated region for block: B:4:0x0017 A:{ExcHandler: java.lang.ClassNotFoundException (r2_2 'e' java.lang.Throwable), Splitter: B:1:0x0002} */
    /* JADX WARNING: Missing block: B:4:0x0017, code:
            r2 = move-exception;
     */
    /* JADX WARNING: Missing block: B:5:0x0018, code:
            android.util.Log.w(TAG, "getSessionId: failed! ", r2);
     */
    private static int getSessionId(android.hardware.camera2.CameraCaptureSession r2) {
        /*
        if (r2 == 0) goto L_0x001f;
    L_0x0002:
        r0 = "android.hardware.camera2.impl.CameraCaptureSessionImpl";
        r0 = java.lang.Class.forName(r0);	 Catch:{ ClassNotFoundException -> 0x0017, ClassNotFoundException -> 0x0017, ClassNotFoundException -> 0x0017 }
        r1 = "mId";
        r0 = r0.getDeclaredField(r1);	 Catch:{ ClassNotFoundException -> 0x0017, ClassNotFoundException -> 0x0017, ClassNotFoundException -> 0x0017 }
        r1 = 1;
        r0.setAccessible(r1);	 Catch:{ ClassNotFoundException -> 0x0017, ClassNotFoundException -> 0x0017, ClassNotFoundException -> 0x0017 }
        r2 = r0.getInt(r2);	 Catch:{ ClassNotFoundException -> 0x0017, ClassNotFoundException -> 0x0017, ClassNotFoundException -> 0x0017 }
        return r2;
    L_0x0017:
        r2 = move-exception;
        r0 = TAG;
        r1 = "getSessionId: failed! ";
        android.util.Log.w(r0, r1, r2);
    L_0x001f:
        r2 = -1;
        return r2;
        */
        throw new UnsupportedOperationException("Method not decompiled: com.xiaomi.camera.imagecodec.JpegEncoder.getSessionId(android.hardware.camera2.CameraCaptureSession):int");
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
