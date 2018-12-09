package com.android.camera.snap;

import android.annotation.TargetApi;
import android.app.job.JobInfo.Builder;
import android.app.job.JobParameters;
import android.app.job.JobScheduler;
import android.app.job.JobService;
import android.content.BroadcastReceiver;
import android.content.ComponentName;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.os.Bundle;
import android.os.Handler;
import com.android.camera.log.Log;
import com.android.camera.storage.Storage;
import java.lang.ref.WeakReference;

@TargetApi(21)
public class SnapService extends JobService {
    public static final int END = 101;
    public static final int MAX_DELAY = 5000;
    private static final String TAG = SnapService.class.getSimpleName();
    public static final int mJobId = 1;
    private final InnerHandler mHandler = new InnerHandler(this);
    private JobParameters mJobParameters;
    private BroadcastReceiver mReceiver = new BroadcastReceiver() {
        public void onReceive(Context context, Intent intent) {
            if ("android.intent.action.KEYCODE_POWER_UP".equals(intent.getAction()) || "android.intent.action.SCREEN_ON".equals(intent.getAction())) {
                SnapTrigger.getInstance().handleKeyEvent(26, 0, System.currentTimeMillis());
            }
        }
    };
    private boolean mRegistered;

    private static class InnerHandler extends Handler {
        private final WeakReference<SnapService> mService;

        public InnerHandler(SnapService snapService) {
            this.mService = new WeakReference(snapService);
        }

        /* JADX WARNING: Missing block: B:7:0x0027, code:
            return;
     */
        public void handleMessage(android.os.Message r3) {
            /*
            r2 = this;
            r0 = r2.mService;
            r0 = r0.get();
            r0 = (com.android.camera.snap.SnapService) r0;
            if (r3 == 0) goto L_0x0027;
        L_0x000a:
            if (r0 != 0) goto L_0x000d;
        L_0x000c:
            goto L_0x0027;
        L_0x000d:
            r3 = r3.what;
            r1 = 101; // 0x65 float:1.42E-43 double:5.0E-322;
            if (r3 == r1) goto L_0x0014;
        L_0x0013:
            goto L_0x0026;
        L_0x0014:
            r3 = com.android.camera.snap.SnapService.TAG;
            r1 = "stop service";
            com.android.camera.log.Log.d(r3, r1);
            r0.jobFinished();
            r0.destroy();
            r0.stopSelf();
        L_0x0026:
            return;
        L_0x0027:
            return;
            */
            throw new UnsupportedOperationException("Method not decompiled: com.android.camera.snap.SnapService.InnerHandler.handleMessage(android.os.Message):void");
        }
    }

    public static void startJob(Context context, Bundle bundle) {
        JobScheduler jobScheduler = (JobScheduler) context.getSystemService("jobscheduler");
        jobScheduler.cancel(1);
        Builder builder = new Builder(1, new ComponentName(context, SnapService.class));
        builder.setTransientExtras(bundle).setOverrideDeadline(0);
        jobScheduler.schedule(builder.build());
    }

    private void jobFinished() {
        jobFinished(this.mJobParameters, false);
    }

    private void destroy() {
        unregisterPowerKeyReceiver();
        this.mHandler.removeMessages(101);
        SnapTrigger.destroy();
    }

    public boolean onStartJob(JobParameters jobParameters) {
        Log.d(TAG, "onStartJob");
        this.mJobParameters = jobParameters;
        Bundle transientExtras = jobParameters.getTransientExtras();
        Storage.initStorage(this);
        triggerWatchdog();
        if (SnapTrigger.getInstance().init(this, this.mHandler)) {
            SnapTrigger.getInstance().handleKeyEvent(transientExtras.getInt(SnapKeyReceiver.KEY_CODE, 0), transientExtras.getInt(SnapKeyReceiver.KEY_ACTION, 0), transientExtras.getLong(SnapKeyReceiver.KEY_EVENT_TIME, 0));
            registerPowerKeyReceiver();
        }
        return true;
    }

    public boolean onStopJob(JobParameters jobParameters) {
        Log.d(TAG, "onStopJob");
        destroy();
        return false;
    }

    private void triggerWatchdog() {
        this.mHandler.removeMessages(101);
        this.mHandler.sendEmptyMessageDelayed(101, 5000);
    }

    public void onDestroy() {
        super.onDestroy();
        destroy();
    }

    private void registerPowerKeyReceiver() {
        if (!this.mRegistered) {
            IntentFilter intentFilter = new IntentFilter();
            intentFilter.addAction("android.intent.action.SCREEN_ON");
            intentFilter.addAction("android.intent.action.KEYCODE_POWER_UP");
            registerReceiver(this.mReceiver, intentFilter);
            this.mRegistered = true;
        }
    }

    private void unregisterPowerKeyReceiver() {
        if (this.mRegistered) {
            unregisterReceiver(this.mReceiver);
            this.mRegistered = false;
        }
    }
}
