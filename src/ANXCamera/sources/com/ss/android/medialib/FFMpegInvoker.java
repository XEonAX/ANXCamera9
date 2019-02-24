package com.ss.android.medialib;

import android.support.annotation.Keep;
import com.ss.android.medialib.NativePort.NativeLibsLoader;

@Keep
public class FFMpegInvoker {
    private native int nativeAddFastReverseVideo(String str, String str2);

    private native int nativeStopReverseVideo();

    public native long MusicLength(String str);

    public native int resampleAudioToWav(String str, String str2, long j, long j2);

    public native int resampleAudioToWav2(String str, String str2, long j);

    public native int resampleCycleAudioToWav(String str, String str2, long j, long j2);

    static {
        NativeLibsLoader.loadLibrary();
    }

    public int addFastReverseVideo(String str, String str2) {
        return nativeAddFastReverseVideo(str, str2);
    }

    public int stopReverseVideo() {
        return nativeStopReverseVideo();
    }
}
