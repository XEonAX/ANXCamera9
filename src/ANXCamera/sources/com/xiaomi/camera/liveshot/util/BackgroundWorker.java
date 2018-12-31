package com.xiaomi.camera.liveshot.util;

import android.os.Looper;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

public class BackgroundWorker {
    private static final int SHUTDOWN_TIMEOUT_MILLISECONDS = 2000;
    private final ExecutorService mExecutor = Executors.newSingleThreadExecutor();
    private final Object mLock = new Object();
    private Looper mLooper;
    private volatile boolean mReady = false;

    public BackgroundWorker(final String str) {
        this.mExecutor.execute(new Runnable() {
            public void run() {
                Thread.currentThread().setName(str);
                Looper.prepare();
                BackgroundWorker.this.mLooper = Looper.myLooper();
                synchronized (BackgroundWorker.this.mLock) {
                    BackgroundWorker.this.mReady = true;
                    BackgroundWorker.this.mLock.notifyAll();
                }
                Looper.loop();
                synchronized (BackgroundWorker.this.mLock) {
                    BackgroundWorker.this.mReady = false;
                }
            }
        });
    }

    public Looper getLooper() {
        waitUntilReady();
        return this.mLooper;
    }

    public void quit() throws InterruptedException {
        waitUntilReady();
        this.mLooper.quitSafely();
        this.mExecutor.shutdown();
    }

    private void waitUntilReady() {
        synchronized (this.mLock) {
            while (!this.mReady) {
                try {
                    this.mLock.wait();
                } catch (InterruptedException e) {
                }
            }
        }
    }
}
