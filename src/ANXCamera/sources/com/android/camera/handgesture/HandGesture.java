package com.android.camera.handgesture;

import com.android.camera.log.Log;

public class HandGesture {
    private static final String TAG = HandGesture.class.getSimpleName();

    public final native int detectGesture(byte[] bArr, int i, int i2, int i3);

    public final native void init(int i);

    public final native void unInit();

    static {
        try {
            System.loadLibrary("camera_handgesture_mpbase");
            System.loadLibrary("arc_layer_sgl");
            System.loadLibrary("handengine.arcsoft");
            System.loadLibrary("camera_arcsoft_handgesture");
        } catch (UnsatisfiedLinkError e) {
            String str = TAG;
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.append("can't loadLibrary, ");
            stringBuilder.append(e.getMessage());
            Log.e(str, stringBuilder.toString());
        }
    }
}
