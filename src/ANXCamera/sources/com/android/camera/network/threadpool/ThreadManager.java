package com.android.camera.network.threadpool;

import android.os.Handler;
import android.os.HandlerThread;
import android.os.Looper;

public class ThreadManager {
    private static final Object sRequestLock = new Object();
    private static HandlerThread sRequestThread;
    private static Handler sRequestThreadHandler;

    public static Handler getRequestThreadHandler() {
        Handler handler;
        synchronized (sRequestLock) {
            if (sRequestThreadHandler == null) {
                sRequestThread = new HandlerThread("request_thread");
                sRequestThread.start();
                sRequestThreadHandler = new Handler(sRequestThread.getLooper());
            }
            handler = sRequestThreadHandler;
        }
        return handler;
    }

    public static Looper getRequestThreadLooper() {
        return getRequestThreadHandler().getLooper();
    }
}
