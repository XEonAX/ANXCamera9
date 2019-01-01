package com.xiaomi.camera.liveshot;

import android.media.CamcorderProfile;
import android.media.MediaCodec.BufferInfo;
import android.media.MediaFormat;
import android.media.MediaMuxer;
import android.opengl.EGLContext;
import android.os.Environment;
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
import java.io.File;
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
        /* Code decompiled incorrectly, please refer to instructions dump. */
        public void run() {
            MediaMuxer mediaMuxer;
            Throwable th;
            Throwable e;
            String access$100;
            StringBuilder stringBuilder;
            StringBuilder stringBuilder2;
            if (isCancelled()) {
                Log.d(CircularMediaRecorder.TAG, "Saving request is requested to be cancelled before executing");
                if (this.mVideoClipSavingCallback != null) {
                    this.mVideoClipSavingCallback.onVideoClipSavingCancelled();
                }
                return;
            }
            File file;
            String access$1002;
            StringBuilder stringBuilder3;
            try {
                if (CircularMediaRecorder.SAVE_MICRO_VIDEO_IN_SDCARD) {
                    file = new File(Environment.getExternalStorageDirectory(), "microvideo.mp4");
                } else {
                    file = File.createTempFile("microvideo", ".mp4");
                }
                try {
                    mediaMuxer = new MediaMuxer(file.getPath(), 0);
                } catch (Throwable e2) {
                    th = e2;
                    mediaMuxer = null;
                    e = th;
                    try {
                        access$100 = CircularMediaRecorder.TAG;
                        stringBuilder = new StringBuilder();
                        stringBuilder.append("Failed to save the videoclip as an mp4 file: ");
                        stringBuilder.append(e);
                        Log.d(access$100, stringBuilder.toString());
                        if (this.mVideoClipSavingCallback != null) {
                        }
                        if (mediaMuxer != null) {
                        }
                        if (CircularMediaRecorder.SAVE_MICRO_VIDEO_IN_SDCARD) {
                        }
                    } catch (Throwable th2) {
                        e = th2;
                        if (mediaMuxer != null) {
                            try {
                                mediaMuxer.release();
                            } catch (Exception e3) {
                                access$100 = CircularMediaRecorder.TAG;
                                stringBuilder = new StringBuilder();
                                stringBuilder.append("Failed to release the media muxer: ");
                                stringBuilder.append(mediaMuxer);
                                Log.d(access$100, stringBuilder.toString());
                            }
                        }
                        String access$1003;
                        if (CircularMediaRecorder.SAVE_MICRO_VIDEO_IN_SDCARD) {
                            access$1003 = CircularMediaRecorder.TAG;
                            stringBuilder2 = new StringBuilder();
                            stringBuilder2.append("Ignore deleting the temporary mp4 file: ");
                            stringBuilder2.append(file);
                            Log.d(access$1003, stringBuilder2.toString());
                        } else if (!(file == null || file.delete())) {
                            access$1003 = CircularMediaRecorder.TAG;
                            stringBuilder2 = new StringBuilder();
                            stringBuilder2.append("Failed to delete the temporary mp4 file: ");
                            stringBuilder2.append(file);
                            Log.d(access$1003, stringBuilder2.toString());
                        }
                        throw e;
                    }
                } catch (Throwable e22) {
                    th = e22;
                    mediaMuxer = null;
                    e = th;
                    if (mediaMuxer != null) {
                    }
                    if (CircularMediaRecorder.SAVE_MICRO_VIDEO_IN_SDCARD) {
                    }
                    throw e;
                }
                try {
                    int addTrack;
                    int addTrack2;
                    long j;
                    StringBuilder stringBuilder4;
                    mediaMuxer.setOrientationHint(this.mOrientationHint);
                    if (this.mVideoSnapshot != null) {
                        addTrack = mediaMuxer.addTrack(this.mVideoSnapshot.format);
                    } else {
                        addTrack = -1;
                    }
                    if (this.mAudioSnapshot != null) {
                        addTrack2 = mediaMuxer.addTrack(this.mAudioSnapshot.format);
                    } else {
                        addTrack2 = -1;
                    }
                    mediaMuxer.start();
                    long j2 = -1;
                    if (this.mVideoSnapshot == null || addTrack == -1) {
                        j = -1;
                    } else {
                        j = writeVideoSamples(mediaMuxer, this.mVideoSnapshot, addTrack);
                        access$1002 = CircularMediaRecorder.TAG;
                        stringBuilder4 = new StringBuilder();
                        stringBuilder4.append("VIDEO DURATION: ");
                        stringBuilder4.append(j);
                        stringBuilder4.append(" Usec");
                        Log.d(access$1002, stringBuilder4.toString());
                    }
                    if (!(this.mAudioSnapshot == null || addTrack2 == -1)) {
                        long writeAudioSamples = writeAudioSamples(mediaMuxer, this.mAudioSnapshot, addTrack2, j);
                        access$1002 = CircularMediaRecorder.TAG;
                        stringBuilder4 = new StringBuilder();
                        stringBuilder4.append("AUDIO DURATION: ");
                        stringBuilder4.append(writeAudioSamples);
                        stringBuilder4.append(" Usec");
                        Log.d(access$1002, stringBuilder4.toString());
                    }
                    mediaMuxer.stop();
                    if (this.mVideoClipSavingCallback != null) {
                        byte[] readFully = readFully(file.getPath());
                        VideoClipSavingCallback videoClipSavingCallback = this.mVideoClipSavingCallback;
                        if (this.mVideoSnapshot != null) {
                            j2 = this.mVideoSnapshot.curr;
                        }
                        videoClipSavingCallback.onVideoClipSavingCompleted(readFully, j2);
                    }
                    try {
                        mediaMuxer.release();
                    } catch (Exception e4) {
                        access$1002 = CircularMediaRecorder.TAG;
                        stringBuilder2 = new StringBuilder();
                        stringBuilder2.append("Failed to release the media muxer: ");
                        stringBuilder2.append(mediaMuxer);
                        Log.d(access$1002, stringBuilder2.toString());
                    }
                    if (CircularMediaRecorder.SAVE_MICRO_VIDEO_IN_SDCARD) {
                        access$1002 = CircularMediaRecorder.TAG;
                        stringBuilder3 = new StringBuilder();
                        stringBuilder3.append("Ignore deleting the temporary mp4 file: ");
                        stringBuilder3.append(r1);
                        Log.d(access$1002, stringBuilder3.toString());
                    }
                    if (!(file == null || file.delete())) {
                        access$1002 = CircularMediaRecorder.TAG;
                        stringBuilder3 = new StringBuilder();
                        stringBuilder3.append("Failed to delete the temporary mp4 file: ");
                        stringBuilder3.append(r1);
                        Log.d(access$1002, stringBuilder3.toString());
                    }
                } catch (Exception e5) {
                    e = e5;
                    access$100 = CircularMediaRecorder.TAG;
                    stringBuilder = new StringBuilder();
                    stringBuilder.append("Failed to save the videoclip as an mp4 file: ");
                    stringBuilder.append(e);
                    Log.d(access$100, stringBuilder.toString());
                    if (this.mVideoClipSavingCallback != null) {
                    }
                    if (mediaMuxer != null) {
                    }
                    if (CircularMediaRecorder.SAVE_MICRO_VIDEO_IN_SDCARD) {
                    }
                }
            } catch (Throwable e6) {
                mediaMuxer = null;
                e = e6;
                file = mediaMuxer;
                access$100 = CircularMediaRecorder.TAG;
                stringBuilder = new StringBuilder();
                stringBuilder.append("Failed to save the videoclip as an mp4 file: ");
                stringBuilder.append(e);
                Log.d(access$100, stringBuilder.toString());
                if (this.mVideoClipSavingCallback != null) {
                    this.mVideoClipSavingCallback.onVideoClipSavingException(e);
                }
                if (mediaMuxer != null) {
                    try {
                        mediaMuxer.release();
                    } catch (Exception e7) {
                        access$1002 = CircularMediaRecorder.TAG;
                        stringBuilder2 = new StringBuilder();
                        stringBuilder2.append("Failed to release the media muxer: ");
                        stringBuilder2.append(mediaMuxer);
                        Log.d(access$1002, stringBuilder2.toString());
                    }
                }
                if (CircularMediaRecorder.SAVE_MICRO_VIDEO_IN_SDCARD) {
                    access$1002 = CircularMediaRecorder.TAG;
                    stringBuilder3 = new StringBuilder();
                    stringBuilder3.append("Ignore deleting the temporary mp4 file: ");
                    stringBuilder3.append(r1);
                    Log.d(access$1002, stringBuilder3.toString());
                }
                if (!(file == null || file.delete())) {
                    access$1002 = CircularMediaRecorder.TAG;
                    stringBuilder3 = new StringBuilder();
                    stringBuilder3.append("Failed to delete the temporary mp4 file: ");
                    stringBuilder3.append(r1);
                    Log.d(access$1002, stringBuilder3.toString());
                }
            } catch (Throwable e62) {
                mediaMuxer = null;
                e = e62;
                file = mediaMuxer;
                if (mediaMuxer != null) {
                }
                if (CircularMediaRecorder.SAVE_MICRO_VIDEO_IN_SDCARD) {
                }
                throw e;
            }
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
