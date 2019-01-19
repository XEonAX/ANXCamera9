package com.android.camera.module.loader;

import android.hardware.camera2.CaptureResult;
import com.android.camera.CameraSettings;
import com.android.camera.log.Log;
import com.android.camera2.Camera2Proxy.BeautyBodySlimCountCallback;
import com.android.camera2.CaptureResultParser;
import io.reactivex.functions.Function;
import java.lang.ref.WeakReference;

public class FunctionParseBeautyBodySlimCount implements Function<CaptureResult, CaptureResult> {
    private static final String TAG = "FunctionParseBeautyBodySlimCount";
    public static final long TIP_INTERVAL_TIME = 10000;
    public static final long TIP_TIME = 4000;
    private final WeakReference<BeautyBodySlimCountCallback> mCallbackRef;
    private final boolean mIsSupportBeautyBody = CameraSettings.isSupportBeautyBody();
    private long mTipHideTime;
    private long mTipShowTime;
    private boolean mTipStatus;

    public FunctionParseBeautyBodySlimCount(BeautyBodySlimCountCallback beautyBodySlimCountCallback) {
        this.mCallbackRef = new WeakReference(beautyBodySlimCountCallback);
    }

    public CaptureResult apply(CaptureResult captureResult) throws Exception {
        if (!this.mIsSupportBeautyBody) {
            return captureResult;
        }
        BeautyBodySlimCountCallback beautyBodySlimCountCallback = (BeautyBodySlimCountCallback) this.mCallbackRef.get();
        if (beautyBodySlimCountCallback == null) {
            return captureResult;
        }
        boolean z = false;
        if (this.mTipStatus && System.currentTimeMillis() - this.mTipShowTime > TIP_TIME) {
            this.mTipStatus = false;
            this.mTipHideTime = System.currentTimeMillis();
        }
        if (beautyBodySlimCountCallback.isBeautyBodySlimCountDetectStarted()) {
            int beautyBodySlimCountResult = CaptureResultParser.getBeautyBodySlimCountResult(captureResult);
            if (beautyBodySlimCountResult == -1 || System.currentTimeMillis() - this.mTipHideTime < TIP_INTERVAL_TIME) {
                return captureResult;
            }
            if (beautyBodySlimCountResult != 1) {
                z = true;
            }
            if (this.mTipStatus == z) {
                return captureResult;
            }
            this.mTipStatus = z;
            String str = TAG;
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.append("Beauty body slim count:");
            stringBuilder.append(beautyBodySlimCountResult);
            Log.d(str, stringBuilder.toString());
            beautyBodySlimCountCallback.onBeautyBodySlimCountChange(z);
            if (z) {
                this.mTipShowTime = System.currentTimeMillis();
            } else {
                this.mTipHideTime = System.currentTimeMillis();
            }
            return captureResult;
        }
        if (this.mTipStatus) {
            beautyBodySlimCountCallback.onBeautyBodySlimCountChange(false);
            this.mTipStatus = false;
            this.mTipHideTime = 0;
        }
        return captureResult;
    }
}
