package com.android.camera2.autozoom;

import android.hardware.camera2.CaptureRequest.Key;
import android.hardware.camera2.CaptureResult;
import java.util.HashMap;
import java.util.Map;

public class AutoZoomTags {
    public static Map<TAG, Class> TAG_MAP = new HashMap();

    public enum TAG {
        MODE("com.vidhance.autozoom.mode"),
        APPLY_IN_PREVIEW("com.vidhance.autozoom.applyinpreview"),
        MINIMUM_SCALING("com.vidhance.autozoom.minimumscaling"),
        STOP("com.vidhance.autozoom.stop"),
        START("com.vidhance.autozoom.start_region"),
        SELECT("com.vidhance.autozoom.select"),
        UNSELECT("com.vidhance.autozoom.unselect"),
        FORCE_LOCK("com.vidhance.autozoom.force_lock"),
        CENTER_OFFSET("com.vidhance.autozoom.center_offset"),
        SCALE_OFFSET("com.vidhance.autozoom.scale_offset"),
        BOUNDS("com.vidhance.autozoom.bounds"),
        TARGET_BOUNDS_STABILIZED("com.vidhance.autozoom.target_bounds_stabilized"),
        TARGET_BOUNDS_ZOOMED("com.vidhance.autozoom.target_bounds_zoomed"),
        STATUS("com.vidhance.autozoom.status"),
        ACTIVE_OBJECTS("com.vidhance.autozoom.active_objects"),
        SELECTED_OBJECTS("com.vidhance.autozoom.selected_objects"),
        PAUSED_OBJECTS("com.vidhance.autozoom.paused_objects"),
        OBJECT_BOUNDS_STABILIZED("com.vidhance.autozoom.object_bounds_stabilized"),
        OBJECT_BOUNDS_ZOOMED("com.vidhance.autozoom.object_bounds_zoomed"),
        DELAYED_TARGET_BOUNDS_STABILIZED("com.vidhance.autozoom.delayed_target_bounds_stabilized"),
        DELAYED_TARGET_BOUNDS_ZOOMED("com.vidhance.autozoom.delayed_target_bounds_zoomed");
        
        private final String mName;

        private TAG(String str) {
            this.mName = str;
        }

        public String toString() {
            return this.mName;
        }

        public <T> Key<T> toCaptureRequestKey() {
            return RequestKeyCreator.requestKey(this.mName, (Class) AutoZoomTags.TAG_MAP.get(this));
        }

        public <T> CaptureResult.Key<T> toCaptureResultKey() {
            return RequestKeyCreator.resultKey(this.mName, (Class) AutoZoomTags.TAG_MAP.get(this));
        }
    }

    static {
        TAG_MAP.put(TAG.MODE, Integer.class);
        TAG_MAP.put(TAG.APPLY_IN_PREVIEW, Integer.class);
        TAG_MAP.put(TAG.MINIMUM_SCALING, Float.class);
        TAG_MAP.put(TAG.STOP, Integer.class);
        TAG_MAP.put(TAG.START, float[].class);
        TAG_MAP.put(TAG.SELECT, Integer.class);
        TAG_MAP.put(TAG.UNSELECT, Integer.class);
        TAG_MAP.put(TAG.FORCE_LOCK, Integer.class);
        TAG_MAP.put(TAG.CENTER_OFFSET, float[].class);
        TAG_MAP.put(TAG.SCALE_OFFSET, Float.class);
        TAG_MAP.put(TAG.BOUNDS, float[].class);
        TAG_MAP.put(TAG.TARGET_BOUNDS_STABILIZED, float[].class);
        TAG_MAP.put(TAG.TARGET_BOUNDS_ZOOMED, float[].class);
        TAG_MAP.put(TAG.STATUS, Integer.class);
        TAG_MAP.put(TAG.ACTIVE_OBJECTS, int[].class);
        TAG_MAP.put(TAG.SELECTED_OBJECTS, int[].class);
        TAG_MAP.put(TAG.PAUSED_OBJECTS, int[].class);
        TAG_MAP.put(TAG.OBJECT_BOUNDS_STABILIZED, float[].class);
        TAG_MAP.put(TAG.OBJECT_BOUNDS_ZOOMED, float[].class);
        TAG_MAP.put(TAG.DELAYED_TARGET_BOUNDS_STABILIZED, float[].class);
        TAG_MAP.put(TAG.DELAYED_TARGET_BOUNDS_ZOOMED, float[].class);
    }
}
