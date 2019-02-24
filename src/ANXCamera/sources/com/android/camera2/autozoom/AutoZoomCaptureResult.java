package com.android.camera2.autozoom;

import android.hardware.camera2.CaptureResult;
import android.util.Log;
import com.android.camera2.autozoom.AutoZoomTags.TAG;

public class AutoZoomCaptureResult {
    private static final String TAG = AutoZoomCaptureResult.class.getSimpleName();
    private int[] mAutoZoomActiveObjects;
    private boolean mAutoZoomAvailable = true;
    private float[] mAutoZoomBounds;
    private float[] mAutoZoomObjectBoundsStabilized;
    private float[] mAutoZoomObjectBoundsZoomed;
    private int[] mAutoZoomPausedObjects;
    private int[] mAutoZoomSelectedObjects;
    private int mAutoZoomStatus;
    private float[] mAutoZoomTargetBoundsStabilized;
    private float[] mAutoZoomTargetBoundsZoomed;

    public AutoZoomCaptureResult(CaptureResult captureResult) {
        if (this.mAutoZoomAvailable) {
            try {
                Integer num = (Integer) getAutoZoomResult(TAG.STATUS, captureResult);
                this.mAutoZoomStatus = num == null ? 0 : num.intValue();
                String str = TAG;
                StringBuilder stringBuilder = new StringBuilder();
                stringBuilder.append("autozoom status is ");
                stringBuilder.append(this.mAutoZoomStatus);
                Log.i(str, stringBuilder.toString());
                this.mAutoZoomBounds = (float[]) getAutoZoomResult(TAG.BOUNDS, captureResult);
                str = TAG;
                stringBuilder = new StringBuilder();
                stringBuilder.append("autoZoomBound is ");
                stringBuilder.append(this.mAutoZoomBounds);
                Log.i(str, stringBuilder.toString());
                if (this.mAutoZoomBounds != null) {
                    str = TAG;
                    stringBuilder = new StringBuilder();
                    stringBuilder.append("bounds left ");
                    stringBuilder.append(this.mAutoZoomBounds[0]);
                    stringBuilder.append(" top ");
                    stringBuilder.append(this.mAutoZoomBounds[1]);
                    stringBuilder.append(" right ");
                    stringBuilder.append(this.mAutoZoomBounds[2]);
                    stringBuilder.append(" bottom ");
                    stringBuilder.append(this.mAutoZoomBounds[3]);
                    Log.i(str, stringBuilder.toString());
                }
                this.mAutoZoomTargetBoundsStabilized = (float[]) getAutoZoomResult(TAG.TARGET_BOUNDS_STABILIZED, captureResult);
                this.mAutoZoomTargetBoundsZoomed = (float[]) getAutoZoomResult(TAG.TARGET_BOUNDS_ZOOMED, captureResult);
                this.mAutoZoomActiveObjects = (int[]) getAutoZoomResult(TAG.ACTIVE_OBJECTS, captureResult);
                this.mAutoZoomSelectedObjects = (int[]) getAutoZoomResult(TAG.SELECTED_OBJECTS, captureResult);
                this.mAutoZoomPausedObjects = (int[]) getAutoZoomResult(TAG.PAUSED_OBJECTS, captureResult);
                this.mAutoZoomObjectBoundsStabilized = (float[]) getAutoZoomResult(TAG.OBJECT_BOUNDS_STABILIZED, captureResult);
                this.mAutoZoomObjectBoundsZoomed = (float[]) getAutoZoomResult(TAG.OBJECT_BOUNDS_ZOOMED, captureResult);
            } catch (Throwable e) {
                this.mAutoZoomAvailable = false;
                Log.e(TAG, "Could not read AutoZoom tags from CaptureResult. This instance of Device will not try to read AutoZoom tags from subsequent results", e);
            }
        }
    }

    public int getAutoZoomStatus() {
        return this.mAutoZoomStatus;
    }

    public float[] getAutoZoomBounds() {
        return this.mAutoZoomBounds;
    }

    public float[] getAutoZoomTargetBoundsStabilized() {
        return this.mAutoZoomTargetBoundsStabilized;
    }

    public float[] getAutoZoomTargetBoundsZoomed() {
        return this.mAutoZoomTargetBoundsZoomed;
    }

    public int[] getAutoZoomActiveObjects() {
        return this.mAutoZoomActiveObjects;
    }

    public int[] getAutoZoomSelectedObjects() {
        return this.mAutoZoomSelectedObjects;
    }

    public int[] getAutoZoomPausedObjects() {
        return this.mAutoZoomPausedObjects;
    }

    public float[] getAutoZoomObjectBoundsStabilized() {
        return this.mAutoZoomObjectBoundsStabilized;
    }

    public float[] getAutoZoomObjectBoundsZoomed() {
        return this.mAutoZoomObjectBoundsZoomed;
    }

    private Object getAutoZoomResult(TAG tag, CaptureResult captureResult) {
        return captureResult.get(RequestKeyCreator.resultKey(tag.toString(), (Class) AutoZoomTags.TAG_MAP.get(tag)));
    }
}
