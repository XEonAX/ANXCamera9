package com.miui.extravideo.interpolation;

import android.util.Log;
import com.miui.extravideo.BuildConfig;
import java.util.concurrent.locks.Condition;
import java.util.concurrent.locks.Lock;
import java.util.concurrent.locks.ReentrantLock;

public class VideoInterpolator {
    private static final String TAG = "VideoInterpolator";

    public static boolean doDecodeAndEncodeSync(String str, String str2) {
        return doDecodeAndEncodeSync(str, str2, true);
    }

    public static boolean doDecodeAndEncodeSync(String str, String str2, boolean z) {
        Log.d(TAG, String.format("start doDecodeAndEncode sync mode sdk version : %s", new Object[]{BuildConfig.VERSION_NAME}));
        final boolean[] zArr = new boolean[1];
        final Lock reentrantLock = new ReentrantLock();
        final Condition newCondition = reentrantLock.newCondition();
        VideoInterpolatorAsyncImp videoInterpolatorAsyncImp = new VideoInterpolatorAsyncImp(str, str2, z);
        videoInterpolatorAsyncImp.setEncodeListener(new EncodeListener() {
            public void onEncodeFinish() {
                reentrantLock.lock();
                zArr[0] = true;
                try {
                    newCondition.signal();
                } finally {
                    reentrantLock.unlock();
                }
            }

            public void onError() {
                reentrantLock.lock();
                zArr[0] = false;
                try {
                    newCondition.signal();
                } finally {
                    reentrantLock.unlock();
                }
            }
        });
        reentrantLock.lock();
        try {
            videoInterpolatorAsyncImp.doDecodeAndEncode();
            newCondition.await();
        } catch (Exception e) {
            e.printStackTrace();
            zArr[0] = false;
        } catch (Throwable th) {
            reentrantLock.unlock();
        }
        reentrantLock.unlock();
        return zArr[0];
    }

    public static void doDecodeAndEncodeAsync(String str, String str2, boolean z, EncodeListener encodeListener) {
        Log.d(TAG, String.format("start doDecodeAndEncode async mode sdk version : %s", new Object[]{BuildConfig.VERSION_NAME}));
        VideoInterpolatorAsyncImp videoInterpolatorAsyncImp = new VideoInterpolatorAsyncImp(str, str2, z);
        videoInterpolatorAsyncImp.setEncodeListener(encodeListener);
        videoInterpolatorAsyncImp.doDecodeAndEncode();
    }
}
