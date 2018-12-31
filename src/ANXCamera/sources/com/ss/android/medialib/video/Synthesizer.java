package com.ss.android.medialib.video;

import android.support.annotation.Keep;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.support.annotation.WorkerThread;
import android.text.TextUtils;
import com.ss.android.medialib.NativePort.NativeLibsLoader;
import com.ss.android.medialib.listener.ProgressListener;
import java.io.File;

@Keep
public class Synthesizer {
    private long handle;
    private ProgressListener progressListener;

    private native void nativeCancel(long j);

    private native long nativeCreate();

    private native void nativeDestroy(long j);

    private native int nativeSynVideo(long j, String str, String str2, String str3);

    static {
        NativeLibsLoader.loadLibrary();
    }

    public Synthesizer() {
        this.handle = 0;
        this.handle = nativeCreate();
    }

    public void setProgressListener(ProgressListener progressListener) {
        this.progressListener = progressListener;
    }

    @WorkerThread
    public int synVideo(@NonNull String str, @NonNull String str2, @Nullable String str3) {
        if (this.handle == 0) {
            return -100;
        }
        if (TextUtils.isEmpty(str) || TextUtils.isEmpty(str2) || TextUtils.isEmpty(str3)) {
            return -102;
        }
        if (!new File(str2).exists() || !new File(str3).exists()) {
            return -101;
        }
        return nativeSynVideo(this.handle, str, str2, str3);
    }

    public void cancel() {
        if (this.handle != 0) {
            nativeCancel(this.handle);
        }
    }

    public void destroy() {
        if (this.handle != 0) {
            nativeDestroy(this.handle);
            this.handle = 0;
        }
    }

    public void onProgress(int i) {
        if (this.progressListener != null) {
            this.progressListener.onProgress(i);
        }
    }
}
