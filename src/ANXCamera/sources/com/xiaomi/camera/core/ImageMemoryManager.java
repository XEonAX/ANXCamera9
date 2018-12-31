package com.xiaomi.camera.core;

import android.media.Image;
import com.android.camera.log.Log;
import java.util.HashMap;
import java.util.Map;

public class ImageMemoryManager {
    private static final String TAG = ImageMemoryManager.class.getSimpleName();
    private static final int TOTAL_MAX_MEMORY_USAGE = 1073741824;
    private static int mUsedMemory = 0;
    private Map<Image, Integer> mImagesMap = new HashMap();
    private int mMaxHoldImageNumber;
    private final Object mObjLock = new Object();

    public ImageMemoryManager(int i) {
        this.mMaxHoldImageNumber = i;
    }

    public void holdAnImage(Image image) {
        synchronized (this.mObjLock) {
            this.mImagesMap.put(image, Integer.valueOf(getImageUsedMemory(image)));
            mUsedMemory += getImageUsedMemory(image);
            String str = TAG;
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.append("holdAnImage: ");
            stringBuilder.append(image);
            stringBuilder.append(", needCloseImageNum=");
            stringBuilder.append(this.mImagesMap.size());
            Log.d(str, stringBuilder.toString());
        }
    }

    public void releaseAnImage(Image image) {
        synchronized (this.mObjLock) {
            if (this.mImagesMap.containsKey(image)) {
                mUsedMemory -= ((Integer) this.mImagesMap.get(image)).intValue();
                this.mImagesMap.remove(image);
                this.mObjLock.notify();
                String str = TAG;
                StringBuilder stringBuilder = new StringBuilder();
                stringBuilder.append("releaseAnImage: ");
                stringBuilder.append(image);
                stringBuilder.append(", needCloseImageNum=");
                stringBuilder.append(this.mImagesMap.size());
                Log.d(str, stringBuilder.toString());
            } else {
                Log.d(TAG, "releaseAnImage: the image not contains in list");
            }
        }
    }

    public static boolean isMemoryFull() {
        return mUsedMemory > TOTAL_MAX_MEMORY_USAGE;
    }

    public boolean needWaitImageClose() {
        boolean z;
        synchronized (this.mObjLock) {
            z = true;
            if (this.mImagesMap.size() < this.mMaxHoldImageNumber - 1) {
                z = false;
            }
        }
        return z;
    }

    public void waitImageCloseIfNeeded() {
        String str = TAG;
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("waitImageCloseIfNeeded: needCloseImageNum=");
        stringBuilder.append(this.mImagesMap.size());
        Log.d(str, stringBuilder.toString());
        synchronized (this.mObjLock) {
            while (this.mImagesMap.size() >= this.mMaxHoldImageNumber - 1) {
                try {
                    Log.d(TAG, "waitImageCloseIfNeeded: wait");
                    this.mObjLock.wait();
                } catch (Throwable e) {
                    Log.w(TAG, "waitImageCloseIfNeeded: failed!", e);
                }
            }
        }
    }

    private int getImageUsedMemory(Image image) {
        int remaining = image.getPlanes()[0].getBuffer().remaining();
        int format = image.getFormat();
        if (format == 35) {
            return (int) (((double) remaining) * 1.5d);
        }
        if (format != 256) {
            return 0;
        }
        return remaining;
    }
}
