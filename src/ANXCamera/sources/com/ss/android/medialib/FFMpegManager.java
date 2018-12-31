package com.ss.android.medialib;

public class FFMpegManager {
    private static final String TAG = "FFMpegManager";
    private static volatile FFMpegManager mpegManager = null;
    private FFMpegInvoker mFFMpegInvoker = new FFMpegInvoker();

    public static FFMpegManager getInstance() {
        synchronized (FFMpegManager.class) {
            if (mpegManager == null) {
                synchronized (FFMpegManager.class) {
                    if (mpegManager == null) {
                        mpegManager = new FFMpegManager();
                    }
                }
            }
        }
        return mpegManager;
    }

    public int resampleCycleAudioToWav(String str, String str2, long j, long j2) {
        return this.mFFMpegInvoker.resampleCycleAudioToWav(str, str2, j, j2);
    }

    public int resampleAudioToWav(String str, String str2, long j, long j2) {
        return this.mFFMpegInvoker.resampleAudioToWav(str, str2, j, j2);
    }

    public int resampleAudioToWav2(String str, String str2, long j) {
        return this.mFFMpegInvoker.resampleAudioToWav2(str, str2, j);
    }

    public long MusicLength(String str) {
        return this.mFFMpegInvoker.MusicLength(str);
    }
}
