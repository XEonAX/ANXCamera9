package com.xiaomi.camera.liveshot.encoder;

import android.media.MediaCodec;
import android.media.MediaFormat;
import android.opengl.EGLContext;
import android.os.Handler;
import android.view.Surface;
import com.android.camera.effect.draw_mode.DrawExtTexAttribute;
import com.android.camera.log.Log;
import com.android.camera.ui.drawable.PanoramaArrowAnimateDrawable;
import com.xiaomi.camera.liveshot.encoder.CircularMediaEncoder.Snapshot;
import com.xiaomi.camera.liveshot.gles.RenderThread;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.TimeUnit;

public class CircularVideoEncoder extends CircularMediaEncoder {
    private static final boolean DEBUG_FPS = true;
    private static final String TAG = CircularVideoEncoder.class.getSimpleName();
    protected long mFirstPresentationTimeUs;
    private int mFpsOutputInterval = 500;
    private long mFrameStartTimestampNs = 0;
    private int mFramesRendered = 0;
    private Surface mInputSurface;
    protected long mLastPresentationTimeUs;
    private long mMinFrameRenderPeriodNs;
    private long mNextFrameTimestampNs;
    private final int mPreviewHeight;
    private final int mPreviewWidth;
    private RenderThread mRenderThread;
    private EGLContext mSharedEGLContext;

    public CircularVideoEncoder(MediaFormat mediaFormat, EGLContext eGLContext, long j, long j2) {
        super(mediaFormat, j, j2);
        float f = this.mDesiredMediaFormat.getFloat("i-frame-interval");
        j = TimeUnit.MICROSECONDS.toMillis(this.mBufferingDurationUs);
        f = (f * 1000.0f) * 2.0f;
        if (((float) j) < f) {
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.append("Requested time span is too short: ");
            stringBuilder.append(j);
            stringBuilder.append(" vs. ");
            stringBuilder.append(f);
            throw new IllegalArgumentException(stringBuilder.toString());
        } else if (eGLContext != null) {
            this.mSharedEGLContext = eGLContext;
            int integer = this.mDesiredMediaFormat.getInteger("width");
            int integer2 = this.mDesiredMediaFormat.getInteger("height");
            this.mPreviewWidth = Math.min(integer, integer2);
            this.mPreviewHeight = Math.max(integer, integer2);
            try {
                this.mMediaCodec = MediaCodec.createEncoderByType(this.mDesiredMediaFormat.getString("mime"));
                this.mIsInitialized = true;
            } catch (IOException e) {
                StringBuilder stringBuilder2 = new StringBuilder();
                stringBuilder2.append("Failed to configure MediaCodec: ");
                stringBuilder2.append(e);
                throw new IllegalStateException(stringBuilder2.toString());
            }
        } else {
            throw new IllegalArgumentException("The shared EGLContext must not be null");
        }
    }

    public void setFpsReduction(float f) {
        String str = TAG;
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("setFpsReduction: ");
        stringBuilder.append(f);
        Log.d(str, stringBuilder.toString());
        if (f <= PanoramaArrowAnimateDrawable.LEFT_ARROW_RATIO) {
            this.mMinFrameRenderPeriodNs = Long.MAX_VALUE;
        } else {
            this.mMinFrameRenderPeriodNs = (long) (((float) TimeUnit.SECONDS.toNanos(1)) / f);
        }
    }

    protected long getNextPresentationTimeUs(long j) {
        if (this.mFirstPresentationTimeUs == 0) {
            this.mFirstPresentationTimeUs = j;
            return 0;
        }
        j -= this.mFirstPresentationTimeUs;
        if (this.mLastPresentationTimeUs >= j) {
            this.mLastPresentationTimeUs += 9643;
            return this.mLastPresentationTimeUs;
        }
        this.mLastPresentationTimeUs = j;
        return j;
    }

    public void doStart() {
        Log.d(TAG, "start(): E");
        if (!this.mIsInitialized) {
            Log.d(TAG, "start(): not initialized yet");
        } else if (this.mIsBuffering) {
            Log.d(TAG, "start(): encoder is already running");
        } else {
            this.mCyclicBuffer.clear();
            this.mMediaCodec.configure(this.mDesiredMediaFormat, null, null, 1);
            this.mInputSurface = this.mMediaCodec.createInputSurface();
            this.mRenderThread = new RenderThread(TAG, this.mPreviewWidth, this.mPreviewHeight, this.mSharedEGLContext, this.mInputSurface, true);
            this.mRenderThread.start();
            this.mRenderThread.waitUntilReady();
            this.mMediaCodec.setCallback(this, new Handler(this.mEncodingThread.getLooper()));
            this.mCurrentPresentationTimeUs = 0;
            this.mFirstPresentationTimeUs = 0;
            this.mLastPresentationTimeUs = 0;
            super.doStart();
            this.mIsBuffering = true;
            Log.d(TAG, "start(): X");
        }
    }

    public synchronized void doStop() {
        Log.d(TAG, "stop(): E");
        if (!this.mIsInitialized) {
            return;
        }
        if (this.mIsBuffering) {
            this.mIsBuffering = false;
            if (this.mRenderThread != null) {
                this.mRenderThread.quit();
                this.mRenderThread = null;
            }
            if (this.mInputSurface != null) {
                this.mInputSurface.release();
                this.mInputSurface = null;
            }
            super.doStop();
            Log.d(TAG, "clear pending snapshot requests: E");
            List<Snapshot> arrayList = new ArrayList();
            synchronized (this.mSnapshots) {
                arrayList.addAll(this.mSnapshots);
                this.mSnapshots.clear();
            }
            String str = TAG;
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.append("cleared ");
            stringBuilder.append(arrayList.size());
            stringBuilder.append(" snapshot requests.");
            Log.d(str, stringBuilder.toString());
            for (Snapshot putEos : arrayList) {
                try {
                    putEos.putEos();
                } catch (InterruptedException e) {
                    String str2 = TAG;
                    StringBuilder stringBuilder2 = new StringBuilder();
                    stringBuilder2.append("Failed to putEos: ");
                    stringBuilder2.append(e);
                    Log.d(str2, stringBuilder2.toString());
                }
            }
            Log.d(TAG, "clear pending snapshot requests: X");
            Log.d(TAG, "stop(): X");
        }
    }

    public void doRelease() {
        if (this.mIsInitialized) {
            super.doRelease();
            this.mIsInitialized = false;
        }
    }

    public synchronized void setFilterId(int i) {
        if (!this.mIsInitialized) {
            return;
        }
        if (this.mIsBuffering) {
            this.mRenderThread.setFilterId(i);
        }
    }

    /* JADX WARNING: Missing block: B:28:0x0083, code:
            return;
     */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    public synchronized void onSurfaceTextureUpdated(DrawExtTexAttribute drawExtTexAttribute) {
        if (!this.mIsInitialized) {
            return;
        }
        if (this.mIsBuffering) {
            long nanoTime;
            if (this.mMinFrameRenderPeriodNs > 0) {
                nanoTime = System.nanoTime();
                if (nanoTime < this.mNextFrameTimestampNs) {
                    Log.d(TAG, "Dropping frame - fps reduction is active.");
                    return;
                } else {
                    this.mNextFrameTimestampNs += this.mMinFrameRenderPeriodNs;
                    this.mNextFrameTimestampNs = Math.max(this.mNextFrameTimestampNs, nanoTime);
                }
            }
            this.mRenderThread.draw(drawExtTexAttribute);
            nanoTime = TimeUnit.NANOSECONDS.toMillis(System.nanoTime());
            if (this.mFrameStartTimestampNs > 0) {
                long j = nanoTime - this.mFrameStartTimestampNs;
                this.mFramesRendered++;
                if (j > ((long) this.mFpsOutputInterval)) {
                    double d = ((double) (this.mFramesRendered * 1000)) / ((double) j);
                    String str = TAG;
                    StringBuilder stringBuilder = new StringBuilder();
                    stringBuilder.append("onSurfaceTextureUpdated(): ");
                    stringBuilder.append(d);
                    Log.d(str, stringBuilder.toString());
                    this.mFrameStartTimestampNs = nanoTime;
                    this.mFramesRendered = 0;
                }
            } else {
                this.mFrameStartTimestampNs = nanoTime;
            }
        }
    }
}
