package com.sensetime.stmobile;

public class STMobileStickerNative {
    public static final int ST_MOBILE_BROW_JUMP = 32;
    public static final int ST_MOBILE_EYE_BLINK = 2;
    public static final int ST_MOBILE_HEAD_PITCH = 16;
    public static final int ST_MOBILE_HEAD_YAW = 8;
    public static final int ST_MOBILE_MOUTH_AH = 4;
    private static final String TAG = STMobileStickerNative.class.getSimpleName();
    private static ItemCallback mCallback;
    private long nativeStickerHandle;

    public interface ItemCallback {
        void processTextureCallback(String str, RenderStatus renderStatus);
    }

    enum RenderStatus {
        ST_MATERIAL_BEGIN_RENDER(0),
        ST_MATERIAL_RENDERING(1),
        ST_MATERIAL_NO_RENDERING(2);
        
        private final int status;

        private RenderStatus(int i) {
            this.status = i;
        }

        public int getStatus() {
            return this.status;
        }

        public static RenderStatus fromStatus(int i) {
            for (RenderStatus renderStatus : values()) {
                if (renderStatus.getStatus() == i) {
                    return renderStatus;
                }
            }
            return null;
        }
    }

    public native int changeSticker(String str);

    public native int createInstance(String str);

    public native void destroyInstance();

    public native int getTriggerAction();

    public native int processTexture(int i, STHumanAction sTHumanAction, int i2, int i3, int i4, boolean z, int i5);

    public native int processTextureAndOutputBuffer(int i, STHumanAction sTHumanAction, int i2, int i3, int i4, boolean z, int i5, int i6, byte[] bArr);

    static {
        System.loadLibrary("st_mobile");
        System.loadLibrary("stmobile_jni");
    }

    public static void setCallback(ItemCallback itemCallback) {
        mCallback = itemCallback;
    }

    public static void item_callback(String str, int i) {
        if (mCallback != null) {
            mCallback.processTextureCallback(str, RenderStatus.fromStatus(i));
        }
    }
}
