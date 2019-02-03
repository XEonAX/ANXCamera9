package com.android.camera;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.support.annotation.WorkerThread;
import android.text.TextUtils;
import com.android.camera.log.Log;
import com.android.camera.protocol.ModeCoordinatorImpl;
import com.android.camera.protocol.ModeProtocol.ConfigChanges;
import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStreamReader;

public class ThermalDetector {
    public static String ACTION_TEMP_CHANGED = "action_temp_state_change";
    public static String EXTRA_TEMP_STAGE = "temp_state";
    public static final int GETSTAGE_CLOSE_BOTH = 3;
    public static final int STAGE_CLOSE_FRONT = 2;
    public static final int STAGE_CONTRAINT = 1;
    public static final int STAGE_FREE = 0;
    public static final int STAGE_INVALID = -1;
    private static final String TAG = ThermalDetector.class.getSimpleName();
    public static String TEMP_STAGE_NODE = "/sys/class/thermal/thermal_message/temp_state";
    private Context mContext;
    private IntentFilter mFilter;
    private boolean mIsRegister;
    private BroadcastReceiver mReceiver;
    private volatile int mTempStage;

    private static class InstanceHolder {
        private static ThermalDetector sInstance = new ThermalDetector();

        private InstanceHolder() {
        }
    }

    /* synthetic */ ThermalDetector(AnonymousClass1 anonymousClass1) {
        this();
    }

    public static ThermalDetector getInstance() {
        return InstanceHolder.sInstance;
    }

    private ThermalDetector() {
        this.mTempStage = 0;
        this.mIsRegister = false;
        this.mFilter = new IntentFilter(ACTION_TEMP_CHANGED);
        this.mReceiver = new BroadcastReceiver() {
            public void onReceive(Context context, Intent intent) {
                if (intent != null && TextUtils.equals(intent.getAction(), ThermalDetector.ACTION_TEMP_CHANGED)) {
                    ThermalDetector.this.mTempStage = intent.getIntExtra(ThermalDetector.EXTRA_TEMP_STAGE, -1);
                    String access$300 = ThermalDetector.TAG;
                    StringBuilder stringBuilder = new StringBuilder();
                    stringBuilder.append("onReceive stage = ");
                    stringBuilder.append(ThermalDetector.this.mTempStage);
                    Log.d(access$300, stringBuilder.toString());
                    ThermalDetector.this.onThermalNotification(ThermalDetector.this.mTempStage);
                }
            }
        };
    }

    @WorkerThread
    public void onCreate(Context context) {
        this.mContext = context.getApplicationContext();
    }

    public void onDestroy() {
        this.mContext = null;
    }

    public void registerReceiver() {
        if (!(this.mContext == null || this.mIsRegister)) {
            this.mContext.registerReceiver(this.mReceiver, this.mFilter);
            this.mIsRegister = true;
        }
    }

    public void unregisterReceiver() {
        if (this.mContext != null && this.mIsRegister) {
            this.mContext.unregisterReceiver(this.mReceiver);
            this.mIsRegister = false;
        }
    }

    public static boolean thermalConstrained(int i) {
        return i == 1;
    }

    public boolean thermalConstrained() {
        return this.mTempStage == 1;
    }

    public static boolean isTempStageFree(int i) {
        return i == 0 || i == -1;
    }

    private static int readStageFromFile() {
        String stringBuffer;
        int parseInt;
        String str;
        StringBuilder stringBuilder;
        String str2 = "";
        BufferedReader bufferedReader;
        try {
            bufferedReader = new BufferedReader(new InputStreamReader(new FileInputStream(new File(TEMP_STAGE_NODE))));
            StringBuffer stringBuffer2 = new StringBuffer();
            while (true) {
                String readLine = bufferedReader.readLine();
                if (readLine == null) {
                    break;
                }
                stringBuffer2.append(readLine);
            }
            stringBuffer = stringBuffer2.toString();
            try {
                bufferedReader.close();
            } catch (IOException e) {
            }
        } catch (IOException e2) {
            stringBuffer = str2;
            Log.e(TAG, "readStageFromFile IOException");
            parseInt = Integer.parseInt(stringBuffer);
            str = TAG;
            stringBuilder = new StringBuilder();
            stringBuilder.append("readStageFromFile value = ");
            stringBuilder.append(parseInt);
            Log.d(str, stringBuilder.toString());
            if (parseInt >= 0) {
            }
            return 0;
        } catch (Throwable th) {
            r2.addSuppressed(th);
        }
        try {
            parseInt = Integer.parseInt(stringBuffer);
            str = TAG;
            stringBuilder = new StringBuilder();
            stringBuilder.append("readStageFromFile value = ");
            stringBuilder.append(parseInt);
            Log.d(str, stringBuilder.toString());
            if (parseInt >= 0 || parseInt > 3) {
                return 0;
            }
            return parseInt;
        } catch (Throwable th2) {
            Log.d(TAG, "failed to readStageFromFile ", th2);
            return 0;
        }
    }

    private void onThermalNotification(int i) {
        ConfigChanges configChanges = (ConfigChanges) ModeCoordinatorImpl.getInstance().getAttachProtocol(164);
        if (configChanges == null) {
            Log.w(TAG, "onThermalNotification config is null");
            return;
        }
        try {
            configChanges.onThermalNotification(i);
        } catch (Throwable e) {
            Log.w(TAG, "onThermalNotification error", e);
        }
    }

    public void onThermalNotification() {
        onThermalNotification(this.mTempStage);
    }
}
