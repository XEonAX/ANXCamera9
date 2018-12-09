package com.xiaomi.camera.liveshot;

import android.media.CamcorderProfile;
import android.media.MediaCodec.BufferInfo;
import android.media.MediaFormat;
import android.media.MediaMuxer;
import android.opengl.EGLContext;
import android.support.annotation.NonNull;
import com.android.camera.CameraSettings;
import com.android.camera.Util;
import com.android.camera.effect.draw_mode.DrawExtTexAttribute;
import com.android.camera.log.Log;
import com.xiaomi.camera.liveshot.encoder.CircularAudioEncoder;
import com.xiaomi.camera.liveshot.encoder.CircularMediaEncoder.Sample;
import com.xiaomi.camera.liveshot.encoder.CircularMediaEncoder.Snapshot;
import com.xiaomi.camera.liveshot.encoder.CircularVideoEncoder;
import com.xiaomi.camera.liveshot.util.BackgroundTaskScheduler;
import com.xiaomi.camera.liveshot.util.BackgroundTaskScheduler.Cancellable;
import java.io.BufferedInputStream;
import java.io.ByteArrayOutputStream;
import java.io.FileInputStream;
import java.io.IOException;
import java.nio.ByteBuffer;
import java.util.concurrent.Executors;
import java.util.concurrent.atomic.AtomicBoolean;

public class CircularMediaRecorder {
    private static final int AUDIO_BIT_RATE = 64000;
    private static final int AUDIO_CHANNELS = 1;
    private static final int AUDIO_FORMAT = 2;
    private static final String AUDIO_MIME_TYPE = "audio/mp4a-latm";
    private static final int AUDIO_SAMPLE_RATE = 44100;
    private static final int BYTES_COPY_BUFFER_LENGTH = 2048;
    private static final long CAPTURE_DURATION_IN_MICROSECOND = 3000000;
    private static final boolean DEBUG = true;
    private static final int MOVIE_FILE_FORMAT = 0;
    private static final long PRE_CAPTURE_DURATION_IN_MICROSECOND = 1500000;
    private static final boolean SAVE_MICRO_VIDEO_IN_SDCARD = Util.saveLiveShotMicroVideoInSdcard();
    private static final String TAG = CircularMediaRecorder.class.getSimpleName();
    private static final int VIDEO_BIT_RATE = 20000000;
    private static final int VIDEO_FRAME_RATE = 15;
    private static final float VIDEO_IFRAME_INTERVAL = 0.5f;
    private static final String VIDEO_MIME_TYPE;
    private final CircularAudioEncoder mCircularAudioEncoder;
    private final CircularVideoEncoder mCircularVideoEncoder;
    private int mOrientationHint = 0;
    private final BackgroundTaskScheduler mSavingRequestScheduler;

    public interface VideoClipSavingCallback {
        void onVideoClipSavingCancelled();

        void onVideoClipSavingCompleted(@NonNull byte[] bArr, long j);

        void onVideoClipSavingException(@NonNull Throwable th);
    }

    private static final class VideoClipSavingRequest implements Cancellable {
        private final Snapshot mAudioSnapshot;
        private final AtomicBoolean mCancelled;
        private final int mOrientationHint;
        private final VideoClipSavingCallback mVideoClipSavingCallback;
        private final Snapshot mVideoSnapshot;

        private VideoClipSavingRequest(Snapshot snapshot, Snapshot snapshot2, int i, VideoClipSavingCallback videoClipSavingCallback) {
            this.mCancelled = new AtomicBoolean();
            if (snapshot2 == null && snapshot == null) {
                throw new IllegalStateException("At least one non-null snapshot should be provided");
            }
            this.mAudioSnapshot = snapshot;
            this.mVideoSnapshot = snapshot2;
            this.mOrientationHint = i;
            this.mVideoClipSavingCallback = videoClipSavingCallback;
        }

        public final void cancel() {
            this.mCancelled.set(true);
        }

        private boolean isCancelled() {
            return this.mCancelled.get();
        }

        /* JADX WARNING: Removed duplicated region for block: B:79:0x01b6 A:{SYNTHETIC, Splitter: B:79:0x01b6} */
        /* JADX WARNING: Removed duplicated region for block: B:89:0x01fa  */
        /* JADX WARNING: Removed duplicated region for block: B:85:0x01d9 A:{SKIP} */
        /* JADX WARNING: Removed duplicated region for block: B:61:0x014f A:{Catch:{ all -> 0x01b3 }} */
        /* JADX WARNING: Removed duplicated region for block: B:63:0x0156 A:{SYNTHETIC, Splitter: B:63:0x0156} */
        /* JADX WARNING: Removed duplicated region for block: B:71:0x0192 A:{SKIP} */
        /* JADX WARNING: Removed duplicated region for block: B:69:0x0179  */
        /* JADX WARNING: Removed duplicated region for block: B:79:0x01b6 A:{SYNTHETIC, Splitter: B:79:0x01b6} */
        /* JADX WARNING: Removed duplicated region for block: B:85:0x01d9 A:{SKIP} */
        /* JADX WARNING: Removed duplicated region for block: B:89:0x01fa  */
        /* JADX WARNING: Removed duplicated region for block: B:61:0x014f A:{Catch:{ all -> 0x01b3 }} */
        /* JADX WARNING: Removed duplicated region for block: B:63:0x0156 A:{SYNTHETIC, Splitter: B:63:0x0156} */
        /* JADX WARNING: Removed duplicated region for block: B:69:0x0179  */
        /* JADX WARNING: Removed duplicated region for block: B:71:0x0192 A:{SKIP} */
        public void run() {
            /*
            r12 = this;
            r0 = r12.isCancelled();
            if (r0 == 0) goto L_0x0019;
        L_0x0006:
            r0 = com.xiaomi.camera.liveshot.CircularMediaRecorder.TAG;
            r1 = "Saving request is requested to be cancelled before executing";
            com.android.camera.log.Log.d(r0, r1);
            r0 = r12.mVideoClipSavingCallback;
            if (r0 == 0) goto L_0x0018;
        L_0x0013:
            r0 = r12.mVideoClipSavingCallback;
            r0.onVideoClipSavingCancelled();
        L_0x0018:
            return;
            r0 = 0;
            r1 = com.xiaomi.camera.liveshot.CircularMediaRecorder.SAVE_MICRO_VIDEO_IN_SDCARD;	 Catch:{ Exception -> 0x012f, all -> 0x0129 }
            if (r1 == 0) goto L_0x002e;
        L_0x0022:
            r1 = new java.io.File;	 Catch:{ Exception -> 0x012f, all -> 0x0129 }
            r2 = android.os.Environment.getExternalStorageDirectory();	 Catch:{ Exception -> 0x012f, all -> 0x0129 }
            r3 = "microvideo.mp4";
            r1.<init>(r2, r3);	 Catch:{ Exception -> 0x012f, all -> 0x0129 }
            goto L_0x0036;
        L_0x002e:
            r1 = "microvideo";
            r2 = ".mp4";
            r1 = java.io.File.createTempFile(r1, r2);	 Catch:{ Exception -> 0x012f, all -> 0x0129 }
        L_0x0036:
            r2 = new android.media.MediaMuxer;	 Catch:{ Exception -> 0x0124, all -> 0x011e }
            r3 = r1.getPath();	 Catch:{ Exception -> 0x0124, all -> 0x011e }
            r4 = 0;
            r2.<init>(r3, r4);	 Catch:{ Exception -> 0x0124, all -> 0x011e }
            r0 = r12.mOrientationHint;	 Catch:{ Exception -> 0x011c }
            r2.setOrientationHint(r0);	 Catch:{ Exception -> 0x011c }
            r0 = r12.mVideoSnapshot;	 Catch:{ Exception -> 0x011c }
            r3 = -1;
            if (r0 == 0) goto L_0x0054;
        L_0x004b:
            r0 = r12.mVideoSnapshot;	 Catch:{ Exception -> 0x011c }
            r0 = r0.format;	 Catch:{ Exception -> 0x011c }
            r0 = r2.addTrack(r0);	 Catch:{ Exception -> 0x011c }
            goto L_0x0055;
        L_0x0054:
            r0 = r3;
        L_0x0055:
            r4 = r12.mAudioSnapshot;	 Catch:{ Exception -> 0x011c }
            if (r4 == 0) goto L_0x0062;
        L_0x0059:
            r4 = r12.mAudioSnapshot;	 Catch:{ Exception -> 0x011c }
            r4 = r4.format;	 Catch:{ Exception -> 0x011c }
            r4 = r2.addTrack(r4);	 Catch:{ Exception -> 0x011c }
            goto L_0x0063;
        L_0x0062:
            r4 = r3;
        L_0x0063:
            r2.start();	 Catch:{ Exception -> 0x011c }
            r5 = r12.mVideoSnapshot;	 Catch:{ Exception -> 0x011c }
            r6 = -1;
            if (r5 == 0) goto L_0x0093;
        L_0x006d:
            if (r0 == r3) goto L_0x0093;
        L_0x006f:
            r5 = r12.mVideoSnapshot;	 Catch:{ Exception -> 0x011c }
            r8 = writeVideoSamples(r2, r5, r0);	 Catch:{ Exception -> 0x011c }
            r0 = com.xiaomi.camera.liveshot.CircularMediaRecorder.TAG;	 Catch:{ Exception -> 0x011c }
            r5 = new java.lang.StringBuilder;	 Catch:{ Exception -> 0x011c }
            r5.<init>();	 Catch:{ Exception -> 0x011c }
            r10 = "VIDEO DURATION: ";
            r5.append(r10);	 Catch:{ Exception -> 0x011c }
            r5.append(r8);	 Catch:{ Exception -> 0x011c }
            r10 = " Usec";
            r5.append(r10);	 Catch:{ Exception -> 0x011c }
            r5 = r5.toString();	 Catch:{ Exception -> 0x011c }
            com.android.camera.log.Log.d(r0, r5);	 Catch:{ Exception -> 0x011c }
            goto L_0x0094;
        L_0x0093:
            r8 = r6;
        L_0x0094:
            r0 = r12.mAudioSnapshot;	 Catch:{ Exception -> 0x011c }
            if (r0 == 0) goto L_0x00bd;
        L_0x0098:
            if (r4 == r3) goto L_0x00bd;
        L_0x009a:
            r0 = r12.mAudioSnapshot;	 Catch:{ Exception -> 0x011c }
            r3 = writeAudioSamples(r2, r0, r4, r8);	 Catch:{ Exception -> 0x011c }
            r0 = com.xiaomi.camera.liveshot.CircularMediaRecorder.TAG;	 Catch:{ Exception -> 0x011c }
            r5 = new java.lang.StringBuilder;	 Catch:{ Exception -> 0x011c }
            r5.<init>();	 Catch:{ Exception -> 0x011c }
            r8 = "AUDIO DURATION: ";
            r5.append(r8);	 Catch:{ Exception -> 0x011c }
            r5.append(r3);	 Catch:{ Exception -> 0x011c }
            r3 = " Usec";
            r5.append(r3);	 Catch:{ Exception -> 0x011c }
            r3 = r5.toString();	 Catch:{ Exception -> 0x011c }
            com.android.camera.log.Log.d(r0, r3);	 Catch:{ Exception -> 0x011c }
        L_0x00bd:
            r2.stop();	 Catch:{ Exception -> 0x011c }
            r0 = r12.mVideoClipSavingCallback;	 Catch:{ Exception -> 0x011c }
            if (r0 == 0) goto L_0x00da;
        L_0x00c4:
            r0 = r1.getPath();	 Catch:{ Exception -> 0x011c }
            r0 = readFully(r0);	 Catch:{ Exception -> 0x011c }
            r3 = r12.mVideoClipSavingCallback;	 Catch:{ Exception -> 0x011c }
            r4 = r12.mVideoSnapshot;	 Catch:{ Exception -> 0x011c }
            if (r4 != 0) goto L_0x00d3;
        L_0x00d2:
            goto L_0x00d7;
        L_0x00d3:
            r4 = r12.mVideoSnapshot;	 Catch:{ Exception -> 0x011c }
            r6 = r4.curr;	 Catch:{ Exception -> 0x011c }
        L_0x00d7:
            r3.onVideoClipSavingCompleted(r0, r6);	 Catch:{ Exception -> 0x011c }
            r2.release();	 Catch:{ Exception -> 0x00df }
            goto L_0x00f8;
        L_0x00df:
            r0 = move-exception;
            r0 = com.xiaomi.camera.liveshot.CircularMediaRecorder.TAG;
            r3 = new java.lang.StringBuilder;
            r3.<init>();
            r4 = "Failed to release the media muxer: ";
            r3.append(r4);
            r3.append(r2);
            r2 = r3.toString();
            com.android.camera.log.Log.d(r0, r2);
        L_0x00f8:
            r0 = com.xiaomi.camera.liveshot.CircularMediaRecorder.SAVE_MICRO_VIDEO_IN_SDCARD;
            if (r0 == 0) goto L_0x0109;
        L_0x00fe:
            r0 = com.xiaomi.camera.liveshot.CircularMediaRecorder.TAG;
            r2 = new java.lang.StringBuilder;
            r2.<init>();
            goto L_0x0182;
        L_0x0109:
            if (r1 == 0) goto L_0x01b2;
        L_0x010b:
            r0 = r1.delete();
            if (r0 != 0) goto L_0x01b2;
        L_0x0111:
            r0 = com.xiaomi.camera.liveshot.CircularMediaRecorder.TAG;
            r2 = new java.lang.StringBuilder;
            r2.<init>();
            goto L_0x01a3;
        L_0x011c:
            r0 = move-exception;
            goto L_0x0133;
        L_0x011e:
            r2 = move-exception;
            r11 = r2;
            r2 = r0;
            r0 = r11;
            goto L_0x01b4;
        L_0x0124:
            r2 = move-exception;
            r11 = r2;
            r2 = r0;
            r0 = r11;
            goto L_0x0133;
        L_0x0129:
            r1 = move-exception;
            r2 = r0;
            r0 = r1;
            r1 = r2;
            goto L_0x01b4;
        L_0x012f:
            r1 = move-exception;
            r2 = r0;
            r0 = r1;
            r1 = r2;
        L_0x0133:
            r3 = com.xiaomi.camera.liveshot.CircularMediaRecorder.TAG;	 Catch:{ all -> 0x01b3 }
            r4 = new java.lang.StringBuilder;	 Catch:{ all -> 0x01b3 }
            r4.<init>();	 Catch:{ all -> 0x01b3 }
            r5 = "Failed to save the videoclip as an mp4 file: ";
            r4.append(r5);	 Catch:{ all -> 0x01b3 }
            r4.append(r0);	 Catch:{ all -> 0x01b3 }
            r4 = r4.toString();	 Catch:{ all -> 0x01b3 }
            com.android.camera.log.Log.d(r3, r4);	 Catch:{ all -> 0x01b3 }
            r3 = r12.mVideoClipSavingCallback;	 Catch:{ all -> 0x01b3 }
            if (r3 == 0) goto L_0x0154;
        L_0x014f:
            r3 = r12.mVideoClipSavingCallback;	 Catch:{ all -> 0x01b3 }
            r3.onVideoClipSavingException(r0);	 Catch:{ all -> 0x01b3 }
        L_0x0154:
            if (r2 == 0) goto L_0x0173;
        L_0x0156:
            r2.release();	 Catch:{ Exception -> 0x015a }
            goto L_0x0173;
        L_0x015a:
            r0 = move-exception;
            r0 = com.xiaomi.camera.liveshot.CircularMediaRecorder.TAG;
            r3 = new java.lang.StringBuilder;
            r3.<init>();
            r4 = "Failed to release the media muxer: ";
            r3.append(r4);
            r3.append(r2);
            r2 = r3.toString();
            com.android.camera.log.Log.d(r0, r2);
        L_0x0173:
            r0 = com.xiaomi.camera.liveshot.CircularMediaRecorder.SAVE_MICRO_VIDEO_IN_SDCARD;
            if (r0 == 0) goto L_0x0192;
        L_0x0179:
            r0 = com.xiaomi.camera.liveshot.CircularMediaRecorder.TAG;
            r2 = new java.lang.StringBuilder;
            r2.<init>();
        L_0x0182:
            r3 = "Ignore deleting the temporary mp4 file: ";
            r2.append(r3);
            r2.append(r1);
            r1 = r2.toString();
            com.android.camera.log.Log.d(r0, r1);
            goto L_0x01b2;
        L_0x0192:
            if (r1 == 0) goto L_0x01b2;
        L_0x0194:
            r0 = r1.delete();
            if (r0 != 0) goto L_0x01b2;
        L_0x019a:
            r0 = com.xiaomi.camera.liveshot.CircularMediaRecorder.TAG;
            r2 = new java.lang.StringBuilder;
            r2.<init>();
        L_0x01a3:
            r3 = "Failed to delete the temporary mp4 file: ";
            r2.append(r3);
            r2.append(r1);
            r1 = r2.toString();
            com.android.camera.log.Log.d(r0, r1);
        L_0x01b2:
            return;
        L_0x01b3:
            r0 = move-exception;
        L_0x01b4:
            if (r2 == 0) goto L_0x01d3;
        L_0x01b6:
            r2.release();	 Catch:{ Exception -> 0x01ba }
            goto L_0x01d3;
        L_0x01ba:
            r3 = move-exception;
            r3 = com.xiaomi.camera.liveshot.CircularMediaRecorder.TAG;
            r4 = new java.lang.StringBuilder;
            r4.<init>();
            r5 = "Failed to release the media muxer: ";
            r4.append(r5);
            r4.append(r2);
            r2 = r4.toString();
            com.android.camera.log.Log.d(r3, r2);
        L_0x01d3:
            r2 = com.xiaomi.camera.liveshot.CircularMediaRecorder.SAVE_MICRO_VIDEO_IN_SDCARD;
            if (r2 != 0) goto L_0x01fa;
        L_0x01d9:
            if (r1 == 0) goto L_0x0212;
        L_0x01db:
            r2 = r1.delete();
            if (r2 != 0) goto L_0x0212;
        L_0x01e1:
            r2 = com.xiaomi.camera.liveshot.CircularMediaRecorder.TAG;
            r3 = new java.lang.StringBuilder;
            r3.<init>();
            r4 = "Failed to delete the temporary mp4 file: ";
            r3.append(r4);
            r3.append(r1);
            r1 = r3.toString();
            com.android.camera.log.Log.d(r2, r1);
            goto L_0x0212;
        L_0x01fa:
            r2 = com.xiaomi.camera.liveshot.CircularMediaRecorder.TAG;
            r3 = new java.lang.StringBuilder;
            r3.<init>();
            r4 = "Ignore deleting the temporary mp4 file: ";
            r3.append(r4);
            r3.append(r1);
            r1 = r3.toString();
            com.android.camera.log.Log.d(r2, r1);
        L_0x0212:
            throw r0;
            */
            throw new UnsupportedOperationException("Method not decompiled: com.xiaomi.camera.liveshot.CircularMediaRecorder.VideoClipSavingRequest.run():void");
        }

        private static long writeVideoSamples(MediaMuxer mediaMuxer, Snapshot snapshot, int i) {
            Snapshot snapshot2 = snapshot;
            Log.e(CircularMediaRecorder.TAG, "SAVE VIDEO: E");
            long j = -1;
            Object obj = null;
            int i2 = 0;
            long j2 = 0;
            while (obj == null) {
                Log.d(CircularMediaRecorder.TAG, "VIDEO PACKET WAITING: E");
                MediaMuxer mediaMuxer2;
                try {
                    Sample sample = (Sample) snapshot2.samples.take();
                    Log.d(CircularMediaRecorder.TAG, "VIDEO PACKET WAITING: X");
                    ByteBuffer byteBuffer = sample.data;
                    BufferInfo bufferInfo = sample.info;
                    if ((bufferInfo.flags & 1) == 0 && i2 == 0) {
                        mediaMuxer2 = mediaMuxer;
                    } else {
                        if (j < bufferInfo.presentationTimeUs - j2) {
                            if (i2 == 0) {
                                j2 = bufferInfo.presentationTimeUs;
                                i2 = 1;
                            }
                            bufferInfo.presentationTimeUs -= j2;
                            mediaMuxer.writeSampleData(i, byteBuffer, bufferInfo);
                            j = bufferInfo.presentationTimeUs;
                            String access$100 = CircularMediaRecorder.TAG;
                            StringBuilder stringBuilder = new StringBuilder();
                            stringBuilder.append("WRITE VIDEO PACKET: time = ");
                            stringBuilder.append(bufferInfo.presentationTimeUs);
                            stringBuilder.append(", size = ");
                            stringBuilder.append(bufferInfo.size);
                            stringBuilder.append(", offset = ");
                            stringBuilder.append(bufferInfo.offset);
                            stringBuilder.append(", capacity = ");
                            stringBuilder.append(byteBuffer.capacity());
                            Log.d(access$100, stringBuilder.toString());
                        } else {
                            mediaMuxer2 = mediaMuxer;
                        }
                        obj = (byteBuffer.limit() == 0 || (bufferInfo.flags & 4) != 0) ? 1 : null;
                    }
                } catch (Throwable e) {
                    mediaMuxer2 = mediaMuxer;
                    Log.d(CircularMediaRecorder.TAG, "VIDEO PACKET WAITING INTERRUPTED", e);
                }
            }
            snapshot2.curr = Math.max(0, snapshot2.curr - j2);
            String access$1002 = CircularMediaRecorder.TAG;
            StringBuilder stringBuilder2 = new StringBuilder();
            stringBuilder2.append("VIDEO COVER FRAME TIMESTAMP: ");
            stringBuilder2.append(snapshot2.curr);
            Log.d(access$1002, stringBuilder2.toString());
            Log.e(CircularMediaRecorder.TAG, "SAVE VIDEO: X");
            return j;
        }

        private static long writeAudioSamples(MediaMuxer mediaMuxer, Snapshot snapshot, int i, long j) {
            long j2;
            Snapshot snapshot2 = snapshot;
            Log.e(CircularMediaRecorder.TAG, "SAVE AUDIO: E");
            if (j == -1) {
                j2 = CircularMediaRecorder.CAPTURE_DURATION_IN_MICROSECOND;
            } else {
                j2 = j;
            }
            long max = Math.max(0, snapshot2.tail - j2);
            long j3 = snapshot2.tail;
            long j4 = 0;
            Object obj = null;
            long j5 = -1;
            Object obj2 = null;
            while (obj2 == null) {
                Log.d(CircularMediaRecorder.TAG, "AUDIO PACKET WAITING: E");
                MediaMuxer mediaMuxer2;
                int i2;
                try {
                    Sample sample = (Sample) snapshot2.samples.take();
                    Log.d(CircularMediaRecorder.TAG, "AUDIO PACKET WAITING: X");
                    ByteBuffer byteBuffer = sample.data;
                    BufferInfo bufferInfo = sample.info;
                    if (bufferInfo.presentationTimeUs < max || j5 >= bufferInfo.presentationTimeUs - j4) {
                        mediaMuxer2 = mediaMuxer;
                        i2 = i;
                    } else {
                        if (obj == null) {
                            j4 = bufferInfo.presentationTimeUs;
                            obj = 1;
                        }
                        bufferInfo.presentationTimeUs -= j4;
                        if (bufferInfo.presentationTimeUs >= j3) {
                            bufferInfo.flags = 4;
                        }
                        mediaMuxer.writeSampleData(i, byteBuffer, bufferInfo);
                        j5 = bufferInfo.presentationTimeUs;
                        String access$100 = CircularMediaRecorder.TAG;
                        StringBuilder stringBuilder = new StringBuilder();
                        stringBuilder.append("WRITE AUDIO PACKET: time = ");
                        long j6 = j5;
                        stringBuilder.append(bufferInfo.presentationTimeUs);
                        stringBuilder.append(", size = ");
                        stringBuilder.append(bufferInfo.size);
                        stringBuilder.append(", offset = ");
                        stringBuilder.append(bufferInfo.offset);
                        stringBuilder.append(", capacity = ");
                        stringBuilder.append(byteBuffer.capacity());
                        Log.d(access$100, stringBuilder.toString());
                        j5 = j6;
                    }
                    if (byteBuffer.limit() == 0 || (bufferInfo.flags & 4) != 0) {
                        obj2 = 1;
                        snapshot2 = snapshot;
                    } else {
                        obj2 = null;
                        snapshot2 = snapshot;
                    }
                } catch (Throwable e) {
                    mediaMuxer2 = mediaMuxer;
                    i2 = i;
                    Log.d(CircularMediaRecorder.TAG, "AUDIO PACKET INTERRUPTED", e);
                }
            }
            Log.e(CircularMediaRecorder.TAG, "SAVE AUDIO: X");
            return j5;
        }

        private static byte[] readFully(String str) {
            Throwable th;
            Throwable th2;
            AutoCloseable bufferedInputStream;
            try {
                bufferedInputStream = new BufferedInputStream(new FileInputStream(str));
                AutoCloseable byteArrayOutputStream = new ByteArrayOutputStream();
                try {
                    byte[] bArr = new byte[2048];
                    while (true) {
                        int read = bufferedInputStream.read(bArr);
                        if (read < 0) {
                            bArr = byteArrayOutputStream.toByteArray();
                            $closeResource(null, byteArrayOutputStream);
                            $closeResource(null, bufferedInputStream);
                            return bArr;
                        }
                        byteArrayOutputStream.write(bArr, 0, read);
                    }
                } catch (Throwable th22) {
                    Throwable th3 = th22;
                    th22 = th;
                    th = th3;
                }
                $closeResource(th22, byteArrayOutputStream);
                throw th;
            } catch (IOException e) {
                String access$100 = CircularMediaRecorder.TAG;
                StringBuilder stringBuilder = new StringBuilder();
                stringBuilder.append("Failed to read the mp4 file content into memory: ");
                stringBuilder.append(e);
                Log.d(access$100, stringBuilder.toString());
                return new byte[0];
            } catch (Throwable th4) {
                $closeResource(r6, bufferedInputStream);
            }
        }

        private static /* synthetic */ void $closeResource(Throwable th, AutoCloseable autoCloseable) {
            if (th != null) {
                try {
                    autoCloseable.close();
                    return;
                } catch (Throwable th2) {
                    th.addSuppressed(th2);
                    return;
                }
            }
            autoCloseable.close();
        }
    }

    static {
        CamcorderProfile camcorderProfile = CamcorderProfile.get(6);
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("    audioBitRate: ");
        stringBuilder.append(camcorderProfile.audioBitRate);
        Log.d("QUALITY_1080P_PROFILE", stringBuilder.toString());
        stringBuilder = new StringBuilder();
        stringBuilder.append("   audioChannels: ");
        stringBuilder.append(camcorderProfile.audioChannels);
        Log.d("QUALITY_1080P_PROFILE", stringBuilder.toString());
        stringBuilder = new StringBuilder();
        stringBuilder.append(" audioSampleRate: ");
        stringBuilder.append(camcorderProfile.audioSampleRate);
        Log.d("QUALITY_1080P_PROFILE", stringBuilder.toString());
        stringBuilder = new StringBuilder();
        stringBuilder.append("      audioCodec: ");
        stringBuilder.append(camcorderProfile.audioCodec);
        Log.d("QUALITY_1080P_PROFILE", stringBuilder.toString());
        stringBuilder = new StringBuilder();
        stringBuilder.append(" videoFrameWidth: ");
        stringBuilder.append(camcorderProfile.videoFrameWidth);
        Log.d("QUALITY_1080P_PROFILE", stringBuilder.toString());
        stringBuilder = new StringBuilder();
        stringBuilder.append("videoFrameHeight: ");
        stringBuilder.append(camcorderProfile.videoFrameHeight);
        Log.d("QUALITY_1080P_PROFILE", stringBuilder.toString());
        stringBuilder = new StringBuilder();
        stringBuilder.append("    videoBitRate: ");
        stringBuilder.append(camcorderProfile.videoBitRate);
        Log.d("QUALITY_1080P_PROFILE", stringBuilder.toString());
        stringBuilder = new StringBuilder();
        stringBuilder.append("  videoFrameRate: ");
        stringBuilder.append(camcorderProfile.videoFrameRate);
        Log.d("QUALITY_1080P_PROFILE", stringBuilder.toString());
        stringBuilder = new StringBuilder();
        stringBuilder.append("      videoCodec: ");
        stringBuilder.append(camcorderProfile.videoCodec);
        Log.d("QUALITY_1080P_PROFILE", stringBuilder.toString());
        stringBuilder = new StringBuilder();
        stringBuilder.append("        duration: ");
        stringBuilder.append(camcorderProfile.duration);
        Log.d("QUALITY_1080P_PROFILE", stringBuilder.toString());
        if (CameraSettings.getVideoEncoder() == 5 && MediaCodecCapability.isH265EncodingSupported()) {
            VIDEO_MIME_TYPE = "video/hevc";
        } else {
            VIDEO_MIME_TYPE = "video/avc";
        }
    }

    public CircularMediaRecorder(int i, int i2, EGLContext eGLContext, boolean z) {
        this.mCircularVideoEncoder = new CircularVideoEncoder(createVideoFormat(i, i2), eGLContext, CAPTURE_DURATION_IN_MICROSECOND, PRE_CAPTURE_DURATION_IN_MICROSECOND);
        if (z) {
            this.mCircularAudioEncoder = new CircularAudioEncoder(createAudioFormat(AUDIO_SAMPLE_RATE, 1), CAPTURE_DURATION_IN_MICROSECOND, PRE_CAPTURE_DURATION_IN_MICROSECOND);
        } else {
            this.mCircularAudioEncoder = null;
        }
        this.mSavingRequestScheduler = new BackgroundTaskScheduler(Executors.newSingleThreadExecutor());
    }

    public void start() {
        Log.d(TAG, "start(): E");
        if (this.mCircularVideoEncoder != null) {
            this.mCircularVideoEncoder.start();
        }
        if (this.mCircularAudioEncoder != null) {
            this.mCircularAudioEncoder.start();
        }
        Log.d(TAG, "start(): X");
    }

    public void stop() {
        Log.d(TAG, "stop(): E");
        this.mSavingRequestScheduler.abortRemainingTasks();
        if (this.mCircularVideoEncoder != null) {
            this.mCircularVideoEncoder.stop();
        }
        if (this.mCircularAudioEncoder != null) {
            this.mCircularAudioEncoder.stop();
        }
        Log.d(TAG, "stop(): X");
    }

    public void release() {
        Log.d(TAG, "release(): E");
        if (this.mCircularVideoEncoder != null) {
            this.mCircularVideoEncoder.release();
        }
        if (this.mCircularAudioEncoder != null) {
            this.mCircularAudioEncoder.release();
        }
        Log.d(TAG, "release(): X");
    }

    public void onSurfaceTextureUpdated(DrawExtTexAttribute drawExtTexAttribute) {
        if (this.mCircularVideoEncoder != null) {
            this.mCircularVideoEncoder.onSurfaceTextureUpdated(drawExtTexAttribute);
        }
    }

    public void setFilterId(int i) {
        if (this.mCircularVideoEncoder != null) {
            this.mCircularVideoEncoder.setFilterId(i);
        }
    }

    public void setOrientationHint(int i) {
        this.mOrientationHint = i;
        String str = TAG;
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("setOrientationHint(): mOrientationHint = ");
        stringBuilder.append(i);
        Log.d(str, stringBuilder.toString());
    }

    public void snapshot(int i, VideoClipSavingCallback videoClipSavingCallback) {
        Snapshot snapshot;
        Snapshot snapshot2;
        if (this.mCircularAudioEncoder == null) {
            snapshot = null;
        } else {
            snapshot = this.mCircularAudioEncoder.snapshot();
        }
        if (this.mCircularVideoEncoder == null) {
            snapshot2 = null;
        } else {
            snapshot2 = this.mCircularVideoEncoder.snapshot();
        }
        if (i == -1) {
            i = this.mOrientationHint;
        }
        this.mSavingRequestScheduler.submit(new VideoClipSavingRequest(snapshot, snapshot2, i, videoClipSavingCallback));
    }

    private static MediaFormat createAudioFormat(int i, int i2) {
        MediaFormat createAudioFormat = MediaFormat.createAudioFormat(AUDIO_MIME_TYPE, i, i2);
        createAudioFormat.setInteger("aac-profile", 2);
        createAudioFormat.setInteger("bitrate", AUDIO_BIT_RATE);
        createAudioFormat.setInteger("channel-count", i2);
        createAudioFormat.setInteger("pcm-encoding", 2);
        return createAudioFormat;
    }

    private static MediaFormat createVideoFormat(int i, int i2) {
        MediaFormat createVideoFormat = MediaFormat.createVideoFormat(VIDEO_MIME_TYPE, i, i2);
        createVideoFormat.setInteger("color-format", 2130708361);
        createVideoFormat.setInteger("bitrate", VIDEO_BIT_RATE);
        createVideoFormat.setInteger("frame-rate", 15);
        createVideoFormat.setFloat("i-frame-interval", 0.5f);
        return createVideoFormat;
    }
}
