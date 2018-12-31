package com.ss.android.medialib;

import android.support.annotation.Keep;
import com.ss.android.medialib.NativePort.NativeLibsLoader;

@Keep
public class FFMpegInvoker {
    public native long MusicLength(String str);

    public native int resampleAudioToWav(String str, String str2, long j, long j2);

    public native int resampleAudioToWav2(String str, String str2, long j);

    public native int resampleCycleAudioToWav(String str, String str2, long j, long j2);

    static {
        NativeLibsLoader.loadLibrary();
    }
}
