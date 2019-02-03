package com.android.camera.constant;

import io.reactivex.Scheduler;
import io.reactivex.schedulers.Schedulers;
import java.util.concurrent.Executors;
import java.util.concurrent.ThreadFactory;

public class GlobalConstant {
    public static final int TIME_OUT = 30000;
    public static final Scheduler sCameraSetupScheduler = Schedulers.from(Executors.newSingleThreadExecutor(new ThreadFactory() {
        public Thread newThread(Runnable runnable) {
            return new Thread(runnable, "CameraSetupSchedulerThread");
        }
    }));
}
