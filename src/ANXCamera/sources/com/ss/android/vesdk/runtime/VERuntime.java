package com.ss.android.vesdk.runtime;

import android.content.Context;
import android.support.annotation.NonNull;
import android.text.TextUtils;
import android.util.Log;
import com.bef.effectsdk.EffectSDKUtils;
import com.ss.android.ttve.monitor.IMonitor;
import com.ss.android.ttve.monitor.TEMonitor;
import com.ss.android.vesdk.VEAB;
import com.ss.android.vesdk.VEListener.VEMonitorListener;
import com.ss.android.vesdk.VEResult;
import com.ss.android.vesdk.runtime.cloudconfig.DeviceInfoDetector;
import com.ss.android.vesdk.runtime.cloudconfig.PerformanceConfig;
import com.ss.android.vesdk.runtime.persistence.VESP;
import java.io.File;
import java.lang.ref.WeakReference;
import org.json.JSONObject;

public class VERuntime {
    private static final String TAG = "VERuntime";
    private VEAB mAB;
    Context mContext;
    private VEEnv mEnv;
    private boolean mIsInited;
    private IMonitor mMoniter;
    private VEResManager mResManager;
    private WeakReference<VEMonitorListener> mVEMonitorListener;

    private enum VERuntimeSingleton {
        INSTANCE;
        
        private VERuntime veRuntime;

        public VERuntime getInstance() {
            return this.veRuntime;
        }
    }

    /* synthetic */ VERuntime(AnonymousClass1 anonymousClass1) {
        this();
    }

    private VERuntime() {
        this.mIsInited = false;
        this.mMoniter = new IMonitor() {
            public void monitorLog(String str, JSONObject jSONObject) {
                if (VERuntime.this.mVEMonitorListener != null && VERuntime.this.mVEMonitorListener.get() != null) {
                    ((VEMonitorListener) VERuntime.this.mVEMonitorListener.get()).monitorLog(str, jSONObject);
                }
            }
        };
    }

    @NonNull
    public static VERuntime getInstance() {
        return VERuntimeSingleton.INSTANCE.getInstance();
    }

    @Deprecated
    public void init(@NonNull Context context, @NonNull VEEnv vEEnv) {
        if (!this.mIsInited) {
            this.mContext = context;
            this.mEnv = vEEnv;
            this.mAB = new VEAB();
            this.mResManager = new VEResManager();
            VESP.getInstance().init(context);
            TEMonitor.init();
            if ("on".equals("off")) {
                new Thread() {
                    public void run() {
                        try {
                            DeviceInfoDetector.init(VERuntime.this.mContext);
                            PerformanceConfig.restoreFromCache();
                            PerformanceConfig.fetch();
                        } catch (Throwable e) {
                            Log.e(VERuntime.TAG, "PerformanceConfig failed", e);
                        }
                    }
                }.start();
            }
        }
    }

    public void init(@NonNull Context context, @NonNull String str) {
        if (!this.mIsInited) {
            this.mIsInited = true;
            this.mContext = context;
            this.mEnv = new VEEnv();
            this.mEnv.setWorkspace(str);
            this.mAB = new VEAB();
            this.mResManager = new VEResManager();
            VESP.getInstance().init(context);
            TEMonitor.init();
            new Thread() {
                public void run() {
                    try {
                        DeviceInfoDetector.init(VERuntime.this.mContext);
                        if ("on".equals("off")) {
                            PerformanceConfig.restoreFromCache();
                            PerformanceConfig.fetch();
                        }
                    } catch (Throwable e) {
                        Log.e(VERuntime.TAG, "PerformanceConfig failed", e);
                    }
                }
            }.start();
        }
    }

    public void setEnv(@NonNull VEEnv vEEnv) {
        this.mEnv = vEEnv;
    }

    public void setAB(VEAB veab) {
        this.mAB = veab;
    }

    public VEEnv getEnv() {
        return this.mEnv;
    }

    public VEAB getAB() {
        if (this.mAB == null) {
            this.mAB = new VEAB();
        }
        return this.mAB;
    }

    public Context getContext() {
        return this.mContext;
    }

    public VEResManager getResManager() {
        return this.mResManager;
    }

    public void registerMonitor(VEMonitorListener vEMonitorListener) {
        this.mVEMonitorListener = new WeakReference(vEMonitorListener);
        TEMonitor.register(this.mMoniter);
    }

    public int updateEffectModelFiles() {
        if (this.mEnv == null || TextUtils.isEmpty(this.mEnv.getWorkspace())) {
            return VEResult.TER_INVALID_ENV;
        }
        File file = new File(this.mEnv.getWorkspace(), "models");
        if (!file.exists()) {
            file.mkdirs();
        }
        int i = 0;
        try {
            String absolutePath = file.getAbsolutePath();
            EffectSDKUtils.flushAlgorithmModelFiles(this.mContext, absolutePath);
            this.mEnv.setDetectModelsDir(absolutePath);
        } catch (Throwable th) {
            i = -1;
        }
        return i;
    }

    public int needUpdateEffectModelFiles() {
        if (this.mEnv == null || TextUtils.isEmpty(this.mEnv.getWorkspace())) {
            return VEResult.TER_INVALID_ENV;
        }
        if (EffectSDKUtils.needUpdate(this.mContext, this.mEnv.getDetectModelsDir())) {
            return 0;
        }
        return -1;
    }
}
