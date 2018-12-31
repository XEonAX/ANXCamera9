package com.android.camera.constant;

import io.reactivex.Scheduler;
import io.reactivex.schedulers.Schedulers;
import java.util.concurrent.Executors;

public class GlobalConstant {
    public static final int TIME_OUT = 30000;
    public static final Scheduler sCameraSetupScheduler = Schedulers.from(Executors.newSingleThreadExecutor());
}
