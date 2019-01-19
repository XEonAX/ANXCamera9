package com.android.zxing;

import com.android.camera.log.Log;
import io.reactivex.FlowableEmitter;
import io.reactivex.disposables.Disposable;
import java.util.concurrent.atomic.AtomicInteger;

public abstract class Decoder {
    static final long DECODE_AUTO_INTERVAL = 1000;
    static int DECODE_MAX_COUNT = 15;
    public static final String TAG = "Decoder";
    Disposable mDecodeDisposable;
    FlowableEmitter<PreviewImage> mDecodeFlowableEmitter;
    volatile boolean mDecoding;
    AtomicInteger mDecodingCount = new AtomicInteger(0);
    boolean mEnable = false;
    long mLastDecodeTime;

    public abstract void reConfig(int i);

    public abstract void reset();

    public abstract void startDecode();

    public boolean needPreviewFrame() {
        if (!this.mEnable || !this.mDecoding || this.mDecodingCount.get() >= DECODE_MAX_COUNT) {
            return false;
        }
        long currentTimeMillis = System.currentTimeMillis();
        if (currentTimeMillis - this.mLastDecodeTime < DECODE_AUTO_INTERVAL) {
            return false;
        }
        this.mLastDecodeTime = currentTimeMillis;
        this.mDecodingCount.getAndIncrement();
        String str = TAG;
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("preview frame buffer received... mDecodingCount = ");
        stringBuilder.append(this.mDecodingCount.get());
        Log.v(str, stringBuilder.toString());
        return true;
    }

    public void setEnable(boolean z) {
        this.mEnable = z;
    }

    public void onPreviewFrame(PreviewImage previewImage) {
        if (previewImage != null && this.mDecodeFlowableEmitter != null) {
            this.mDecodeFlowableEmitter.onNext(previewImage);
        }
    }

    public void updatePreviewSize(int i, int i2) {
    }

    public void stopDecode() {
        Log.d(TAG, "Stop decode.");
        if (!(this.mDecodeDisposable == null || this.mDecodeDisposable.isDisposed())) {
            this.mDecodeDisposable.dispose();
        }
        this.mDecoding = false;
    }
}
