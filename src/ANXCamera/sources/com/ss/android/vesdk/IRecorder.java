package com.ss.android.vesdk;

import android.support.annotation.NonNull;
import android.view.Surface;
import com.ss.android.medialib.model.TimeSpeedModel;
import com.ss.android.vesdk.VEListener.VERecorderStateListener;
import java.util.List;

public interface IRecorder {
    void clearEnv();

    int concat(String str, String str2);

    void deleteLastFrag();

    void destroy();

    long getEndFrameTime();

    List<TimeSpeedModel> getSegmentInfo();

    int init(@NonNull VEVideoEncodeSettings vEVideoEncodeSettings, @NonNull VEAudioEncodeSettings vEAudioEncodeSettings, @NonNull VEPreviewSettings vEPreviewSettings, String str, String str2);

    int pauseEffectAudio(boolean z);

    int setBeautyFace(int i, String str);

    int setBeautyFaceIntensity(float f, float f2);

    int setDeviceRotation(float[] fArr);

    int setFaceReshape(String str, float f, float f2);

    int setFilter(String str, float f);

    int setFilter(String str, String str2, float f);

    int setRecordBGM(String str, int i, int i2, int i3);

    void setRecordStateCallback(VERecorderStateListener vERecorderStateListener);

    void setRenderCallback(IRenderCallback iRenderCallback);

    int startPreview(Surface surface);

    int startRecord(String str, String str2, float f);

    int stopPreview();

    int stopRecord();

    int switchEffect(String str);

    int tryRestore();

    int updatePreviewSettings(VEPreviewSettings vEPreviewSettings);
}
