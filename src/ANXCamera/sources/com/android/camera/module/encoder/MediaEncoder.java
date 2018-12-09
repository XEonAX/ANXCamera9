package com.android.camera.module.encoder;

import android.media.MediaCodec;
import android.media.MediaCodec.BufferInfo;
import com.android.camera.log.Log;
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
    void stopRecording() {
        /*
        r2 = this;
        r0 = r2.TAG;
        r1 = "stopRecording";
        com.android.camera.log.Log.d(r0, r1);
        r0 = r2.mSync;
        monitor-enter(r0);
        r1 = r2.mIsCapturing;	 Catch:{ all -> 0x0022 }
        if (r1 == 0) goto L_0x0020;
    L_0x000e:
        r1 = r2.mRequestStop;	 Catch:{ all -> 0x0022 }
        if (r1 == 0) goto L_0x0013;
    L_0x0012:
        goto L_0x0020;
    L_0x0013:
        r1 = 0;
        r2.mSkipFrame = r1;	 Catch:{ all -> 0x0022 }
        r1 = 1;
        r2.mRequestStop = r1;	 Catch:{ all -> 0x0022 }
        r1 = r2.mSync;	 Catch:{ all -> 0x0022 }
        r1.notifyAll();	 Catch:{ all -> 0x0022 }
        monitor-exit(r0);	 Catch:{ all -> 0x0022 }
        return;
    L_0x0020:
        monitor-exit(r0);	 Catch:{ all -> 0x0022 }
        return;
    L_0x0022:
        r1 = move-exception;
        monitor-exit(r0);	 Catch:{ all -> 0x0022 }
        throw r1;
        */
        throw new UnsupportedOperationException("Method not decompiled: com.android.camera.module.encoder.MediaEncoder.stopRecording():void");
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
    protected void release() {
        /*
        r5 = this;
        r0 = r5.mMediaCodec;
        r1 = 0;
        if (r0 == 0) goto L_0x001a;
    L_0x0005:
        r0 = r5.mMediaCodec;	 Catch:{ Exception -> 0x0012 }
        r0.stop();	 Catch:{ Exception -> 0x0012 }
        r0 = r5.mMediaCodec;	 Catch:{ Exception -> 0x0012 }
        r0.release();	 Catch:{ Exception -> 0x0012 }
        r5.mMediaCodec = r1;	 Catch:{ Exception -> 0x0012 }
        goto L_0x001a;
    L_0x0012:
        r0 = move-exception;
        r2 = r5.TAG;
        r3 = "failed releasing MediaCodec";
        com.android.camera.log.Log.e(r2, r3, r0);
        r0 = r5.mMuxerStarted;
        r2 = 0;
        if (r0 == 0) goto L_0x003f;
    L_0x0020:
        r0 = r5.mWeakMuxer;
        if (r0 == 0) goto L_0x002d;
    L_0x0024:
        r0 = r5.mWeakMuxer;
        r0 = r0.get();
        r0 = (com.android.camera.module.encoder.MediaMuxerWrapper) r0;
        goto L_0x002e;
    L_0x002d:
        r0 = r1;
    L_0x002e:
        if (r0 == 0) goto L_0x003f;
    L_0x0030:
        r0 = r0.stop();	 Catch:{ Exception -> 0x0035 }
        goto L_0x0040;
    L_0x0035:
        r0 = move-exception;
        r3 = r5.TAG;
        r4 = "failed stopping muxer";
        com.android.camera.log.Log.e(r3, r4, r0);
        r0 = 1;
        goto L_0x0040;
    L_0x003f:
        r0 = r2;
    L_0x0040:
        r5.mIsCapturing = r2;
        r2 = r5.mListener;
        if (r2 == 0) goto L_0x004b;
    L_0x0046:
        r2 = r5.mListener;
        r2.onStopped(r5, r0);
    L_0x004b:
        r5.mBufferInfo = r1;
        return;
        */
        throw new UnsupportedOperationException("Method not decompiled: com.android.camera.module.encoder.MediaEncoder.release():void");
    }

    protected void signalEndOfInputStream() {
        Log.d(this.TAG, "signalEndOfInputStream");
        encode(null, 0, getPTSUs());
    }

    protected void encode(ByteBuffer byteBuffer, int i, long j) {
        if (this.mIsCapturing) {
            ByteBuffer[] inputBuffers = this.mMediaCodec.getInputBuffers();
            while (this.mIsCapturing) {
                int dequeueInputBuffer = this.mMediaCodec.dequeueInputBuffer(10000);
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
                    int dequeueOutputBuffer = this.mMediaCodec.dequeueOutputBuffer(this.mBufferInfo, 10000);
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
