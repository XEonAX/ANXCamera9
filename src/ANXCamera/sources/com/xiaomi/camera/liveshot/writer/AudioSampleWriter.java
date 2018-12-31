package com.xiaomi.camera.liveshot.writer;

import android.media.MediaCodec.BufferInfo;
import android.media.MediaMuxer;
import com.android.camera.log.Log;
import com.xiaomi.camera.liveshot.encoder.CircularMediaEncoder.Sample;
import com.xiaomi.camera.liveshot.encoder.CircularMediaEncoder.Snapshot;
import com.xiaomi.camera.liveshot.writer.SampleWriter.StatusNotifier;
import java.nio.ByteBuffer;

public class AudioSampleWriter extends SampleWriter {
    private static final boolean DEBUG = true;
    private static final String TAG = AudioSampleWriter.class.getSimpleName();
    private final Snapshot mAudioSnapshot;
    private final int mAudioTrackId;
    private final MediaMuxer mMediaMuxer;
    private final StatusNotifier<Long> mVideoFirstKeyFrameArrivedNotifier;

    public AudioSampleWriter(MediaMuxer mediaMuxer, Snapshot snapshot, int i, StatusNotifier<Long> statusNotifier) {
        this.mMediaMuxer = mediaMuxer;
        this.mAudioSnapshot = snapshot;
        this.mAudioTrackId = i;
        this.mVideoFirstKeyFrameArrivedNotifier = statusNotifier;
    }

    protected void writeSample() {
        long longValue;
        Log.d(TAG, "writeAudioSamples: E");
        if (this.mVideoFirstKeyFrameArrivedNotifier != null) {
            longValue = ((Long) this.mVideoFirstKeyFrameArrivedNotifier.getStatus()).longValue();
        } else {
            longValue = 0;
        }
        long j = this.mAudioSnapshot.head;
        if (longValue < 0) {
            longValue = 0;
        }
        j += longValue;
        longValue = this.mAudioSnapshot.tail;
        String str = TAG;
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("writeAudioSamples: head timestamp: ");
        stringBuilder.append(this.mAudioSnapshot.head);
        stringBuilder.append(":");
        stringBuilder.append(j);
        Log.d(str, stringBuilder.toString());
        str = TAG;
        stringBuilder = new StringBuilder();
        stringBuilder.append("writeAudioSamples: tail timestamp: ");
        stringBuilder.append(this.mAudioSnapshot.tail);
        stringBuilder.append(":");
        stringBuilder.append(longValue);
        Log.d(str, stringBuilder.toString());
        long j2 = -1;
        long j3 = 0;
        Object obj = null;
        Object obj2 = obj;
        while (obj == null) {
            Log.d(TAG, "writeAudioSamples: take: E");
            long j4;
            try {
                Sample sample = (Sample) this.mAudioSnapshot.samples.take();
                Log.d(TAG, "writeAudioSamples: take: X");
                ByteBuffer byteBuffer = sample.data;
                BufferInfo bufferInfo = sample.info;
                if (bufferInfo.presentationTimeUs < j || j2 >= bufferInfo.presentationTimeUs - j3) {
                    j4 = longValue;
                } else {
                    if (obj2 == null) {
                        j3 = bufferInfo.presentationTimeUs;
                        this.mAudioSnapshot.offset = j3 - this.mAudioSnapshot.head;
                        String str2 = TAG;
                        stringBuilder = new StringBuilder();
                        stringBuilder.append("writeAudioSamples: first audio sample timestamp: ");
                        stringBuilder.append(j3);
                        Log.d(str2, stringBuilder.toString());
                        obj2 = 1;
                    }
                    if (bufferInfo.presentationTimeUs >= longValue) {
                        Log.d(TAG, "writeAudioSamples: stop writing as reaching the ending timestamp");
                        bufferInfo.flags = 4;
                    }
                    bufferInfo.presentationTimeUs -= j3;
                    this.mMediaMuxer.writeSampleData(this.mAudioTrackId, byteBuffer, bufferInfo);
                    j2 = bufferInfo.presentationTimeUs;
                    String str3 = TAG;
                    StringBuilder stringBuilder2 = new StringBuilder();
                    stringBuilder2.append("writeAudioSamples: audio sample timestamp: ");
                    Object obj3 = obj2;
                    j4 = longValue;
                    stringBuilder2.append(bufferInfo.presentationTimeUs + j3);
                    Log.d(str3, stringBuilder2.toString());
                    obj2 = obj3;
                }
                if (byteBuffer.limit() == 0 || (bufferInfo.flags & 4) != 0) {
                    obj = 1;
                    longValue = j4;
                } else {
                    obj = null;
                    longValue = j4;
                }
            } catch (InterruptedException e) {
                j4 = longValue;
                Log.d(TAG, "writeAudioSamples: take: meet interrupted exception");
            }
        }
        str = TAG;
        StringBuilder stringBuilder3 = new StringBuilder();
        stringBuilder3.append("writeAudioSamples: X: duration: ");
        stringBuilder3.append(j2);
        Log.d(str, stringBuilder3.toString());
        str = TAG;
        stringBuilder3 = new StringBuilder();
        stringBuilder3.append("writeAudioSamples: X: offset: ");
        stringBuilder3.append(this.mAudioSnapshot.offset);
        Log.d(str, stringBuilder3.toString());
    }
}
