package com.android.camera2;

import android.hardware.camera2.CaptureResult;
import android.hardware.camera2.CaptureResult.Key;
import android.hardware.camera2.marshal.MarshalRegistryANX;
import com.android.camera.Util;
import com.android.camera.log.Log;
import com.android.camera2.AECFrameControl.MarshalQueryableAECFrameControl;
import com.android.camera2.AFFrameControl.MarshalQueryableAFFrameControl;
import com.android.camera2.AWBFrameControl.MarshalQueryableAWBFrameControl;

public class CaptureResultParser {
    private static final Key<AECFrameControl> AEC_FRAME_CONTROL = new Key(VENDOR_TAG_AEC_FRAME_CONTROL, AECFrameControl.class);
    private static final Key<AFFrameControl> AF_FRAME_CONTROL = new Key(VENDOR_TAG_AF_FRAME_CONTROL, AFFrameControl.class);
    private static final Key<Byte> AI_HDR_DETECTED = new Key(VENDER_TAG_HDR_DETECTED_MODES, Byte.TYPE);
    private static final Key<Integer> AI_SCENE_DETECTED = new Key(VENDER_TAG_ASD_DETECTED_MODES, Integer.TYPE);
    private static final Key<Byte> AI_SCENE_ENABLE = new Key(VENDER_TAG_ASD_ENABLE, Byte.TYPE);
    private static final Key<AWBFrameControl> AWB_FRAME_CONTROL = new Key(VENDOR_TAG_AWB_FRAME_CONTROL, AWBFrameControl.class);
    public static final Key<Byte> FAST_ZOOM_RESULT = new Key(VENDOR_TAG_FAST_ZOOM_RESULT, Byte.class);
    public static final Key<Byte[]> KEY_HDR_CHECKTER_EV_VALUES = new Key(VENDOR_TAG_HDR_CHECKER, Byte[].class);
    private static final Key<Integer> LENS_DIRTY_DETECTED = new Key(VENDER_TAG_LENS_DIRTY_DETECTED, Integer.TYPE);
    private static final String TAG = CaptureResultParser.class.getSimpleName();
    public static final Key<Integer> ULTR_WIDE_RECOMMENDED_RESULT = new Key(VENDER_TAG_ULTRA_WIDE_RECOMMENDED, Integer.TYPE);
    public static final String VENDER_TAG_ASD_DETECTED_MODES = "xiaomi.ai.asd.sceneDetected";
    public static final String VENDER_TAG_ASD_ENABLE = "xiaomi.ai.asd.enabled";
    public static final String VENDER_TAG_HDR_DETECTED_MODES = "xiaomi.hdr.hdrDetected";
    public static final String VENDER_TAG_LENS_DIRTY_DETECTED = "xiaomi.ai.add.lensDirtyDetected";
    public static final String VENDER_TAG_ULTRA_WIDE_RECOMMENDED = "xiaomi.ai.misd.ultraWideRecommended";
    public static final String VENDOR_TAG_AEC_FRAME_CONTROL = "org.quic.camera2.statsconfigs.AECFrameControl";
    public static final String VENDOR_TAG_AF_FRAME_CONTROL = "org.quic.camera2.statsconfigs.AFFrameControl";
    public static final String VENDOR_TAG_AWB_FRAME_CONTROL = "org.quic.camera2.statsconfigs.AWBFrameControl";
    public static final String VENDOR_TAG_FAST_ZOOM_RESULT = "xiaomi.smoothTransition.result";
    public static final String VENDOR_TAG_HDR_CHECKER = "xiaomi.hdr.hdrChecker";

    static {
        MarshalRegistryANX.registerMarshalQueryable(new MarshalQueryableAWBFrameControl());
        if (Util.isShowPreviewDebugInfo()) {
            MarshalRegistryANX.registerMarshalQueryable(new MarshalQueryableAECFrameControl());
            MarshalRegistryANX.registerMarshalQueryable(new MarshalQueryableAFFrameControl());
        }
    }

    public static boolean isASDEnable(CaptureResult captureResult) {
        Byte b = (Byte) captureResult.get(AI_SCENE_ENABLE);
        boolean z = false;
        if (b == null) {
            return false;
        }
        String str = TAG;
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("isASDEnable: ");
        stringBuilder.append(b);
        Log.d(str, stringBuilder.toString());
        if (b.byteValue() == (byte) 1) {
            z = true;
        }
        return z;
    }

    public static int getAsdDetectedModes(CaptureResult captureResult) {
        Integer num = (Integer) captureResult.get(AI_SCENE_DETECTED);
        if (num != null) {
            return num.intValue();
        }
        return 0;
    }

    public static int getHDRDetectedScene(CaptureResult captureResult) {
        Byte b = (Byte) captureResult.get(AI_HDR_DETECTED);
        if (b != null) {
            return b.byteValue();
        }
        return 0;
    }

    public static boolean isLensDirtyDetected(CaptureResult captureResult) {
        Integer num = (Integer) captureResult.get(LENS_DIRTY_DETECTED);
        boolean z = false;
        if (num == null) {
            return false;
        }
        if (num.intValue() == 1) {
            z = true;
        }
        return z;
    }

    public static AWBFrameControl getAWBFrameControl(CaptureResult captureResult) {
        return (AWBFrameControl) captureResult.get(AWB_FRAME_CONTROL);
    }

    public static AECFrameControl getAECFrameControl(CaptureResult captureResult) {
        return (AECFrameControl) captureResult.get(AEC_FRAME_CONTROL);
    }

    public static AFFrameControl getAFFrameControl(CaptureResult captureResult) {
        return (AFFrameControl) captureResult.get(AF_FRAME_CONTROL);
    }

    public static boolean getFastZoomResult(CaptureResult captureResult) {
        String str = TAG;
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("FAST_ZOOM_RESULT = ");
        stringBuilder.append(captureResult.get(FAST_ZOOM_RESULT));
        Log.d(str, stringBuilder.toString());
        Byte b = (Byte) captureResult.get(FAST_ZOOM_RESULT);
        return b != null && b.byteValue() == (byte) 1;
    }

    public static Byte[] getHdrCheckerValues(CaptureResult captureResult) {
        return (Byte[]) captureResult.get(KEY_HDR_CHECKTER_EV_VALUES);
    }

    public static int getUltraWideDetectedResult(CaptureResult captureResult) {
        Integer num;
        try {
            num = (Integer) captureResult.get(ULTR_WIDE_RECOMMENDED_RESULT);
        } catch (Exception e) {
            String str = TAG;
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.append("Could not find tag for key ");
            stringBuilder.append(ULTR_WIDE_RECOMMENDED_RESULT);
            Log.e(str, stringBuilder.toString());
            num = null;
        }
        if (num != null) {
            return num.intValue();
        }
        return 0;
    }
}
