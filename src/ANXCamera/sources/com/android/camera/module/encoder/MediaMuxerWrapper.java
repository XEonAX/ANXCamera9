package com.android.camera.module.encoder;

import android.media.MediaCodec.BufferInfo;
import android.media.MediaFormat;
import android.media.MediaMuxer;
import android.os.ParcelFileDescriptor;
import com.android.camera.FileCompat;
import com.android.camera.log.Log;
import com.android.camera.storage.Storage;
import java.io.IOException;
import java.nio.ByteBuffer;

public class MediaMuxerWrapper {
    private static final String TAG = MediaMuxerWrapper.class.getSimpleName();
    private MediaEncoder mAudioEncoder;
    private int mEncoderCount;
    private boolean mIsStarted;
    private MediaMuxer mMediaMuxer;
    private int mStartedCount;
    private MediaEncoder mVideoEncoder;

    public MediaMuxerWrapper(String str) throws IOException {
        if (Storage.isUseDocumentMode()) {
            ParcelFileDescriptor parcelFileDescriptor;
            try {
                parcelFileDescriptor = FileCompat.getParcelFileDescriptor(str, true);
                this.mMediaMuxer = new MediaMuxer(parcelFileDescriptor.getFileDescriptor(), 0);
                if (parcelFileDescriptor != null) {
                    parcelFileDescriptor.close();
                }
            } catch (Throwable th) {
                String str2 = TAG;
                StringBuilder stringBuilder = new StringBuilder();
                stringBuilder.append("open file failed, path = ");
                stringBuilder.append(str);
                Log.w(str2, stringBuilder.toString(), th);
            } catch (Throwable th2) {
                r2.addSuppressed(th2);
            }
        } else {
            this.mMediaMuxer = new MediaMuxer(str, 0);
        }
        this.mEncoderCount = 0;
        this.mStartedCount = 0;
        this.mIsStarted = false;
    }

    public void prepare() throws IOException {
        if (this.mVideoEncoder != null) {
            this.mVideoEncoder.prepare();
        }
        if (this.mAudioEncoder != null) {
            this.mAudioEncoder.prepare();
        }
    }

    public boolean startRecording(long j) {
        String str = TAG;
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("startRecording: offset=");
        stringBuilder.append(j);
        Log.d(str, stringBuilder.toString());
        boolean z = this.mVideoEncoder == null || this.mVideoEncoder.startRecording(j);
        if (this.mAudioEncoder != null) {
            return this.mAudioEncoder.startRecording(j) && z;
        } else {
            return z;
        }
    }

    public void stopRecording() {
        Log.d(TAG, "stopRecording>>>");
        if (this.mAudioEncoder != null) {
            this.mAudioEncoder.stopRecording();
        }
        if (this.mVideoEncoder != null) {
            this.mVideoEncoder.stopRecording();
        }
        Log.d(TAG, "stopRecording<<<");
    }

    public void join() {
        Log.d(TAG, "join>>>");
        if (this.mAudioEncoder != null) {
            this.mAudioEncoder.join();
            this.mAudioEncoder = null;
        }
        if (this.mVideoEncoder != null) {
            this.mVideoEncoder.join();
            this.mVideoEncoder = null;
        }
        Log.d(TAG, "join<<<");
    }

    public synchronized boolean isStarted() {
        return this.mIsStarted;
    }

    public void setOrientationHint(int i) {
        this.mMediaMuxer.setOrientationHint(i);
    }

    public void setLocation(float f, float f2) {
        this.mMediaMuxer.setLocation(f, f2);
    }

    void addEncoder(MediaEncoder mediaEncoder) {
        if (mediaEncoder instanceof MediaVideoEncoder) {
            if (this.mVideoEncoder == null) {
                this.mVideoEncoder = mediaEncoder;
            } else {
                throw new IllegalArgumentException("video encoder already added!");
            }
        } else if (!(mediaEncoder instanceof MediaAudioEncoder)) {
            throw new IllegalArgumentException("unsupported encoder!");
        } else if (this.mAudioEncoder == null) {
            this.mAudioEncoder = mediaEncoder;
        } else {
            throw new IllegalArgumentException("audio encoder already added!");
        }
        int i = 0;
        int i2 = this.mVideoEncoder != null ? 1 : 0;
        if (this.mAudioEncoder != null) {
            i = 1;
        }
        this.mEncoderCount = i2 + i;
    }

    synchronized boolean start() {
        String str = TAG;
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("start: startedCount=");
        stringBuilder.append(this.mStartedCount);
        Log.d(str, stringBuilder.toString());
        this.mStartedCount++;
        if (this.mEncoderCount > 0 && this.mStartedCount == this.mEncoderCount) {
            this.mMediaMuxer.start();
            this.mIsStarted = true;
            notifyAll();
            Log.d(TAG, "MediaMuxer started");
        }
        return this.mIsStarted;
    }

    synchronized boolean stop() {
        boolean z;
        String str = TAG;
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("stop: startedCount=");
        stringBuilder.append(this.mStartedCount);
        Log.d(str, stringBuilder.toString());
        z = true;
        this.mStartedCount--;
        if (this.mEncoderCount > 0 && this.mStartedCount <= 0) {
            this.mMediaMuxer.stop();
            this.mMediaMuxer.release();
            this.mIsStarted = false;
            Log.v(TAG, "MediaMuxer stopped");
        }
        if (this.mStartedCount > 0) {
            z = false;
        }
        return z;
    }

    synchronized int addTrack(MediaFormat mediaFormat) {
        int addTrack;
        if (this.mIsStarted) {
            throw new IllegalStateException("muxer already started");
        }
        addTrack = this.mMediaMuxer.addTrack(mediaFormat);
        String str = TAG;
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("addTrack: trackNum=");
        stringBuilder.append(this.mEncoderCount);
        stringBuilder.append(" trackIndex=");
        stringBuilder.append(addTrack);
        stringBuilder.append(" format=");
        stringBuilder.append(mediaFormat);
        Log.v(str, stringBuilder.toString());
        return addTrack;
    }

    synchronized void writeSampleData(int i, ByteBuffer byteBuffer, BufferInfo bufferInfo) {
        if (this.mStartedCount > 0) {
            this.mMediaMuxer.writeSampleData(i, byteBuffer, bufferInfo);
        }
    }
}
