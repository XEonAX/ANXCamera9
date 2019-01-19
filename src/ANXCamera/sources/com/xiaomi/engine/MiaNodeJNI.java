package com.xiaomi.engine;

import android.media.Image;
import android.os.Handler;
import android.os.HandlerThread;
import android.support.annotation.NonNull;
import android.util.Log;
import com.android.camera.module.loader.FunctionParseBeautyBodySlimCount;
import java.util.List;

public class MiaNodeJNI {
    private static final String LIB_NAME = "com.xiaomi.camera.mianodejni";
    private static final String TAG = MiaNodeJNI.class.getSimpleName();
    private static boolean sInitialized;
    private static int sType = 0;
    private Handler mHandler;
    private HandlerThread mHandlerThread;
    private final Object mObjLock;

    static class InstanceHolder {
        static MiaNodeJNI INSTANCE = new MiaNodeJNI();

        InstanceHolder() {
        }
    }

    private static native int deInit(int i);

    private static native int init(int i);

    private static native int processRequest(@NonNull List<FrameData> list, @NonNull Image image, int i, boolean z);

    /* synthetic */ MiaNodeJNI(AnonymousClass1 anonymousClass1) {
        this();
    }

    public static MiaNodeJNI getInstance() {
        return InstanceHolder.INSTANCE;
    }

    private MiaNodeJNI() {
        this.mHandlerThread = new HandlerThread("MiaNodeLifeCycle");
        this.mObjLock = new Object();
        try {
            Log.e(TAG, "start loading com.xiaomi.camera.mianodejni");
            System.loadLibrary(LIB_NAME);
            Log.d(TAG, "static initializer: loadLibrary com.xiaomi.camera.mianodejni");
        } catch (Throwable e) {
            String str = TAG;
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.append("can not load library:com.xiaomi.camera.mianodejni : ");
            stringBuilder.append(Log.getStackTraceString(e));
            Log.e(str, stringBuilder.toString());
        }
        this.mHandlerThread.start();
        this.mHandler = new Handler(this.mHandlerThread.getLooper());
    }

    private void tryToCloseNode() {
        this.mHandler.removeCallbacksAndMessages(null);
        this.mHandler.postDelayed(new Runnable() {
            public void run() {
                MiaNodeJNI.this.deInitialize(MiaNodeJNI.sType);
            }
        }, FunctionParseBeautyBodySlimCount.TIP_INTERVAL_TIME);
    }

    private void initialize(int i) {
        synchronized (this.mObjLock) {
            long currentTimeMillis = System.currentTimeMillis();
            if (!(!sInitialized || sType == i || sType == 0)) {
                deInitialize(sType);
            }
            if (!sInitialized) {
                sType = i;
                init(i);
                String str = TAG;
                StringBuilder stringBuilder = new StringBuilder();
                stringBuilder.append("MiaNode: ");
                stringBuilder.append(i);
                stringBuilder.append(" has been initialized, cost :");
                stringBuilder.append(System.currentTimeMillis() - currentTimeMillis);
                Log.i(str, stringBuilder.toString());
                sInitialized = true;
            }
        }
    }

    private void deInitialize(int i) {
        synchronized (this.mObjLock) {
            if (sInitialized) {
                deInit(i);
                String str = TAG;
                StringBuilder stringBuilder = new StringBuilder();
                stringBuilder.append("MiaNode: ");
                stringBuilder.append(i);
                stringBuilder.append(" has been deInitialized");
                Log.i(str, stringBuilder.toString());
                sInitialized = false;
            }
        }
    }

    public int process(@NonNull List<FrameData> list, @NonNull Image image, int i, boolean z) {
        int processRequest;
        synchronized (this.mObjLock) {
            if (!sInitialized) {
                initialize(i);
            }
            long currentTimeMillis = System.currentTimeMillis();
            Log.d(TAG, "processRequest: start");
            processRequest = processRequest(list, image, i, z);
            String str = TAG;
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.append("processRequest: end, cost: ");
            stringBuilder.append(System.currentTimeMillis() - currentTimeMillis);
            Log.d(str, stringBuilder.toString());
            tryToCloseNode();
        }
        return processRequest;
    }
}
