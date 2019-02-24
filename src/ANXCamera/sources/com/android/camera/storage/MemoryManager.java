package com.android.camera.storage;

import com.android.camera.Util;
import com.android.camera.log.Log;
import com.android.camera.storage.Storage.StorageListener;
import com.mi.config.b;

public class MemoryManager implements StorageListener {
    private static final int DELAY_SECTION = 100;
    private static final float MAX_MEMORY_LIMIT_RATIO = 0.95f;
    public static final float MTK_SPEED_DOWN_RATIO = 0.66f;
    private static final long ONE_MB = 1048576;
    private static final float PHONE_SAVE_TASK_MEMORY_LIMIT_RATIO = 0.6f;
    private static final float SAVE_QUEUE_MEMORY_RATIO = 1.3f;
    private static final int SDCARD_SAVE_TASK_MEMORY_LIMIT = 62914560;
    private static final float SDCARD_SAVE_TASK_MEMORY_LIMIT_RATIO = 0.5f;
    private static final String TAG = "CameraMemoryManager";
    private long mMaxMemory;
    private int mMaxTotalMemory;
    private Runtime mRuntime = Runtime.getRuntime();
    private int mSaveTaskMemoryLimit;
    private int mSavedQueueMemoryLimit;
    private int mSaverMemoryUse;

    public void initMemory() {
        this.mMaxMemory = this.mRuntime.maxMemory();
        this.mMaxTotalMemory = (int) (((float) this.mMaxMemory) * MAX_MEMORY_LIMIT_RATIO);
        this.mSaverMemoryUse = 0;
        initLimit();
        Storage.setStorageListener(this);
        String str = TAG;
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("initMemory: maxMemory=");
        stringBuilder.append(this.mMaxMemory);
        Log.d(str, stringBuilder.toString());
    }

    private void initLimit() {
        long baseMemory = this.mMaxMemory - getBaseMemory();
        if (Storage.isUsePhoneStorage()) {
            this.mSaveTaskMemoryLimit = (int) (((float) baseMemory) * 0.6f);
        } else {
            this.mSaveTaskMemoryLimit = (int) (((float) baseMemory) * 0.5f);
            if (SDCARD_SAVE_TASK_MEMORY_LIMIT < this.mSaveTaskMemoryLimit) {
                this.mSaveTaskMemoryLimit = SDCARD_SAVE_TASK_MEMORY_LIMIT;
            }
        }
        this.mSavedQueueMemoryLimit = (int) (((float) this.mSaveTaskMemoryLimit) * SAVE_QUEUE_MEMORY_RATIO);
        String str = TAG;
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("initLimit: mSavedQueueMemoryLimit = ");
        stringBuilder.append(this.mSavedQueueMemoryLimit);
        Log.d(str, stringBuilder.toString());
    }

    private long getBaseMemory() {
        int i = Util.sWindowWidth;
        if (i == Util.LIMIT_SURFACE_WIDTH) {
            return 20971520;
        }
        if (i == 1080) {
            return 41943040;
        }
        if (i != 1440) {
            return this.mRuntime.totalMemory() - this.mRuntime.freeMemory();
        }
        return 62914560;
    }

    public void addUsedMemory(int i) {
        this.mSaverMemoryUse += i;
    }

    public void reduceUsedMemory(int i) {
        this.mSaverMemoryUse -= i;
    }

    public int getBurstDelay() {
        int i = 3;
        if (!isNeedSlowDown()) {
            i = 0;
        } else if (this.mSaverMemoryUse >= (this.mSaveTaskMemoryLimit * 7) / 8) {
            i = 8;
        } else if (this.mSaverMemoryUse >= (this.mSaveTaskMemoryLimit * 5) / 6) {
            i = 5;
        } else if (this.mSaverMemoryUse >= (this.mSaveTaskMemoryLimit * 4) / 5) {
            i = 4;
        } else if (this.mSaverMemoryUse < (this.mSaveTaskMemoryLimit * 3) / 4) {
            i = 1;
        }
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("getBurstDelay: delayMultiple=");
        stringBuilder.append(i);
        log(stringBuilder.toString());
        return i * 100;
    }

    private int getTotalUsedMemory() {
        long totalMemory = this.mRuntime.totalMemory();
        long freeMemory = this.mRuntime.freeMemory();
        long j = totalMemory - freeMemory;
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("getLeftMemory: maxMemory=");
        stringBuilder.append(this.mMaxMemory);
        stringBuilder.append(", total=");
        stringBuilder.append(totalMemory);
        stringBuilder.append(", free=");
        stringBuilder.append(freeMemory);
        stringBuilder.append(", totalUsed=");
        stringBuilder.append(j);
        log(stringBuilder.toString());
        return (int) j;
    }

    public synchronized boolean isSaveQueueFull() {
        boolean z;
        z = this.mSaverMemoryUse >= this.mSavedQueueMemoryLimit;
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("isSaveQueueFull = ");
        stringBuilder.append(z);
        stringBuilder.append(", usedMemory=");
        stringBuilder.append(this.mSaverMemoryUse);
        stringBuilder.append(", limit = ");
        stringBuilder.append(this.mSavedQueueMemoryLimit);
        log(stringBuilder.toString());
        return z;
    }

    private boolean isReachedMemoryLimit() {
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("isReachedMemoryLimit: usedMemory=");
        stringBuilder.append(this.mSaverMemoryUse);
        log(stringBuilder.toString());
        return this.mSaverMemoryUse >= this.mSaveTaskMemoryLimit;
    }

    public boolean isNeedStopCapture() {
        if (!isReachedMemoryLimit() && this.mMaxTotalMemory > getTotalUsedMemory() && Storage.getLeftSpace() > ((long) this.mSaverMemoryUse)) {
            return false;
        }
        String str = TAG;
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("isNeedStopCapture: needStop=");
        stringBuilder.append(true);
        Log.d(str, stringBuilder.toString());
        return true;
    }

    public boolean isNeedSlowDown() {
        boolean z = false;
        if (b.isMTKPlatform() ? this.mSaverMemoryUse < (this.mSaveTaskMemoryLimit * 3) / 4 : this.mSaverMemoryUse < this.mSaveTaskMemoryLimit / 2) {
            z = true;
        }
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("isNeedSlowDown: return ");
        stringBuilder.append(z);
        stringBuilder.append(" mSaverMemoryUse=");
        stringBuilder.append(this.mSaverMemoryUse);
        stringBuilder.append(" mSaveTaskMemoryLimit=");
        stringBuilder.append(this.mSaveTaskMemoryLimit);
        log(stringBuilder.toString());
        return z;
    }

    private void log(String str) {
        if (Util.sIsDumpLog) {
            Log.v(TAG, str);
        }
    }

    public void onStoragePathChanged() {
        initMemory();
    }
}
