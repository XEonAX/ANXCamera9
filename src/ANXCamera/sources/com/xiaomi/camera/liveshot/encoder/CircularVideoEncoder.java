package com.xiaomi.camera.liveshot.encoder;

import android.media.MediaCodec;
import android.media.MediaFormat;
import android.opengl.EGLContext;
import android.os.Handler;
import android.view.Surface;
import com.android.camera.effect.draw_mode.DrawExtTexAttribute;
import com.android.camera.log.Log;
import com.xiaomi.camera.liveshot.encoder.CircularMediaEncoder.Snapshot;
import com.xiaomi.camera.liveshot.gles.RenderThread;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.TimeUnit;

public class CircularVideoEncoder extends CircularMediaEncoder {
    private static final boolean DEBUG = true;
    private static final String TAG = CircularVideoEncoder.class.getSimpleName();
    private volatile long mFrameNum = 0;
    private Surface mInputSurface;
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

    public void doStart() {
        Log.d(TAG, "start(): E");
        if (!this.mIsInitialized) {
            Log.d(TAG, "start(): not initialized yet");
        } else if (this.mIsBuffering) {
            Log.d(TAG, "start(): encoder is already running");
        } else {
            this.mCircularBuffer.clear();
            this.mMediaCodec.configure(this.mDesiredMediaFormat, null, null, 1);
            this.mInputSurface = this.mMediaCodec.createInputSurface();
            this.mRenderThread = new RenderThread(TAG, this.mPreviewWidth, this.mPreviewHeight, this.mSharedEGLContext, this.mInputSurface, true);
            this.mRenderThread.start();
            this.mRenderThread.waitUntilReady();
            this.mMediaCodec.setCallback(this, new Handler(this.mEncodingThread.getLooper()));
            super.doStart();
            this.mCurrentPresentationTimeUs = 0;
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
        Log.d(TAG, "releasing encoder objects");
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

    public synchronized void onSurfaceTextureUpdated(DrawExtTexAttribute drawExtTexAttribute) {
        if (!this.mIsInitialized) {
            return;
        }
        if (this.mIsBuffering) {
            this.mFrameNum++;
            if (this.mFrameNum % 2 == 0) {
                this.mRenderThread.draw(drawExtTexAttribute);
            }
        }
    }
}
