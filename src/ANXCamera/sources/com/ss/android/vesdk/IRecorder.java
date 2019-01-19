package com.ss.android.vesdk;

import android.graphics.Bitmap;
import android.support.annotation.NonNull;
import android.view.Surface;
import com.ss.android.medialib.listener.NativeInitListener;
import com.ss.android.medialib.model.TimeSpeedModel;
import com.ss.android.vesdk.VEListener.VERecorderStateListener;
import java.util.List;

public interface IRecorder {

    public interface OnConcatFinishedListener {
        void onConcatFinished(int i);
    }

    void chooseSlamFace(int i);

    void clearEnv();

    int concat(String str, String str2);

    void concatAsync(String str, String str2, OnConcatFinishedListener onConcatFinishedListener);

    void deleteLastFrag();

    void destroy();

    int enableTTFaceDetect(boolean z);

    long getEndFrameTime();

    List<TimeSpeedModel> getSegmentInfo();

    int getSlamFaceCount();

    int init(@NonNull VEVideoEncodeSettings vEVideoEncodeSettings, @NonNull VEAudioEncodeSettings vEAudioEncodeSettings, @NonNull VEPreviewSettings vEPreviewSettings, String str, String str2);

    int pauseEffectAudio(boolean z);

    int processTouchEvent(float f, float f2);

    int setBeautyFace(int i, String str);

    int setBeautyFaceIntensity(float f, float f2);

    int setDeviceRotation(float[] fArr);

    int setFaceReshape(String str, float f, float f2);

    int setFilter(String str, float f);

    int setFilter(String str, String str2, float f);

    void setNativeInitListener(NativeInitListener nativeInitListener);

    int setRecordBGM(String str, int i, int i2, int i3);

    void setRecordStateCallback(VERecorderStateListener vERecorderStateListener);

    void setRenderCallback(IRenderCallback iRenderCallback);

    int setSlamFace(Bitmap bitmap);

    int slamDeviceConfig(boolean z, int i, boolean z2, boolean z3, boolean z4, boolean z5, String str);

    int slamProcessIngestAcc(double d, double d2, double d3, double d4);

    int slamProcessIngestGra(double d, double d2, double d3, double d4);

    int slamProcessIngestGyr(double d, double d2, double d3, double d4);

    int slamProcessIngestOri(double[] dArr, double d);

    int slamProcessPanEvent(float f, float f2, float f3, float f4, float f5);

    int slamProcessRotationEvent(float f, float f2);

    int slamProcessScaleEvent(float f, float f2);

    int slamProcessTouchEvent(float f, float f2);

    int slamProcessTouchEventByType(int i, float f, float f2, int i2);

    int startPreview(Surface surface);

    int startRecord(String str, String str2, float f);

    int stopPreview();

    int stopRecord();

    int switchEffect(String str);

    int tryRestore();

    int updatePreviewSettings(VEPreviewSettings vEPreviewSettings);
}
