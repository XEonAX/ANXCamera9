package com.xiaomi.camera.liveshot.encoder;

import android.media.AudioRecord;
import android.media.MediaCodec;
import android.media.MediaFormat;
import android.os.Handler;
import com.android.camera.log.Log;
import com.ss.android.ttve.utils.UIUtils;
import com.xiaomi.camera.liveshot.MediaCodecCapability;
import com.xiaomi.camera.liveshot.encoder.CircularMediaEncoder.Snapshot;
import java.io.IOException;
import java.nio.ByteBuffer;
import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.TimeUnit;

public class CircularAudioEncoder extends CircularMediaEncoder {
    private static boolean DEBUG = true;
    private static final int NOTIFICATION_PERIOD_SAMPLE_COUNT = 1440;
    private static final String TAG = CircularAudioEncoder.class.getSimpleName();
    private AudioRecord mAudioRecord;
    private final int mAudioRecordBufferSize;
    private final int mChannelCount = this.mDesiredMediaFormat.getInteger("channel-count");
    private final int mFrameBytes;
    private final int mNotificationPeriod;
    private byte[] mSampleBuffer;
    private long mSampleCount;
    private final int mSampleRate = this.mDesiredMediaFormat.getInteger("sample-rate");

    public CircularAudioEncoder(MediaFormat mediaFormat, long j, long j2) {
        super(mediaFormat, j, j2);
        int integer = this.mDesiredMediaFormat.getInteger("pcm-encoding");
        this.mFrameBytes = sampleBytes(integer) * this.mChannelCount;
        this.mNotificationPeriod = NOTIFICATION_PERIOD_SAMPLE_COUNT;
        this.mAudioRecordBufferSize = Math.max((this.mNotificationPeriod * this.mFrameBytes) * 4, AudioRecord.getMinBufferSize(this.mSampleRate, channelConfig(), integer));
        this.mSampleBuffer = new byte[this.mAudioRecordBufferSize];
        this.mAudioRecord = new AudioRecord(5, this.mSampleRate, channelConfig(), integer, this.mAudioRecordBufferSize);
        if (this.mAudioRecord.getRecordingState() != 0) {
            boolean z = false;
            try {
                this.mMediaCodec = MediaCodec.createByCodecName(MediaCodecCapability.HW_AUDIO_CODEC_AAC);
                z = true;
            } catch (IOException e) {
                Log.d(TAG, "HW AAC encoder not found fallback to default instead");
            }
            if (!z) {
                try {
                    this.mMediaCodec = MediaCodec.createEncoderByType(this.mDesiredMediaFormat.getString("mime"));
                } catch (IOException e2) {
                    StringBuilder stringBuilder = new StringBuilder();
                    stringBuilder.append("Failed to configure MediaCodec: ");
                    stringBuilder.append(e2);
                    throw new IllegalStateException(stringBuilder.toString());
                }
            }
            this.mIsInitialized = true;
            return;
        }
        this.mAudioRecord.release();
        throw new IllegalStateException("Failed to initialize AudioRecord");
    }

    public void doStart() {
        if (DEBUG) {
            Log.d(TAG, "start(): X");
        }
        if (!this.mIsInitialized) {
            Log.d(TAG, "start(): not initialized yet");
        } else if (this.mIsBuffering) {
            Log.d(TAG, "start(): encoder is already running");
        } else {
            this.mCircularBuffer.clear();
            this.mMediaCodec.configure(this.mDesiredMediaFormat, null, null, 1);
            this.mMediaCodec.setCallback(this, new Handler(this.mEncodingThread.getLooper()));
            super.doStart();
            this.mIsBuffering = true;
            this.mCurrentPresentationTimeUs = 0;
            try {
                this.mAudioRecord.startRecording();
                if (DEBUG) {
                    Log.d(TAG, "start(): X");
                }
            } catch (IllegalStateException e) {
                String str = TAG;
                StringBuilder stringBuilder = new StringBuilder();
                stringBuilder.append("startRecording(): failed ");
                stringBuilder.append(e);
                Log.e(str, stringBuilder.toString());
            }
        }
    }

    public void doStop() {
        String str;
        StringBuilder stringBuilder;
        if (DEBUG) {
            Log.d(TAG, "stop(): E");
        }
        if (!this.mIsInitialized) {
            Log.d(TAG, "stop(): not initialized yet");
        } else if (this.mIsBuffering) {
            this.mIsBuffering = false;
            super.doStop();
            if (DEBUG) {
                Log.d(TAG, "mAudioRecord.stop(): E");
            }
            try {
                this.mAudioRecord.stop();
            } catch (IllegalStateException e) {
                str = TAG;
                stringBuilder = new StringBuilder();
                stringBuilder.append("Meet exception when mAudioRecord.stop(): ");
                stringBuilder.append(e);
                Log.d(str, stringBuilder.toString());
            }
            if (DEBUG) {
                Log.d(TAG, "mAudioRecord.stop(): X");
            }
            if (DEBUG) {
                Log.d(TAG, "clear pending snapshot requests: E");
            }
            List<Snapshot> arrayList = new ArrayList();
            synchronized (this.mSnapshots) {
                arrayList.addAll(this.mSnapshots);
                this.mSnapshots.clear();
            }
            if (DEBUG) {
                str = TAG;
                stringBuilder = new StringBuilder();
                stringBuilder.append("cleared ");
                stringBuilder.append(arrayList.size());
                stringBuilder.append(" snapshot requests.");
                Log.d(str, stringBuilder.toString());
            }
            for (Snapshot putEos : arrayList) {
                try {
                    putEos.putEos();
                } catch (InterruptedException e2) {
                    String str2 = TAG;
                    StringBuilder stringBuilder2 = new StringBuilder();
                    stringBuilder2.append("Failed to putEos: ");
                    stringBuilder2.append(e2);
                    Log.d(str2, stringBuilder2.toString());
                }
            }
            if (DEBUG) {
                Log.d(TAG, "clear pending snapshot requests: X");
            }
            if (DEBUG) {
                Log.d(TAG, "stop() X");
            }
        }
    }

    public void doRelease() {
        if (this.mIsInitialized) {
            super.doRelease();
            try {
                this.mAudioRecord.release();
            } catch (IllegalStateException e) {
                String str = TAG;
                StringBuilder stringBuilder = new StringBuilder();
                stringBuilder.append("Meet exception when mAudioRecord.release(): ");
                stringBuilder.append(e);
                Log.d(str, stringBuilder.toString());
            }
            this.mIsInitialized = false;
        }
    }

    private int sampleBytes(int i) {
        switch (i) {
            case 2:
                return 2;
            case 3:
                return 1;
            default:
                throw new IllegalStateException("Specified Audio format is not supported.");
        }
    }

    private int channelConfig() {
        switch (this.mChannelCount) {
            case 1:
                return 16;
            case 2:
                return 12;
            default:
                return 16;
        }
    }

    private void addSampleCount(long j) {
        this.mSampleCount += j;
    }

    private long getPresentationTime(long j) {
        return (TimeUnit.SECONDS.toMicros(1) * (this.mSampleCount + j)) / ((long) this.mSampleRate);
    }

    private int getSampleDataBytes() {
        return this.mFrameBytes;
    }

    public void onInputBufferAvailable(MediaCodec mediaCodec, int i) {
        if (DEBUG) {
            Log.d(TAG, "audioCodec.onInputBufferAvailable(): E");
        }
        if (this.mIsBuffering) {
            Log.d(TAG, "audioCodec.dequeueInputBuffer(): E");
            ByteBuffer inputBuffer = mediaCodec.getInputBuffer(i);
            String str = TAG;
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.append("audioCodec.dequeueInputBuffer(");
            stringBuilder.append(i);
            stringBuilder.append("): X");
            Log.d(str, stringBuilder.toString());
            int i2 = 0;
            int read = this.mAudioRecord.read(this.mSampleBuffer, 0, Math.min(inputBuffer.limit(), this.mNotificationPeriod * this.mFrameBytes));
            if (read != 0) {
                switch (read) {
                    case UIUtils.LAYOUT_PARAMS_KEEP_OLD /*-3*/:
                        if (DEBUG) {
                            Log.d(TAG, "  ERROR_INVALID_OP");
                        }
                        return;
                    case -2:
                        if (DEBUG) {
                            Log.d(TAG, "  ERROR_BAD_VALUE");
                        }
                        return;
                    default:
                        Log.d(TAG, "audioCodec.queueInputBuffer(): E");
                        inputBuffer.clear();
                        inputBuffer.put(this.mSampleBuffer, 0, read);
                        int position = 0 + inputBuffer.position();
                        long sampleDataBytes = (long) (position / getSampleDataBytes());
                        long presentationTime = getPresentationTime(sampleDataBytes);
                        if (!this.mIsBuffering) {
                            i2 = 4;
                        }
                        this.mMediaCodec.queueInputBuffer(i, 0, position, presentationTime, i2);
                        addSampleCount(sampleDataBytes);
                        Log.d(TAG, "audioCodec.queueInputBuffer(): X");
                        if (DEBUG) {
                            Log.d(TAG, "audioCodec.onInputBufferAvailable(): X");
                        }
                        return;
                }
            }
            if (DEBUG) {
                Log.d(TAG, "  END_OF_BUFFER");
            }
            return;
        }
        Log.d(TAG, "audioCodec: already End of Stream");
        mediaCodec.queueInputBuffer(i, 0, 0, 0, 4);
    }
}
