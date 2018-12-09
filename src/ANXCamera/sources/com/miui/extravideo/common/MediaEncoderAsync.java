package com.miui.extravideo.common;

import android.media.MediaCodec;
import android.media.MediaCodec.BufferInfo;
import android.media.MediaCodec.Callback;
import android.media.MediaCodec.CodecException;
import android.media.MediaFormat;
import android.media.MediaMuxer;
import android.os.Handler;
import android.os.Looper;
import android.support.annotation.NonNull;
import android.text.TextUtils;
import android.util.Log;
import com.miui.extravideo.interpolation.EncodeBufferHolder;
import java.lang.Thread.State;
import java.nio.ByteBuffer;

public class MediaEncoderAsync {
    private static final int FRAME_RATE = 30;
    private static final float I_FRAME_INTERVAL = 1.0f;
    private static final String MIME_TYPE = "video/avc";
    private static final String TAG = "MediaEncoderAsync";
    private final int mDegree;
    private EncodeBufferHolder mEncodeBufferHolder;
    private MediaCodec mEncoder;
    private Handler mHandler;
    private final int mHeight;
    private Exception mInitException;
    private EncodeUpdateListener mListener;
    private int mTrackIndex;
    private final int mWidth;
    private MediaMuxer mediaMuxer;

    private class CustomCallback extends Callback {
        private CustomCallback() {
        }

        /* synthetic */ CustomCallback(MediaEncoderAsync mediaEncoderAsync, AnonymousClass1 anonymousClass1) {
            this();
        }

        public void onInputBufferAvailable(@NonNull MediaCodec mediaCodec, int i) {
            try {
                if (MediaEncoderAsync.this.mListener != null) {
                    MediaEncoderAsync.this.mListener.onInputBufferAvailable(MediaEncoderAsync.this.mEncodeBufferHolder);
                }
                Log.d(MediaEncoderAsync.TAG, "onInputBufferAvailable");
                if (MediaEncoderAsync.this.mEncodeBufferHolder.flag == 4) {
                    MediaEncoderAsync.this.mEncoder.queueInputBuffer(i, 0, 0, 0, 4);
                } else if (MediaEncoderAsync.this.mEncodeBufferHolder.data != null) {
                    ByteBuffer inputBuffer = MediaEncoderAsync.this.mEncoder.getInputBuffer(i);
                    inputBuffer.clear();
                    inputBuffer.put(MediaEncoderAsync.this.mEncodeBufferHolder.data);
                    MediaEncoderAsync.this.mEncoder.queueInputBuffer(i, 0, MediaEncoderAsync.this.mEncodeBufferHolder.data.length, MediaEncoderAsync.this.mEncodeBufferHolder.presentationTimeUs, MediaEncoderAsync.this.mEncodeBufferHolder.flag);
                } else {
                    MediaEncoderAsync.this.mEncoder.queueInputBuffer(i, 0, 0, 0, 0);
                }
            } catch (Throwable e) {
                Log.d(MediaEncoderAsync.TAG, "onInputBufferAvailable exception", e);
            }
        }

        public void onOutputBufferAvailable(@NonNull MediaCodec mediaCodec, int i, @NonNull BufferInfo bufferInfo) {
            try {
                ByteBuffer outputBuffer = MediaEncoderAsync.this.mEncoder.getOutputBuffer(i);
                if (bufferInfo.size != 0) {
                    outputBuffer.position(bufferInfo.offset);
                    outputBuffer.limit(bufferInfo.offset + bufferInfo.size);
                    String str = MediaEncoderAsync.TAG;
                    StringBuilder stringBuilder = new StringBuilder();
                    stringBuilder.append("BufferInfo: ");
                    stringBuilder.append(bufferInfo.offset);
                    stringBuilder.append(",");
                    stringBuilder.append(bufferInfo.size);
                    stringBuilder.append(",");
                    stringBuilder.append(bufferInfo.presentationTimeUs);
                    Log.d(str, stringBuilder.toString());
                    try {
                        MediaEncoderAsync.this.mediaMuxer.writeSampleData(MediaEncoderAsync.this.mTrackIndex, outputBuffer, bufferInfo);
                    } catch (Throwable e) {
                        Log.i(MediaEncoderAsync.TAG, "Too many frames", e);
                    }
                    MediaEncoderAsync.this.mEncoder.releaseOutputBuffer(i, false);
                }
                if ((bufferInfo.flags & 4) != 0) {
                    Log.i(MediaEncoderAsync.TAG, "end of stream reached");
                    if (MediaEncoderAsync.this.mListener != null) {
                        MediaEncoderAsync.this.mListener.onEncodeEnd(true);
                    }
                }
            } catch (Throwable e2) {
                Log.d(MediaEncoderAsync.TAG, "onOutputBufferAvailable exception", e2);
            }
        }

        public void onError(@NonNull MediaCodec mediaCodec, @NonNull CodecException codecException) {
            Log.d(MediaEncoderAsync.TAG, "onError", codecException);
            if (MediaEncoderAsync.this.mListener != null) {
                MediaEncoderAsync.this.mListener.onError();
            }
        }

        public void onOutputFormatChanged(@NonNull MediaCodec mediaCodec, @NonNull MediaFormat mediaFormat) {
            MediaEncoderAsync.this.mTrackIndex = MediaEncoderAsync.this.mediaMuxer.addTrack(MediaEncoderAsync.this.mEncoder.getOutputFormat());
            MediaEncoderAsync.this.mediaMuxer.start();
        }
    }

    public interface EncodeUpdateListener {
        void onEncodeEnd(boolean z);

        void onError();

        void onInputBufferAvailable(EncodeBufferHolder encodeBufferHolder);
    }

    public MediaEncoderAsync(int i, int i2, int i3, String str, String str2) {
        this(i, i2, i3, str, str2, null);
    }

    public MediaEncoderAsync(int i, int i2, int i3, String str, String str2, Handler handler) {
        this.mTrackIndex = -1;
        this.mEncodeBufferHolder = new EncodeBufferHolder();
        this.mHandler = handler;
        this.mWidth = i;
        this.mHeight = i2;
        this.mDegree = i3;
        if (TextUtils.isEmpty(str)) {
            str = MIME_TYPE;
        }
        MediaFormat createVideoFormat = MediaFormat.createVideoFormat(str, this.mWidth, this.mHeight);
        createVideoFormat.setInteger("color-format", 2135033992);
        createVideoFormat.setInteger("frame-rate", 30);
        createVideoFormat.setInteger("bitrate", (this.mWidth * this.mHeight) * 10);
        createVideoFormat.setFloat("i-frame-interval", 1.0f);
        try {
            this.mEncoder = MediaCodec.createEncoderByType(str);
            this.mEncoder.setCallback(new CustomCallback(this, null), handler);
            this.mEncoder.configure(createVideoFormat, null, null, 1);
            this.mediaMuxer = new MediaMuxer(str2, 0);
            this.mediaMuxer.setOrientationHint(this.mDegree);
        } catch (Exception e) {
            this.mInitException = e;
        }
    }

    public void start() throws Exception {
        if (this.mInitException == null) {
            this.mEncoder.start();
            return;
        }
        throw this.mInitException;
    }

    public void release() {
        if (this.mEncoder != null) {
            this.mEncoder.stop();
            this.mEncoder.release();
            this.mEncoder = null;
        }
        if (this.mediaMuxer != null) {
            try {
                this.mediaMuxer.stop();
            } catch (Exception e) {
            }
            this.mediaMuxer.release();
            this.mediaMuxer = null;
        }
    }

    public void stop() {
        this.mEncoder.stop();
        if (this.mListener == null) {
            return;
        }
        if (this.mHandler == null || this.mHandler.getLooper() == Looper.myLooper()) {
            this.mListener.onEncodeEnd(false);
            return;
        }
        this.mHandler.post(new Runnable() {
            public void run() {
                if (MediaEncoderAsync.this.mListener != null) {
                    MediaEncoderAsync.this.mListener.onEncodeEnd(false);
                }
            }
        });
        Thread thread = this.mHandler.getLooper().getThread();
        if (thread.getState() == State.WAITING) {
            thread.interrupt();
        }
    }

    public int getFrameRate() {
        return 30;
    }

    public void setListener(EncodeUpdateListener encodeUpdateListener) {
        this.mListener = encodeUpdateListener;
    }
}
