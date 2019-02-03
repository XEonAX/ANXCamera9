package com.ss.android.vesdk;

import android.support.annotation.NonNull;
import android.text.TextUtils;
import com.ss.android.ttve.monitor.MonitorUtils;
import com.ss.android.ttve.nativePort.TEVideoUtils;
import com.ss.android.ttve.nativePort.TEVideoUtilsCallback;
import com.ss.android.vesdk.keyvaluepair.VEKeyValue;
import java.lang.ref.WeakReference;

public class VEUtils {
    public static int mux(String str, String str2, String str3) {
        if (TextUtils.isEmpty(str) || TextUtils.isEmpty(str2) || TextUtils.isEmpty(str3)) {
            return -100;
        }
        MonitorUtils.monitorStatistics("iesve_veutils_combine_audio_and_video_start", 1, null);
        int mux = TEVideoUtils.mux(str, str2, str3);
        VEKeyValue vEKeyValue = new VEKeyValue();
        vEKeyValue.add("iesve_veutils_combine_audio_and_video_finish_result", mux == 0 ? "succ" : "fail");
        vEKeyValue.add("iesve_veutils_combine_audio_and_video_finish_reason", "");
        MonitorUtils.monitorStatistics("iesve_veutils_combine_audio_and_video_finish", 1, vEKeyValue);
        return mux;
    }

    public static int getVideoFileInfo(@NonNull String str, @NonNull int[] iArr) {
        MonitorUtils.monitorStatistics("iesve_veutils_get_video_info", 1, null);
        return TEVideoUtils.getVideoFileInfo(str, iArr);
    }

    public static int getAudioFileInfo(@NonNull String str, @NonNull int[] iArr) {
        MonitorUtils.monitorStatistics("iesve_veutils_get_audio_info", 1, null);
        return TEVideoUtils.getAudioFileInfo(str, iArr);
    }

    public static int isCanImport(String str) {
        MonitorUtils.monitorStatistics("iesve_veutils_if_video_support_import", 1, null);
        return TEVideoUtils.isCanImport(str);
    }

    public static int getVideoFrames(@NonNull String str, @NonNull int[] iArr, @NonNull VEFrameAvailableListener vEFrameAvailableListener) {
        TEVideoUtilsCallback tEVideoUtilsCallback = new TEVideoUtilsCallback();
        tEVideoUtilsCallback.setListener(vEFrameAvailableListener);
        MonitorUtils.monitorStatistics("iesve_veutils_extract_video_frames", 1, null);
        return TEVideoUtils.getVideoFrames(str, iArr, new WeakReference(tEVideoUtilsCallback));
    }

    public static int transCodeAudio(@NonNull String str, @NonNull String str2, int i, int i2) {
        return TEVideoUtils.transCodeAudioFile(str, str2, i, i2);
    }
}
