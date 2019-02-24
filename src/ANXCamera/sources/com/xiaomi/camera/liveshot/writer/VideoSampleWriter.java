package com.xiaomi.camera.liveshot.writer;

import android.media.MediaCodec.BufferInfo;
import android.media.MediaMuxer;
import com.android.camera.log.Log;
import com.xiaomi.camera.liveshot.encoder.CircularMediaEncoder.Sample;
import com.xiaomi.camera.liveshot.encoder.CircularMediaEncoder.Snapshot;
import com.xiaomi.camera.liveshot.writer.SampleWriter.StatusNotifier;
import java.nio.ByteBuffer;

public class VideoSampleWriter extends SampleWriter {
    private static final boolean DEBUG = true;
    private static final String TAG = VideoSampleWriter.class.getSimpleName();
    private final MediaMuxer mMediaMuxer;
    private final StatusNotifier<Long> mVideoFirstKeyFrameArrivedNotifier;
    private final Snapshot mVideoSnapshot;
    private final int mVideoTrackId;

    public VideoSampleWriter(MediaMuxer mediaMuxer, Snapshot snapshot, int i, StatusNotifier<Long> statusNotifier) {
        this.mMediaMuxer = mediaMuxer;
        this.mVideoSnapshot = snapshot;
        this.mVideoTrackId = i;
        this.mVideoFirstKeyFrameArrivedNotifier = statusNotifier;
    }

    protected void writeSample() {
        Log.d(TAG, "writeVideoSamples: E");
        long j = this.mVideoSnapshot.head;
        long j2 = this.mVideoSnapshot.tail;
        String str = TAG;
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("writeAudioSamples: head timestamp: ");
        stringBuilder.append(this.mVideoSnapshot.head);
        stringBuilder.append(":");
        stringBuilder.append(j);
        Log.d(str, stringBuilder.toString());
        str = TAG;
        stringBuilder = new StringBuilder();
        stringBuilder.append("writeAudioSamples: tail timestamp: ");
        stringBuilder.append(this.mVideoSnapshot.tail);
        stringBuilder.append(":");
        stringBuilder.append(j2);
        Log.d(str, stringBuilder.toString());
        long j3 = -1;
        Object obj = null;
        long j4 = 0;
        Object obj2 = null;
        while (obj == null) {
            Log.d(TAG, "writeVideoSamples: take: E");
            long j5;
            try {
                Sample sample = (Sample) this.mVideoSnapshot.samples.take();
                Log.d(TAG, "writeVideoSamples: take: X");
                ByteBuffer byteBuffer = sample.data;
                BufferInfo bufferInfo = sample.info;
                if ((bufferInfo.flags & 1) == 0 && obj2 == null) {
                    String str2 = TAG;
                    StringBuilder stringBuilder2 = new StringBuilder();
                    stringBuilder2.append("writeVideoSamples: drop non-key frame sample timestamp: ");
                    stringBuilder2.append(bufferInfo.presentationTimeUs);
                    Log.d(str2, stringBuilder2.toString());
                    j5 = j;
                    j = j5;
                } else {
                    if (bufferInfo.presentationTimeUs >= j) {
                        ByteBuffer byteBuffer2 = byteBuffer;
                        if (j3 < bufferInfo.presentationTimeUs - j4) {
                            if (obj2 == null) {
                                j4 = bufferInfo.presentationTimeUs;
                                this.mVideoSnapshot.offset = j4 - this.mVideoSnapshot.head;
                                if (this.mVideoFirstKeyFrameArrivedNotifier != null) {
                                    this.mVideoFirstKeyFrameArrivedNotifier.notify(Long.valueOf(this.mVideoSnapshot.offset));
                                }
                                String str3 = TAG;
                                StringBuilder stringBuilder3 = new StringBuilder();
                                stringBuilder3.append("writeVideoSamples: first video sample timestamp: ");
                                stringBuilder3.append(j4);
                                Log.d(str3, stringBuilder3.toString());
                                obj2 = 1;
                            }
                            if (bufferInfo.presentationTimeUs >= j2) {
                                Log.d(TAG, "writeVideoSamples: stop writing as reaching the ending timestamp");
                                bufferInfo.flags = 4;
                            }
                            bufferInfo.presentationTimeUs -= j4;
                            byteBuffer = byteBuffer2;
                            this.mMediaMuxer.writeSampleData(this.mVideoTrackId, byteBuffer, bufferInfo);
                            long j6 = bufferInfo.presentationTimeUs;
                            String str4 = TAG;
                            StringBuilder stringBuilder4 = new StringBuilder();
                            stringBuilder4.append("writeVideoSamples: video sample timestamp: ");
                            j5 = j;
                            stringBuilder4.append(bufferInfo.presentationTimeUs + j4);
                            Log.d(str4, stringBuilder4.toString());
                            j3 = j6;
                        } else {
                            j5 = j;
                            byteBuffer = byteBuffer2;
                        }
                    } else {
                        j5 = j;
                    }
                    if (byteBuffer.limit() == 0 || (bufferInfo.flags & 4) != 0) {
                        obj = 1;
                        j = j5;
                    } else {
                        obj = null;
                        j = j5;
                    }
                }
            } catch (InterruptedException e) {
                j5 = j;
                Log.d(TAG, "writeVideoSamples: take: meet interrupted exception");
            }
        }
        this.mVideoSnapshot.time = Math.max(0, this.mVideoSnapshot.time - j4);
        str = TAG;
        StringBuilder stringBuilder5 = new StringBuilder();
        stringBuilder5.append("writeVideoSamples: cover frame timestamp: ");
        stringBuilder5.append(this.mVideoSnapshot.time);
        Log.d(str, stringBuilder5.toString());
        str = TAG;
        stringBuilder5 = new StringBuilder();
        stringBuilder5.append("writeVideoSamples: X: duration: ");
        stringBuilder5.append(j3);
        Log.d(str, stringBuilder5.toString());
        str = TAG;
        stringBuilder5 = new StringBuilder();
        stringBuilder5.append("writeVideoSamples: X: offset: ");
        stringBuilder5.append(this.mVideoSnapshot.offset);
        Log.d(str, stringBuilder5.toString());
    }
}
