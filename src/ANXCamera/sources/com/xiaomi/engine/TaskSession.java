package com.xiaomi.engine;

import android.support.annotation.NonNull;
import android.util.Log;

public class TaskSession {
    private static final boolean DEBUG = false;
    private static final String TAG = TaskSession.class.getSimpleName();
    private boolean hasDestroyed;
    private boolean hasFlushed;
    private final long mSessionHandle;

    @FunctionalInterface
    public interface FrameCallback {
        void onFrameProcessed(int i, String str, Object obj);
    }

    @FunctionalInterface
    public interface SessionStatusCallback {
        void onSessionCallback(int i, String str, Object obj);
    }

    TaskSession(long j) {
        this.mSessionHandle = j;
    }

    public void processFrame(@NonNull FrameData frameData, FrameCallback frameCallback) {
        String str = TAG;
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("processFrame: ");
        stringBuilder.append(frameData.toString());
        Log.d(str, stringBuilder.toString());
        int processFrame = MiCamAlgoInterfaceJNI.processFrame(this.mSessionHandle, frameData, frameCallback);
        if (processFrame == 0) {
            frameCallback.onFrameProcessed(processFrame, "onProcessStarted", null);
        } else {
            Util.assertOrNot(processFrame);
        }
    }

    public void close() {
        flush();
        destroy();
        String str = TAG;
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("close: session has closed : ");
        stringBuilder.append(this);
        Log.d(str, stringBuilder.toString());
    }

    protected void finalize() throws Throwable {
        close();
        super.finalize();
    }

    private void destroy() {
        if (!this.hasDestroyed) {
            int destroySession = MiCamAlgoInterfaceJNI.destroySession(this.mSessionHandle);
            Util.assertOrNot(destroySession);
            if (destroySession == 0) {
                this.hasDestroyed = true;
            }
        }
    }

    private void flush() {
        if (!this.hasFlushed) {
            int flush = MiCamAlgoInterfaceJNI.flush(this.mSessionHandle);
            Util.assertOrNot(flush);
            if (flush == 0) {
                this.hasFlushed = true;
            }
        }
    }
}
