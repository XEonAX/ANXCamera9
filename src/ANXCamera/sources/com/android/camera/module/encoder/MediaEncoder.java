package com.android.camera.module.encoder;

import android.media.MediaCodec;
import android.media.MediaCodec.BufferInfo;
import com.android.camera.log.Log;
import com.android.camera.module.loader.FunctionParseBeautyBodySlimCount;
import java.io.IOException;
import java.lang.ref.WeakReference;
import java.nio.ByteBuffer;

public abstract class MediaEncoder implements Runnable {
    protected static final int TIMEOUT_USEC = 10000;
    private final String TAG;
    private BufferInfo mBufferInfo;
    protected long mFirstFrameTime;
    private int mFrame;
    protected volatile boolean mIsCapturing;
    protected boolean mIsEOS;
    protected boolean mIsReady;
    protected final MediaEncoderListener mListener;
    protected MediaCodec mMediaCodec;
    protected boolean mMuxerStarted;
    private int mRequestDrain;
    protected volatile boolean mRequestStop;
    protected boolean mSkipFrame;
    protected final Object mSync = new Object();
    protected Thread mThread;
    protected int mTrackIndex;
    protected final WeakReference<MediaMuxerWrapper> mWeakMuxer;
    private long prevOutputPTSUs = 0;

    public interface MediaEncoderListener {
        void onPrepared(MediaEncoder mediaEncoder);

        void onStopped(MediaEncoder mediaEncoder, boolean z);
    }

    abstract void prepare() throws IOException;

    public MediaEncoder(MediaMuxerWrapper mediaMuxerWrapper, MediaEncoderListener mediaEncoderListener) {
        this.mWeakMuxer = new WeakReference(mediaMuxerWrapper);
        mediaMuxerWrapper.addEncoder(this);
        this.mListener = mediaEncoderListener;
        this.TAG = getClass().getSimpleName();
        synchronized (this.mSync) {
            this.mBufferInfo = new BufferInfo();
            this.mIsReady = false;
            this.mThread = new Thread(this, getClass().getSimpleName());
            this.mThread.start();
            if (!this.mIsReady) {
                try {
                    this.mSync.wait();
                } catch (Throwable e) {
                    String str = this.TAG;
                    StringBuilder stringBuilder = new StringBuilder();
                    stringBuilder.append("Exception occurred: ");
                    stringBuilder.append(e.getMessage());
                    Log.e(str, stringBuilder.toString(), e);
                }
            }
        }
    }

    public boolean frameAvailableSoon() {
        synchronized (this.mSync) {
            if (!this.mIsCapturing || this.mRequestStop) {
                String str = this.TAG;
                StringBuilder stringBuilder = new StringBuilder();
                stringBuilder.append("frameAvailableSoon: requestStop=");
                stringBuilder.append(this.mRequestStop);
                Log.w(str, stringBuilder.toString());
                return false;
            }
            this.mRequestDrain++;
            this.mSync.notifyAll();
            return true;
        }
    }

    public void run() {
        synchronized (this.mSync) {
            this.mRequestStop = false;
            this.mRequestDrain = 0;
            this.mIsReady = true;
            this.mSync.notify();
        }
        while (true) {
            boolean z;
            boolean z2;
            synchronized (this.mSync) {
                z = this.mRequestStop;
                z2 = this.mRequestDrain > 0;
                if (z2) {
                    this.mRequestDrain--;
                }
            }
            if (z) {
                drain();
                signalEndOfInputStream();
                drain();
                release();
                break;
            } else if (z2) {
                drain();
            } else {
                synchronized (this.mSync) {
                    if (!this.mRequestStop) {
                        try {
                            this.mSync.wait();
                        } catch (InterruptedException e) {
                            String str = this.TAG;
                            StringBuilder stringBuilder = new StringBuilder();
                            stringBuilder.append("Exception occurred: ");
                            stringBuilder.append(e.getMessage());
                            Log.e(str, stringBuilder.toString());
                        }
                    }
                }
            }
        }
        Log.d(this.TAG, "encoder thread exiting");
        synchronized (this.mSync) {
            this.mRequestStop = true;
            this.mIsCapturing = false;
        }
    }

    boolean startRecording(long j) {
        Log.d(this.TAG, "startRecording");
        synchronized (this.mSync) {
            this.mFirstFrameTime = System.currentTimeMillis() + j;
            this.mSkipFrame = true;
            this.mFrame = 0;
            this.mIsCapturing = true;
            this.mRequestStop = false;
            this.mSync.notifyAll();
        }
        return true;
    }

    /* JADX WARNING: Missing block: B:11:0x0021, code:
            return;
     */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    void stopRecording() {
        Log.d(this.TAG, "stopRecording");
        synchronized (this.mSync) {
            if (!this.mIsCapturing || this.mRequestStop) {
            } else {
                this.mSkipFrame = false;
                this.mRequestStop = true;
                this.mSync.notifyAll();
            }
        }
    }

    void join() {
        if (this.mThread != null) {
            try {
                this.mThread.join();
                this.mThread = null;
            } catch (Throwable e) {
                Log.e(this.TAG, "join interrupted", e);
            }
        }
    }

    /* JADX WARNING: Removed duplicated region for block: B:20:0x0046  */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    protected void release() {
        boolean stop;
        if (this.mMediaCodec != null) {
            try {
                this.mMediaCodec.stop();
                this.mMediaCodec.release();
                this.mMediaCodec = null;
            } catch (Throwable e) {
                Log.e(this.TAG, "failed releasing MediaCodec", e);
            }
        }
        if (this.mMuxerStarted) {
            MediaMuxerWrapper mediaMuxerWrapper;
            if (this.mWeakMuxer != null) {
                mediaMuxerWrapper = (MediaMuxerWrapper) this.mWeakMuxer.get();
            } else {
                mediaMuxerWrapper = null;
            }
            if (mediaMuxerWrapper != null) {
                try {
                    stop = mediaMuxerWrapper.stop();
                } catch (Throwable e2) {
                    Log.e(this.TAG, "failed stopping muxer", e2);
                    stop = true;
                }
                this.mIsCapturing = false;
                if (this.mListener != null) {
                    this.mListener.onStopped(this, stop);
                }
                this.mBufferInfo = null;
            }
        }
        stop = false;
        this.mIsCapturing = false;
        if (this.mListener != null) {
        }
        this.mBufferInfo = null;
    }

    protected void signalEndOfInputStream() {
        Log.d(this.TAG, "signalEndOfInputStream");
        encode(null, 0, getPTSUs());
    }

    protected void encode(ByteBuffer byteBuffer, int i, long j) {
        if (this.mIsCapturing) {
            ByteBuffer[] inputBuffers = this.mMediaCodec.getInputBuffers();
            while (this.mIsCapturing) {
                int dequeueInputBuffer = this.mMediaCodec.dequeueInputBuffer(FunctionParseBeautyBodySlimCount.TIP_INTERVAL_TIME);
                if (dequeueInputBuffer >= 0) {
                    ByteBuffer byteBuffer2 = inputBuffers[dequeueInputBuffer];
                    byteBuffer2.clear();
                    if (byteBuffer != null) {
                        byteBuffer2.put(byteBuffer);
                    }
                    if (i <= 0) {
                        this.mIsEOS = true;
                        Log.d(this.TAG, "send BUFFER_FLAG_END_OF_STREAM");
                        this.mMediaCodec.queueInputBuffer(dequeueInputBuffer, 0, 0, j, 4);
                    } else {
                        this.mMediaCodec.queueInputBuffer(dequeueInputBuffer, 0, i, j, 0);
                    }
                }
            }
        }
    }

    protected void drain() {
        MediaMuxerWrapper mediaMuxerWrapper = (MediaMuxerWrapper) this.mWeakMuxer.get();
        if (mediaMuxerWrapper == null) {
            Log.w(this.TAG, "muxer is unexpectedly null");
        } else if (this.mMediaCodec != null) {
            ByteBuffer[] outputBuffers = this.mMediaCodec.getOutputBuffers();
            int i = 0;
            loop0:
            while (this.mIsCapturing) {
                if (this.mSkipFrame) {
                    this.mSkipFrame = System.currentTimeMillis() < this.mFirstFrameTime;
                }
                try {
                    int dequeueOutputBuffer = this.mMediaCodec.dequeueOutputBuffer(this.mBufferInfo, FunctionParseBeautyBodySlimCount.TIP_INTERVAL_TIME);
                    if (dequeueOutputBuffer == -1) {
                        if (this.mIsEOS) {
                            continue;
                        } else {
                            i++;
                            if (i > 5) {
                                break;
                            }
                        }
                    } else if (dequeueOutputBuffer == -3) {
                        Log.d(this.TAG, "INFO_OUTPUT_BUFFERS_CHANGED");
                        outputBuffers = this.mMediaCodec.getOutputBuffers();
                    } else if (dequeueOutputBuffer == -2) {
                        Log.d(this.TAG, "INFO_OUTPUT_FORMAT_CHANGED");
                        if (this.mMuxerStarted) {
                            throw new RuntimeException("format changed twice");
                        }
                        boolean z;
                        this.mTrackIndex = mediaMuxerWrapper.addTrack(this.mMediaCodec.getOutputFormat());
                        synchronized (this.mSync) {
                            z = this.mRequestStop;
                        }
                        if (!z) {
                            this.mMuxerStarted = true;
                            if (!mediaMuxerWrapper.start()) {
                                synchronized (mediaMuxerWrapper) {
                                    while (!mediaMuxerWrapper.isStarted()) {
                                        try {
                                            mediaMuxerWrapper.wait(100);
                                            if (this.mRequestStop) {
                                            }
                                        } catch (InterruptedException e) {
                                        }
                                    }
                                }
                            }
                        }
                    } else if (dequeueOutputBuffer < 0) {
                        String str = this.TAG;
                        StringBuilder stringBuilder = new StringBuilder();
                        stringBuilder.append("drain: unexpected status: ");
                        stringBuilder.append(dequeueOutputBuffer);
                        Log.w(str, stringBuilder.toString());
                    } else {
                        ByteBuffer byteBuffer = outputBuffers[dequeueOutputBuffer];
                        if (byteBuffer != null) {
                            if ((this.mBufferInfo.flags & 2) != 0) {
                                Log.d(this.TAG, "drain: BUFFER_FLAG_CODEC_CONFIG");
                                this.mBufferInfo.size = 0;
                            }
                            if (this.mBufferInfo.size != 0) {
                                if (this.mMuxerStarted) {
                                    boolean z2;
                                    synchronized (this.mSync) {
                                        z2 = this.mRequestStop;
                                    }
                                    if (!(z2 || this.mSkipFrame)) {
                                        this.mBufferInfo.presentationTimeUs = getPTSUs();
                                        mediaMuxerWrapper.writeSampleData(this.mTrackIndex, byteBuffer, this.mBufferInfo);
                                        this.mFrame++;
                                        this.prevOutputPTSUs = this.mBufferInfo.presentationTimeUs;
                                    }
                                }
                                i = 0;
                            }
                            this.mMediaCodec.releaseOutputBuffer(dequeueOutputBuffer, false);
                            if ((this.mBufferInfo.flags & 4) != 0) {
                                this.mIsCapturing = false;
                                break;
                            }
                        } else {
                            StringBuilder stringBuilder2 = new StringBuilder();
                            stringBuilder2.append("encoderOutputBuffer ");
                            stringBuilder2.append(dequeueOutputBuffer);
                            stringBuilder2.append(" was null");
                            throw new RuntimeException(stringBuilder2.toString());
                        }
                    }
                } catch (IllegalStateException e2) {
                    String str2 = this.TAG;
                    StringBuilder stringBuilder3 = new StringBuilder();
                    stringBuilder3.append("dequeueOutputBuffer() failed:");
                    stringBuilder3.append(e2.getMessage());
                    Log.e(str2, stringBuilder3.toString());
                }
            }
        }
    }

    protected long getPTSUs() {
        long nanoTime = System.nanoTime() / 1000;
        if (nanoTime < this.prevOutputPTSUs) {
            return nanoTime + (this.prevOutputPTSUs - nanoTime);
        }
        return nanoTime;
    }
}
