package com.xiaomi.engine;

import android.support.annotation.NonNull;
import android.util.Log;

public class TaskSession {
    private static final boolean DEBUG = false;
    private static final String TAG = TaskSession.class.getSimpleName();
    private boolean mHasDestroyed;
    private boolean mHasFlushed;
    private final int mMaxTaskNumber;
    private final Object mObjLock = new Object();
    private int mRunningTaskNumber;
    private final long mSessionHandle;

    @FunctionalInterface
    public interface FrameCallback {
        void onFrameProcessed(int i, String str, Object obj);
    }

    @FunctionalInterface
    public interface SessionStatusCallback {
        void onSessionCallback(int i, String str, Object obj);
    }

    TaskSession(long j, int i) {
        this.mSessionHandle = j;
        this.mMaxTaskNumber = i;
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
        stringBuilder.append("close: session has closed: ");
        stringBuilder.append(this);
        Log.d(str, stringBuilder.toString());
    }

    public boolean isBusy() {
        boolean z;
        synchronized (this.mObjLock) {
            z = this.mRunningTaskNumber >= this.mMaxTaskNumber;
        }
        return z;
    }

    public void waitIfBusy() {
        synchronized (this.mObjLock) {
            while (this.mRunningTaskNumber >= this.mMaxTaskNumber) {
                try {
                    Log.w(TAG, "waitIfBusy: start");
                    this.mObjLock.wait();
                    Log.w(TAG, "waitIfBusy: end");
                } catch (Throwable e) {
                    Log.e(TAG, e.getMessage(), e);
                }
            }
        }
    }

    public void onTaskStart(int i) {
        synchronized (this.mObjLock) {
            this.mRunningTaskNumber += i;
            String str = TAG;
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.append("onTaskStart: taskNum=");
            stringBuilder.append(this.mRunningTaskNumber);
            Log.d(str, stringBuilder.toString());
        }
    }

    public void onTaskFinish(int i) {
        synchronized (this.mObjLock) {
            this.mRunningTaskNumber -= i;
            if (this.mRunningTaskNumber < 0) {
                this.mRunningTaskNumber = 0;
            }
            String str = TAG;
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.append("onTaskFinish: taskNum=");
            stringBuilder.append(this.mRunningTaskNumber);
            Log.d(str, stringBuilder.toString());
            this.mObjLock.notify();
        }
    }

    protected void finalize() throws Throwable {
        close();
        super.finalize();
    }

    private void destroy() {
        if (!this.mHasDestroyed) {
            int destroySession = MiCamAlgoInterfaceJNI.destroySession(this.mSessionHandle);
            Util.assertOrNot(destroySession);
            if (destroySession == 0) {
                this.mHasDestroyed = true;
            }
        }
    }

    private void flush() {
        if (!this.mHasFlushed) {
            int flush = MiCamAlgoInterfaceJNI.flush(this.mSessionHandle);
            Util.assertOrNot(flush);
            if (flush == 0) {
                this.mHasFlushed = true;
            }
        }
    }
}
