package com.android.zxing;

import android.media.Image;
import android.os.Handler;
import android.os.HandlerThread;
import com.android.camera.log.Log;
import com.android.camera2.Camera2Proxy;
import com.android.camera2.Camera2Proxy.PreviewCallback;
import java.util.HashMap;
import java.util.Map.Entry;

public class PreviewDecodeManager {
    public static final int DECODE_TYPE_HAND_GESTURE = 1;
    public static final int DECODE_TYPE_QR = 0;
    private static final String TAG = "PreviewDecodeManager";
    private HashMap<Integer, Decoder> mDecoders;
    private Handler mHandler;
    private PreviewCallback mPreviewCallback;
    private int mPreviewHeight;
    private int mPreviewWidth;

    private static class Singleton {
        public static final PreviewDecodeManager INSTANCE = new PreviewDecodeManager();

        private Singleton() {
        }
    }

    /* synthetic */ PreviewDecodeManager(AnonymousClass1 anonymousClass1) {
        this();
    }

    private PreviewDecodeManager() {
        this.mPreviewCallback = new PreviewCallback() {
            public void onPreviewFrame(Image image, Camera2Proxy camera2Proxy, int i) {
                for (Entry value : PreviewDecodeManager.this.mDecoders.entrySet()) {
                    ((Decoder) value.getValue()).onPreviewFrame(image, PreviewDecodeManager.this.mPreviewWidth, PreviewDecodeManager.this.mPreviewHeight, i);
                }
            }
        };
        this.mDecoders = new HashMap();
    }

    public static PreviewDecodeManager getInstance() {
        return Singleton.INSTANCE;
    }

    public PreviewCallback getPreviewCallback() {
        return this.mPreviewCallback;
    }

    public void setPreviewSize(int i, int i2) {
        if (!(this.mPreviewWidth == i && this.mPreviewHeight == i2)) {
            this.mPreviewWidth = i;
            this.mPreviewHeight = i2;
            for (Entry value : this.mDecoders.entrySet()) {
                ((Decoder) value.getValue()).updatePreviewSize(i, i2);
            }
        }
        String str = TAG;
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("setPreviewSize: ");
        stringBuilder.append(i);
        stringBuilder.append(" x ");
        stringBuilder.append(i2);
        Log.d(str, stringBuilder.toString());
    }

    public void init(int i, int i2) {
        if (this.mHandler == null) {
            HandlerThread handlerThread = new HandlerThread(TAG);
            handlerThread.start();
            this.mHandler = new Handler(handlerThread.getLooper());
        }
        switch (i2) {
            case 0:
                if (this.mDecoders.get(Integer.valueOf(0)) == null) {
                    this.mDecoders.put(Integer.valueOf(0), new QrDecoder());
                    break;
                }
                break;
            case 1:
                if (this.mDecoders.get(Integer.valueOf(1)) == null) {
                    this.mDecoders.put(Integer.valueOf(1), new HandGestureDecoder());
                    break;
                }
                break;
        }
        for (Entry value : this.mDecoders.entrySet()) {
            ((Decoder) value.getValue()).init(i);
        }
    }

    public Handler getHandler() {
        return this.mHandler;
    }

    public void quit() {
        if (this.mHandler != null) {
            this.mHandler.removeCallbacksAndMessages(null);
            this.mHandler.getLooper().quitSafely();
        }
        this.mHandler = null;
        for (Entry value : this.mDecoders.entrySet()) {
            Decoder decoder = (Decoder) value.getValue();
            decoder.stopDecode();
            decoder.quit();
        }
        this.mDecoders.clear();
    }

    public void startDecode() {
        for (Entry value : this.mDecoders.entrySet()) {
            ((Decoder) value.getValue()).startDecode();
        }
    }

    public void reset() {
        for (Entry value : this.mDecoders.entrySet()) {
            ((Decoder) value.getValue()).reset();
        }
    }

    public String getScanResult() {
        return ((QrDecoder) this.mDecoders.get(Integer.valueOf(0))).getScanResult();
    }

    public void resetScanResult() {
        ((QrDecoder) this.mDecoders.get(Integer.valueOf(0))).resetScanResult();
    }

    public void stopDecode(int i) {
        if (this.mDecoders.get(Integer.valueOf(i)) != null) {
            ((Decoder) this.mDecoders.get(Integer.valueOf(i))).stopDecode();
        }
    }
}
