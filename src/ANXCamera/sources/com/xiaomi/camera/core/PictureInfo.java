package com.xiaomi.camera.core;

import com.android.camera.log.Log;
import org.json.JSONObject;

public class PictureInfo {
    private static final String MIRROR = "mirror";
    private static final String SENSOR_TYPE = "sensor_type";
    private static final String SENSOR_TYPE_FRONT = "front";
    private static final String SENSOR_TYPE_REAR = "rear";
    private static final String TAG = PictureInfo.class.getSimpleName();
    private int aiType;
    private boolean isBokehFrontCamera;
    private boolean isMirror;
    private transient JSONObject mInfo = new JSONObject();
    private String mInfoString;
    private String mSensorType = SENSOR_TYPE_REAR;

    public PictureInfo setSensorType(boolean z) {
        this.mSensorType = z ? SENSOR_TYPE_FRONT : SENSOR_TYPE_REAR;
        try {
            this.mInfo.put(SENSOR_TYPE, this.mSensorType);
        } catch (Throwable e) {
            Log.e(TAG, "setSensorType JSONException occurs ", e);
        }
        return this;
    }

    public PictureInfo setFrontMirror(boolean z) {
        this.isMirror = z;
        try {
            this.mInfo.put(MIRROR, z);
        } catch (Throwable e) {
            Log.e(TAG, "setFrontMirror JSONException occurs ", e);
        }
        return this;
    }

    public boolean isFrontMirror() {
        return this.isMirror;
    }

    public boolean isBokehFrontCamera() {
        return this.isBokehFrontCamera;
    }

    public PictureInfo setBokehFrontCamera(boolean z) {
        this.isBokehFrontCamera = z;
        return this;
    }

    public int getAiType() {
        return this.aiType;
    }

    public PictureInfo setAiType(int i) {
        this.aiType = i;
        return this;
    }

    public String getInfoString() {
        return this.mInfoString;
    }

    public void end() {
        this.mInfoString = this.mInfo.toString();
        this.mInfo = null;
    }
}
