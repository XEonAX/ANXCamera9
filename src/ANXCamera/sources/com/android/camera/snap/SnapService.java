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
import android.os.Message;
import com.android.camera.log.Log;
import com.android.camera.storage.Storage;
import java.lang.ref.WeakReference;

@TargetApi(21)
public class SnapService extends JobService {
    public static final int END = 101;
    public static final int MAX_DELAY = 5000;
    private static final String TAG = SnapService.class.getSimpleName();
    public static final int mJobId = 1;
    private static JobScheduler mJobScheduler;
    private static boolean mScreenOn;
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

        /* JADX WARNING: Missing block: B:10:0x0031, code:
            return;
     */
        /* Code decompiled incorrectly, please refer to instructions dump. */
        public void handleMessage(Message message) {
            SnapService snapService = (SnapService) this.mService.get();
            if (!(message == null || snapService == null || message.what != 101)) {
                Log.d(SnapService.TAG, "stop service");
                if (SnapService.mJobScheduler != null) {
                    SnapService.mJobScheduler.cancelAll();
                }
                snapService.destroy();
                snapService.stopSelf();
            }
        }
    }

    public static void startJob(Context context, Bundle bundle) {
        mScreenOn = false;
        mJobScheduler = (JobScheduler) context.getSystemService("jobscheduler");
        Builder builder = new Builder(1, new ComponentName(context, SnapService.class));
        builder.setTransientExtras(bundle).setOverrideDeadline(0);
        mJobScheduler.schedule(builder.build());
    }

    public static void setScreenOn(boolean z) {
        mScreenOn = z;
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
        if (mScreenOn) {
            return false;
        }
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
