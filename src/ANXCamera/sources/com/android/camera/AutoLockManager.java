package com.android.camera;

import android.content.Context;
import android.content.Intent;
import android.os.Handler;
import android.os.HandlerThread;
import android.os.Message;
import android.os.SystemProperties;
import android.provider.Settings.SettingNotFoundException;
import android.provider.Settings.System;
import com.android.camera.log.Log;
import com.mi.config.b;
import java.util.WeakHashMap;

public class AutoLockManager {
    public static int HIBERNATION_TIMEOUT = 3;
    private static long MILLIS_IN_MINUTE = 60000;
    private static final int MSG_HIBERNATE = 1;
    private static final int MSG_LOCK_SCREEN = 0;
    private static final String TAG = AutoLockManager.class.getSimpleName();
    private static WeakHashMap<Context, AutoLockManager> sMap = new WeakHashMap();
    private boolean mCameraAlwaysKeepScreenOn = false;
    private Context mContext;
    private Handler mHandler;
    private long mHibernationTimeOut;
    private boolean mPaused;
    private long mScreenOffTimeOut = 15000;

    private AutoLockManager(Context context) {
        this.mContext = context;
        int i = SystemProperties.getInt("camera.debug.hibernation_timeout_seconds", 0);
        this.mCameraAlwaysKeepScreenOn = SystemProperties.getBoolean("camera_always_keep_screen_on", false);
        if (i > 0) {
            this.mHibernationTimeOut = 1000 * ((long) i);
        } else {
            this.mHibernationTimeOut = MILLIS_IN_MINUTE * ((long) b.gH());
        }
        String str = TAG;
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("mHibernationTimeOut = ");
        stringBuilder.append(this.mHibernationTimeOut);
        stringBuilder.append(", mScreenOffTimeOut = ");
        stringBuilder.append(this.mScreenOffTimeOut);
        Log.v(str, stringBuilder.toString());
        updateScreenOffTimeout(context);
    }

    private void updateScreenOffTimeout(Context context) {
        try {
            this.mScreenOffTimeOut = (long) System.getInt(context.getContentResolver(), "screen_off_timeout");
        } catch (SettingNotFoundException e) {
            Log.e(TAG, e.getMessage());
        }
    }

    public static AutoLockManager getInstance(Context context) {
        AutoLockManager autoLockManager = (AutoLockManager) sMap.get(context);
        if (autoLockManager != null) {
            return autoLockManager;
        }
        autoLockManager = new AutoLockManager(context);
        sMap.put(context, autoLockManager);
        return autoLockManager;
    }

    public static void removeInstance(Context context) {
        AutoLockManager autoLockManager = (AutoLockManager) sMap.remove(context);
        if (autoLockManager != null && autoLockManager.mHandler != null) {
            autoLockManager.mHandler.getLooper().quit();
        }
    }

    public void onPause() {
        this.mPaused = true;
        removeMessage();
    }

    public void onResume() {
        this.mPaused = false;
        updateScreenOffTimeout(this.mContext);
    }

    public void onUserInteraction() {
        hibernateDelayed();
    }

    private void initHandler() {
        if (this.mHandler == null) {
            HandlerThread handlerThread = new HandlerThread("my_handler_thread");
            handlerThread.start();
            this.mHandler = new Handler(handlerThread.getLooper()) {
                public void dispatchMessage(Message message) {
                    if (message.what == 0) {
                        AutoLockManager.this.lockScreen();
                    } else if (1 == message.what) {
                        AutoLockManager.this.hibernate();
                    }
                }
            };
        }
    }

    private void hibernate() {
        if (!this.mPaused) {
            ((Camera) this.mContext).onHibernate();
        }
    }

    private void lockScreen() {
        if (!this.mPaused) {
            this.mContext.sendBroadcast(new Intent("com.miui.app.ExtraStatusBarManager.TRIGGER_TOGGLE_LOCK"));
        }
    }

    public void removeMessage() {
        if (this.mHandler != null) {
            this.mHandler.removeCallbacksAndMessages(null);
            Log.v(TAG, "removeMessage");
        }
    }

    public void lockScreenDelayed() {
        initHandler();
        if (this.mHandler != null) {
            this.mHandler.removeMessages(0);
        }
        String str = TAG;
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("lockScreenDelayed: ");
        stringBuilder.append(this.mScreenOffTimeOut);
        Log.d(str, stringBuilder.toString());
        this.mHandler.sendEmptyMessageDelayed(0, this.mScreenOffTimeOut);
    }

    /* JADX WARNING: Missing block: B:16:0x0065, code:
            return;
     */
    public void hibernateDelayed() {
        /*
        r4 = this;
        r0 = r4.mCameraAlwaysKeepScreenOn;
        if (r0 != 0) goto L_0x0065;
    L_0x0004:
        r0 = r4.mPaused;
        if (r0 == 0) goto L_0x0009;
    L_0x0008:
        goto L_0x0065;
    L_0x0009:
        r0 = r4.mHibernationTimeOut;
        r2 = r4.mScreenOffTimeOut;
        r0 = (r0 > r2 ? 1 : (r0 == r2 ? 0 : -1));
        if (r0 < 0) goto L_0x0012;
    L_0x0011:
        return;
    L_0x0012:
        r4.initHandler();
        r0 = r4.mHandler;
        if (r0 == 0) goto L_0x0064;
    L_0x0019:
        r0 = r4.mHandler;
        r1 = 1;
        r0.removeMessages(r1);
        r0 = r4.mContext;
        r0 = (com.android.camera.Camera) r0;
        r2 = r0.isVideoRecording();
        if (r2 != 0) goto L_0x003e;
    L_0x0029:
        r2 = r0.isPanoramaRecording();
        if (r2 != 0) goto L_0x003e;
    L_0x002f:
        r0 = r4.mHandler;
        r2 = r4.mHibernationTimeOut;
        r0.sendEmptyMessageDelayed(r1, r2);
        r0 = TAG;
        r1 = "send MSG_HIBERNATE";
        com.android.camera.log.Log.v(r0, r1);
        goto L_0x0064;
    L_0x003e:
        r1 = TAG;
        r2 = new java.lang.StringBuilder;
        r2.<init>();
        r3 = "isVideoRecording = ";
        r2.append(r3);
        r3 = r0.isVideoRecording();
        r2.append(r3);
        r3 = ", isPanoramaRecording = ";
        r2.append(r3);
        r0 = r0.isPanoramaRecording();
        r2.append(r0);
        r0 = r2.toString();
        com.android.camera.log.Log.w(r1, r0);
    L_0x0064:
        return;
    L_0x0065:
        return;
        */
        throw new UnsupportedOperationException("Method not decompiled: com.android.camera.AutoLockManager.hibernateDelayed():void");
    }
}
