package com.ss.android.ttve.nativePort;

import android.support.annotation.Keep;
import android.support.annotation.Nullable;
import android.text.TextUtils;
import android.view.Surface;
import com.android.camera.ui.drawable.PanoramaArrowAnimateDrawable;
import com.ss.android.vesdk.VEException;
import com.ss.android.vesdk.VERect;
import com.ss.android.vesdk.VEResult;
import com.ss.android.vesdk.VEStickerAnimator;
import com.ss.android.vesdk.VEWatermarkParam;

@Keep
public final class TEInterface extends TENativeServiceBase {
    private static final int OPTION_UPDATE_ANYTIME = 1;
    private static final int OPTION_UPDATE_BEFORE_PREPARE = 0;
    private static final String TAG = "TEInterface";
    private int mHostTrackIndex = -1;
    private long mNative = 0;

    private native int nativeAddAudioTrack(long j, String str, int i, int i2, int i3, int i4, boolean z);

    private native int nativeAddAudioTrack2(long j, String str, int i, int i2, int i3, int i4, boolean z, int i5, int i6);

    private native int nativeAddExternalTrack(long j, String[] strArr, String[] strArr2, int[] iArr, int[] iArr2, int[] iArr3, int[] iArr4, double d, double d2, double d3, double d4, int i, int i2);

    private native int[] nativeAddFilters(long j, int[] iArr, String[] strArr, int[] iArr2, int[] iArr3, int[] iArr4, int[] iArr5);

    private native int nativeAddInfoSticker(long j, String str, String[] strArr);

    private native void nativeAddMetaData(long j, String str, String str2);

    private native int nativeAdjustFilterInOut(long j, int i, int i2, int i3);

    private native void nativeClearDisplay(long j, int i);

    private native long nativeCreateEngine();

    private native int nativeCreateScene(long j, String str, String[] strArr, String[] strArr2, String[] strArr3, String[][] strArr4, int i);

    private native int nativeCreateScene2(long j, String[] strArr, int[] iArr, int[] iArr2, String[] strArr2, int[] iArr3, int[] iArr4, String[] strArr3, String[][] strArr4, int i);

    private native int nativeCreateTimeline(long j);

    private native int nativeDeleteAudioTrack(long j, int i);

    private native int nativeDeleteExternalTrack(long j, int i);

    private native int nativeDestroyEngine(long j);

    private native int nativeGetCurPosition(long j);

    private native int nativeGetCurState(long j);

    private native int[] nativeGetDisplayDumpSize(long j);

    private native int nativeGetDisplayImage(long j, byte[] bArr);

    private native int nativeGetDuration(long j);

    private native int nativeGetExternalTrackFilter(long j, int i);

    private native float[] nativeGetInfoStickerBoundingBox(long j, int i);

    private native int[] nativeGetInitResolution(long j);

    private native float nativeGetTrackVolume(long j, int i, int i2, int i3);

    private native int nativePause(long j);

    private native int nativePauseSync(long j);

    private native int nativePrepareEngine(long j, int i, int i2, int i3, String str);

    private native void nativeReleasePreviewSurface(long j);

    private native int nativeRemoveFilter(long j, int[] iArr);

    private native int nativeRemoveInfoSticker(long j, int i);

    private native int nativeRestore(long j, String str);

    private native String nativeSave(long j);

    private native int nativeSeek(long j, int i, int i2, int i3, int i4);

    private native void nativeSetBackGroundColor(long j, float f, float f2, float f3, float f4);

    private native void nativeSetDisplayState(long j, float f, float f2, float f3, float f4, int i, int i2, int i3);

    private native void nativeSetExpandLastFrame(long j, boolean z);

    private native int nativeSetFilterParam(long j, int i, String str, VEStickerAnimator vEStickerAnimator);

    private native int nativeSetFilterParam(long j, int i, String str, String str2);

    private native void nativeSetOption(long j, int i, String str, float f);

    private native void nativeSetOption(long j, int i, String str, long j2);

    private native void nativeSetOption(long j, int i, String str, String str2);

    private native void nativeSetOptionArray(long j, int i, String[] strArr, long[] jArr);

    private native int nativeSetPreviewScaleMode(long j, int i);

    private native void nativeSetPreviewSurface(long j, Surface surface);

    private native void nativeSetSpeedRatio(long j, float f);

    private native void nativeSetSurfaceSize(long j, int i, int i2);

    private native boolean nativeSetTrackVolume(long j, int i, int i2, float f);

    private native void nativeSetViewPort(long j, int i, int i2, int i3, int i4);

    private native void nativeSetWaterMark(long j, String[] strArr, int i, int i2, int i3, int i4, int i5);

    private native int nativeStart(long j);

    private native int nativeStop(long j);

    private native boolean nativeTestSerialization(long j);

    private native int nativeUpdateAudioTrack(long j, int i, int i2, int i3, int i4, int i5, boolean z);

    private native int nativeUpdateAudioTrack2(long j, int i, int i2, int i3, int i4, int i5, boolean z, int i6, int i7);

    private native int nativeUpdateTrackClip(long j, int i, int i2, String[] strArr);

    private native int nativeUpdateTrackFilter(long j, int i, int i2, boolean z);

    public native String stringFromJNI();

    static {
        TENativeLibsLoader.loadLibrary();
    }

    private TEInterface() {
    }

    public static TEInterface createEngine() {
        TEInterface tEInterface = new TEInterface();
        long nativeCreateEngine = tEInterface.nativeCreateEngine();
        if (nativeCreateEngine == 0) {
            return null;
        }
        tEInterface.mNative = nativeCreateEngine;
        return tEInterface;
    }

    public long getNativeHandler() {
        return this.mNative;
    }

    public int destroyEngine() {
        if (this.mNative == 0) {
            return VEResult.TER_INVALID_HANDLER;
        }
        int nativeDestroyEngine = nativeDestroyEngine(this.mNative);
        this.mNative = 0;
        return nativeDestroyEngine;
    }

    public int createScene(String str, String[] strArr, String[] strArr2, String[] strArr3, String[][] strArr4, int i) {
        if (this.mNative == 0) {
            return VEResult.TER_INVALID_HANDLER;
        }
        int nativeCreateScene = nativeCreateScene(this.mNative, str, strArr, strArr2, strArr3, strArr4, i);
        if (nativeCreateScene < 0) {
            return nativeCreateScene;
        }
        this.mHostTrackIndex = nativeCreateScene;
        return 0;
    }

    @Nullable
    public String save() {
        if (this.mNative == 0) {
            return null;
        }
        String nativeSave = nativeSave(this.mNative);
        if (TextUtils.isEmpty(nativeSave)) {
            nativeSave = null;
        }
        return nativeSave;
    }

    public int restore(String str) {
        if (this.mNative == 0) {
            return VEResult.TER_INVALID_HANDLER;
        }
        return nativeRestore(this.mNative, str);
    }

    public int createScene2(String[] strArr, int[] iArr, int[] iArr2, String[] strArr2, int[] iArr3, int[] iArr4, String[] strArr3, String[][] strArr4, int i) {
        if (this.mNative == 0) {
            return VEResult.TER_INVALID_HANDLER;
        }
        int nativeCreateScene2 = nativeCreateScene2(this.mNative, strArr, iArr, iArr2, strArr2, iArr3, iArr4, strArr3, strArr4, i);
        if (nativeCreateScene2 < 0) {
            return nativeCreateScene2;
        }
        this.mHostTrackIndex = nativeCreateScene2;
        return 0;
    }

    public int addAudioTrack(String str, int i, int i2, int i3, int i4, boolean z) {
        if (this.mNative == 0) {
            return -1;
        }
        if (TextUtils.isEmpty(str)) {
            return -100;
        }
        return nativeAddAudioTrack(this.mNative, str, i, i2, i3, i4, z);
    }

    public int addAudioTrack(String str, int i, int i2, int i3, int i4, boolean z, int i5, int i6) {
        if (this.mNative == 0) {
            return -1;
        }
        if (TextUtils.isEmpty(str)) {
            return -100;
        }
        return nativeAddAudioTrack2(this.mNative, str, i, i2, i3, i4, z, i5, i6);
    }

    public int updateAudioTrack(int i, int i2, int i3, int i4, int i5, boolean z) {
        if (this.mNative == 0) {
            return -1;
        }
        if (i < 0) {
            return -100;
        }
        return nativeUpdateAudioTrack(this.mNative, i, i2, i3, i4, i5, z);
    }

    public int updateAudioTrack(int i, int i2, int i3, int i4, int i5, boolean z, int i6, int i7) {
        if (this.mNative == 0) {
            return -1;
        }
        if (i < 0) {
            return -100;
        }
        return nativeUpdateAudioTrack2(this.mNative, i, i2, i3, i4, i5, z, i6, i7);
    }

    public int deleteAudioTrack(int i) {
        if (this.mNative == 0) {
            return -1;
        }
        return nativeDeleteAudioTrack(this.mNative, i);
    }

    public int addWaterMark(String[] strArr, String[] strArr2, int[] iArr, int[] iArr2, double d, double d2, double d3, double d4) {
        if (this.mNative == 0) {
            return VEResult.TER_INVALID_HANDLER;
        }
        if (this.mHostTrackIndex < 0) {
            return VEResult.TER_INVALID_STAT;
        }
        return nativeAddExternalTrack(this.mNative, strArr, strArr2, iArr, iArr2, iArr, iArr2, d, d2, d3, d4, 5, this.mHostTrackIndex);
    }

    public int addSticker(String[] strArr, String[] strArr2, int[] iArr, int[] iArr2, int[] iArr3, int[] iArr4, double d, double d2, double d3, double d4) {
        if (this.mNative == 0) {
            return VEResult.TER_INVALID_HANDLER;
        }
        if (this.mHostTrackIndex < 0) {
            return VEResult.TER_INVALID_STAT;
        }
        return nativeAddExternalTrack(this.mNative, strArr, strArr2, iArr, iArr2, iArr3, iArr4, d, d2, d3, d4, 0, this.mHostTrackIndex);
    }

    public int getStickerFilterIndex(int i) {
        if (this.mNative == 0) {
            return VEResult.TER_INVALID_HANDLER;
        }
        if (i < 0) {
            return -100;
        }
        return nativeGetExternalTrackFilter(this.mNative, i);
    }

    public int addInfoSticker(String str, String[] strArr) {
        if (this.mNative == 0) {
            return VEResult.TER_INVALID_HANDLER;
        }
        if (this.mHostTrackIndex < 0) {
            return VEResult.TER_INVALID_STAT;
        }
        return nativeAddInfoSticker(this.mNative, str, strArr);
    }

    public int removeInfoSticker(int i) {
        if (this.mNative == 0) {
            return VEResult.TER_INVALID_HANDLER;
        }
        if (this.mHostTrackIndex < 0) {
            return VEResult.TER_INVALID_STAT;
        }
        return nativeRemoveInfoSticker(this.mNative, i);
    }

    public float[] getInfoStickerBoundingBox(int i) throws VEException {
        if (this.mNative == 0) {
            throw new VEException(VEResult.TER_INVALID_HANDLER, "");
        } else if (this.mHostTrackIndex >= 0) {
            Object nativeGetInfoStickerBoundingBox = nativeGetInfoStickerBoundingBox(this.mNative, i);
            if (nativeGetInfoStickerBoundingBox[0] == PanoramaArrowAnimateDrawable.LEFT_ARROW_RATIO) {
                Object obj = new float[4];
                System.arraycopy(nativeGetInfoStickerBoundingBox, 1, obj, 0, 4);
                return obj;
            }
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.append("native getInfoStickerBoundingBox failed: ");
            stringBuilder.append(nativeGetInfoStickerBoundingBox[0]);
            throw new VEException(-1, stringBuilder.toString());
        } else {
            throw new VEException(-100, "");
        }
    }

    public int[] addFilters(int[] iArr, String[] strArr, int[] iArr2, int[] iArr3, int[] iArr4, int[] iArr5) {
        if (this.mNative == 0) {
            return new int[]{-1};
        }
        return nativeAddFilters(this.mNative, iArr, strArr, iArr2, iArr3, iArr4, iArr5);
    }

    public int removeFilter(int[] iArr) {
        if (this.mNative == 0) {
            return VEResult.TER_INVALID_HANDLER;
        }
        return nativeRemoveFilter(this.mNative, iArr);
    }

    public int setFilterParam(int i, String str, String str2) {
        if (this.mNative == 0) {
            return VEResult.TER_INVALID_HANDLER;
        }
        return nativeSetFilterParam(this.mNative, i, str, str2);
    }

    public int setFilterParam(int i, String str, VEStickerAnimator vEStickerAnimator) {
        if (this.mNative == 0) {
            return VEResult.TER_INVALID_HANDLER;
        }
        return nativeSetFilterParam(this.mNative, i, str, vEStickerAnimator);
    }

    public int adjustFilterInOut(int i, int i2, int i3) {
        return nativeAdjustFilterInOut(this.mNative, i, i2, i3);
    }

    public int deleteSticker(int i) {
        if (this.mNative == 0) {
            return VEResult.TER_INVALID_HANDLER;
        }
        if (i < 0) {
            return -100;
        }
        return nativeDeleteExternalTrack(this.mNative, i);
    }

    public int deleteWatermark(int i) {
        if (this.mNative == 0) {
            return VEResult.TER_INVALID_HANDLER;
        }
        if (i < 0) {
            return -100;
        }
        return nativeDeleteExternalTrack(this.mNative, i);
    }

    public int prepareEngine(int i, int i2, int i3, String str) {
        if (this.mNative == 0) {
            return VEResult.TER_INVALID_HANDLER;
        }
        if (TextUtils.isEmpty(str)) {
            str = "";
        }
        return nativePrepareEngine(this.mNative, i, i2, i3, str);
    }

    public void setUseLargeMattingModel(boolean z) {
        setOption(0, "UseLargeMattingModel", z ? 1 : 0);
    }

    public void setVideoCompileBitrate(int i, int i2) {
        setOption(0, "CompileBitrateMode", (long) i);
        setOption(0, "CompileBitrateValue", (long) i2);
    }

    public void setCompileHardwareEncodeOptions(int i) {
        setOption(0, "CompileHardwareBitrate", (long) i);
    }

    public void setCompileCommonEncodeOptions(int i, int i2) {
        setOption(0, "CompileBitrateMode", (long) i);
        setOption(0, "CompileEncodeProfile", (long) i2);
    }

    public void setCompileSoftwareEncodeOptions(int i, int i2, int i3, int i4) {
        setOption(0, "CompileSoftwareCrf", (long) i);
        setOption(0, "CompileSoftwareMaxrate", (long) i2);
        setOption(0, "CompileSoftwarePreset", (long) i3);
        setOption(0, "CompileSoftwareQp", (long) i4);
    }

    public void setEngineCompilePath(String str, String str2) {
        setOption(0, "CompilePath", str);
        setOption(0, "CompilePathWav", str2);
    }

    public void setResizer(int i, float f, float f2) {
        setOption(0, "filter mode", (long) i);
        setOption(0, "resizer offset x percent", f);
        setOption(0, "resizer offset y percent", f2);
    }

    public void setCompileFps(int i) {
        setOption(0, "CompileFps", (long) i);
    }

    public void setUseHwEnc(boolean z) {
        setOption(0, "HardwareVideo", z ? 1 : 0);
    }

    public void setEncGopSize(int i) {
        setOption(0, "video gop size", (long) i);
    }

    public void setCompileWatermark(VEWatermarkParam vEWatermarkParam) {
        setOption(0, "CompilePathWatermark", vEWatermarkParam.extFile);
        setOption(0, "CompilePathWavWatermark", "");
    }

    public void setCompileType(int i) {
        setOption(0, "CompileType", (long) i);
    }

    public void setUsrRotate(int i) {
        if (i == 0) {
            setOption(0, "usr rotate", 0);
        } else if (i == 90) {
            setOption(0, "usr rotate", 1);
        } else if (i == 180) {
            setOption(0, "usr rotate", 2);
        } else if (i != 270) {
            setOption(0, "usr rotate", 0);
        } else {
            setOption(0, "usr rotate", 3);
        }
    }

    public void setLooping(boolean z) {
        setOption(1, "engine loop play", z ? 1 : 0);
    }

    public void setCrop(int i, int i2, int i3, int i4) {
        setOption(1, new String[]{"engine crop x", "engine crop y", "engine crop width", "engine crop height"}, new long[]{(long) i, (long) i2, (long) i3, (long) i4});
    }

    public void updateResolution(int i, int i2, int i3, int i4) {
        setOption(1, new String[]{"engine preivew width", "engine preivew height", "engine preivew width percent", "engine preivew height percent"}, new long[]{(long) i, (long) i2, (long) i3, (long) i4});
    }

    public void setScaleMode(int i) {
        setOption(0, "filter mode", (long) i);
    }

    public void setWidthHeight(int i, int i2) {
        setOption(0, "engine compile width", (long) i);
        setOption(0, "engine compile height", (long) i2);
    }

    public int setPreviewScaleMode(int i) {
        if (this.mNative == 0) {
            return VEResult.TER_INVALID_HANDLER;
        }
        return nativeSetPreviewScaleMode(this.mNative, i);
    }

    public int seek(int i, int i2, int i3, int i4) {
        if (this.mNative == 0) {
            return VEResult.TER_INVALID_HANDLER;
        }
        return nativeSeek(this.mNative, i, i2, i3, i4);
    }

    public void setPreviewSurface(Surface surface) {
        if (this.mNative != 0) {
            nativeSetPreviewSurface(this.mNative, surface);
        }
    }

    public void setExpandLastFrame(boolean z) {
        if (this.mNative != 0) {
            nativeSetExpandLastFrame(this.mNative, z);
        }
    }

    public void releasePreviewSurface() {
        if (this.mNative != 0) {
            nativeReleasePreviewSurface(this.mNative);
        }
    }

    public void setWaterMark(String[] strArr, int i, int i2, int i3, int i4, int i5) {
        if (this.mNative != 0) {
            nativeSetWaterMark(this.mNative, strArr, i, i2, i3, i4, i5);
        }
    }

    public void setViewPort(int i, int i2, int i3, int i4) {
        if (this.mNative != 0) {
            nativeSetViewPort(this.mNative, i, i2, i3, i4);
        }
    }

    public void setSurfaceSize(int i, int i2) {
        if (this.mNative != 0) {
            nativeSetSurfaceSize(this.mNative, i, i2);
        }
    }

    public void setSpeedRatio(float f) {
        if (this.mNative != 0) {
            nativeSetSpeedRatio(this.mNative, f);
        }
    }

    public void setDisplayState(float f, float f2, float f3, float f4, int i, int i2, boolean z) {
        if (this.mNative != 0) {
            nativeSetDisplayState(this.mNative, f, f2, f3, f4, i, i2, z);
        }
    }

    public int getDisplayImage(byte[] bArr) {
        if (this.mNative == 0) {
            return VEResult.TER_INVALID_HANDLER;
        }
        return nativeGetDisplayImage(this.mNative, bArr);
    }

    public VERect getDisplayRect() {
        if (this.mNative == 0) {
            return new VERect(0, 0, 0, 0);
        }
        int[] nativeGetDisplayDumpSize = nativeGetDisplayDumpSize(this.mNative);
        return new VERect(nativeGetDisplayDumpSize[0], nativeGetDisplayDumpSize[1], nativeGetDisplayDumpSize[2], nativeGetDisplayDumpSize[3]);
    }

    public void setBackGroundColor(float f, float f2, float f3, float f4) {
        if (this.mNative != 0) {
            nativeSetBackGroundColor(this.mNative, f, f2, f3, f4);
        }
    }

    public void clearDisplay(int i) {
        nativeClearDisplay(this.mNative, i);
    }

    public int[] getInitResolution() {
        int[] iArr = new int[]{-1, -1, -1, -1};
        if (this.mNative == 0) {
            return iArr;
        }
        return nativeGetInitResolution(this.mNative);
    }

    public int start() {
        if (this.mNative == 0) {
            return VEResult.TER_INVALID_HANDLER;
        }
        return nativeStart(this.mNative);
    }

    public int pause() {
        if (this.mNative == 0) {
            return VEResult.TER_INVALID_HANDLER;
        }
        return nativePause(this.mNative);
    }

    public int pauseSync() {
        if (this.mNative == 0) {
            return VEResult.TER_INVALID_HANDLER;
        }
        return nativePauseSync(this.mNative);
    }

    public int stop() {
        if (this.mNative == 0) {
            return VEResult.TER_INVALID_HANDLER;
        }
        return nativeStop(this.mNative);
    }

    public int getDuration() {
        if (this.mNative == 0) {
            return -1;
        }
        return nativeGetDuration(this.mNative);
    }

    public int getCurPosition() {
        if (this.mNative == 0) {
            return -1;
        }
        return nativeGetCurPosition(this.mNative);
    }

    public int getCurState() {
        if (this.mNative == 0) {
            return -1;
        }
        return nativeGetCurState(this.mNative);
    }

    public void addMetaData(String str, String str2) {
        if (this.mNative != 0) {
            nativeAddMetaData(this.mNative, str, str2);
        }
    }

    public void setOption(int i, String str, String str2) {
        if (this.mNative != 0) {
            nativeSetOption(this.mNative, i, str, str2);
        }
    }

    public void setOption(int i, String str, long j) {
        if (this.mNative != 0) {
            nativeSetOption(this.mNative, i, str, j);
        }
    }

    public void setOption(int i, String str, float f) {
        if (this.mNative != 0) {
            nativeSetOption(this.mNative, i, str, f);
        }
    }

    public void setOption(int i, String[] strArr, long[] jArr) {
        if (this.mNative != 0) {
            nativeSetOptionArray(this.mNative, i, strArr, jArr);
        }
    }

    public boolean setTrackVolume(int i, int i2, float f) {
        if (this.mNative == 0) {
            return false;
        }
        return nativeSetTrackVolume(this.mNative, i, i2, f);
    }

    public float getTrackVolume(int i, int i2, int i3) {
        if (this.mNative == 0) {
            return PanoramaArrowAnimateDrawable.LEFT_ARROW_RATIO;
        }
        return nativeGetTrackVolume(this.mNative, i, i2, i3);
    }

    public int updateTrackClips(int i, int i2, String[] strArr) {
        if (this.mNative == 0) {
            return VEResult.TER_INVALID_HANDLER;
        }
        return nativeUpdateTrackClip(this.mNative, i, i2, strArr);
    }

    public int updateTrackFilter(int i, int i2, boolean z) {
        if (this.mNative == 0) {
            return VEResult.TER_INVALID_HANDLER;
        }
        return nativeUpdateTrackFilter(this.mNative, i, i2, z);
    }

    public int createTimeline() {
        if (this.mNative == 0) {
            return VEResult.TER_INVALID_HANDLER;
        }
        return nativeCreateTimeline(this.mNative);
    }

    public boolean testSerialization() {
        return nativeTestSerialization(this.mNative);
    }
}
