package com.xiaomi.camera.liveshot;

import android.media.CamcorderProfile;
import android.media.MediaFormat;
import android.media.MediaMuxer;
import android.opengl.EGLContext;
import android.os.Environment;
import android.support.annotation.NonNull;
import android.support.annotation.WorkerThread;
import com.android.camera.CameraSettings;
import com.android.camera.Util;
import com.android.camera.effect.draw_mode.DrawExtTexAttribute;
import com.android.camera.log.Log;
import com.xiaomi.camera.liveshot.encoder.CircularAudioEncoder;
import com.xiaomi.camera.liveshot.encoder.CircularMediaEncoder.Snapshot;
import com.xiaomi.camera.liveshot.encoder.CircularVideoEncoder;
import com.xiaomi.camera.liveshot.util.BackgroundTaskScheduler;
import com.xiaomi.camera.liveshot.util.BackgroundTaskScheduler.CancellableTask;
import com.xiaomi.camera.liveshot.writer.AudioSampleWriter;
import com.xiaomi.camera.liveshot.writer.SampleWriter.StatusNotifier;
import com.xiaomi.camera.liveshot.writer.VideoSampleWriter;
import java.io.BufferedInputStream;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.Future;

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
    private static final float VIDEO_I_FRAME_INTERVAL = 0.2f;
    private final CircularAudioEncoder mCircularAudioEncoder;
    private final CircularVideoEncoder mCircularVideoEncoder;
    private int mOrientationHint = 0;
    private final BackgroundTaskScheduler mSnapshotRequestScheduler;

    public interface VideoClipSavingCallback {
        @WorkerThread
        void onVideoClipSavingCancelled();

        @WorkerThread
        void onVideoClipSavingCompleted(@NonNull byte[] bArr, long j);

        @WorkerThread
        void onVideoClipSavingException(@NonNull Throwable th);
    }

    private static final class SnapshotRequest extends CancellableTask {
        private final Snapshot mAudioSnapshot;
        private final int mOrientationHint;
        private final ExecutorService mSampleWriterExecutor;
        private final VideoClipSavingCallback mVideoClipSavingCallback;
        private final Snapshot mVideoSnapshot;

        private SnapshotRequest(Snapshot snapshot, Snapshot snapshot2, int i, VideoClipSavingCallback videoClipSavingCallback) {
            if (snapshot2 == null && snapshot == null) {
                throw new IllegalStateException("At least one non-null snapshot should be provided");
            }
            this.mAudioSnapshot = snapshot;
            this.mVideoSnapshot = snapshot2;
            this.mOrientationHint = i;
            this.mVideoClipSavingCallback = videoClipSavingCallback;
            this.mSampleWriterExecutor = Executors.newFixedThreadPool(2);
        }

        /* JADX WARNING: Removed duplicated region for block: B:72:0x016f A:{Catch:{ all -> 0x01d9 }} */
        /* JADX WARNING: Removed duplicated region for block: B:74:0x0176 A:{SYNTHETIC, Splitter: B:74:0x0176} */
        /* JADX WARNING: Removed duplicated region for block: B:82:0x01b2 A:{SKIP} */
        /* JADX WARNING: Removed duplicated region for block: B:80:0x0199  */
        /* JADX WARNING: Removed duplicated region for block: B:91:0x01dc A:{SYNTHETIC, Splitter: B:91:0x01dc} */
        /* JADX WARNING: Removed duplicated region for block: B:101:0x0220  */
        /* JADX WARNING: Removed duplicated region for block: B:97:0x01ff A:{SKIP} */
        /* JADX WARNING: Removed duplicated region for block: B:72:0x016f A:{Catch:{ all -> 0x01d9 }} */
        /* JADX WARNING: Removed duplicated region for block: B:74:0x0176 A:{SYNTHETIC, Splitter: B:74:0x0176} */
        /* JADX WARNING: Removed duplicated region for block: B:80:0x0199  */
        /* JADX WARNING: Removed duplicated region for block: B:82:0x01b2 A:{SKIP} */
        /* JADX WARNING: Removed duplicated region for block: B:91:0x01dc A:{SYNTHETIC, Splitter: B:91:0x01dc} */
        /* JADX WARNING: Removed duplicated region for block: B:97:0x01ff A:{SKIP} */
        /* JADX WARNING: Removed duplicated region for block: B:101:0x0220  */
        /* Code decompiled incorrectly, please refer to instructions dump. */
        public void run() {
            MediaMuxer mediaMuxer;
            Throwable th;
            Throwable e;
            String access$100;
            StringBuilder stringBuilder;
            String access$1002;
            StringBuilder stringBuilder2;
            if (isCancelled()) {
                Log.d(CircularMediaRecorder.TAG, "Saving request is cancelled before executing");
                this.mSampleWriterExecutor.shutdown();
                if (this.mVideoClipSavingCallback != null) {
                    this.mVideoClipSavingCallback.onVideoClipSavingCancelled();
                }
                return;
            }
            StatusNotifier statusNotifier = null;
            File file;
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
                        }
                        if (!CircularMediaRecorder.SAVE_MICRO_VIDEO_IN_SDCARD) {
                        }
                        this.mSampleWriterExecutor.shutdown();
                        throw e;
                    }
                } catch (Throwable e22) {
                    th = e22;
                    mediaMuxer = null;
                    e = th;
                    if (mediaMuxer != null) {
                    }
                    if (!CircularMediaRecorder.SAVE_MICRO_VIDEO_IN_SDCARD) {
                    }
                    this.mSampleWriterExecutor.shutdown();
                    throw e;
                }
                try {
                    int addTrack;
                    int addTrack2;
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
                    List<Future> arrayList = new ArrayList(2);
                    if (!(this.mVideoSnapshot == null || addTrack == -1)) {
                        statusNotifier = new StatusNotifier(Long.valueOf(0));
                        arrayList.add(this.mSampleWriterExecutor.submit(new VideoSampleWriter(mediaMuxer, this.mVideoSnapshot, addTrack, statusNotifier)));
                    }
                    if (!(this.mAudioSnapshot == null || addTrack2 == -1)) {
                        arrayList.add(this.mSampleWriterExecutor.submit(new AudioSampleWriter(mediaMuxer, this.mAudioSnapshot, addTrack2, statusNotifier)));
                    }
                    for (Future future : arrayList) {
                        if (future != null) {
                            try {
                                future.get();
                            } catch (InterruptedException e3) {
                                String access$1003 = CircularMediaRecorder.TAG;
                                StringBuilder stringBuilder4 = new StringBuilder();
                                stringBuilder4.append("Writing is interrupted and the generated video may be corrupted: ");
                                stringBuilder4.append(e3);
                                Log.d(access$1003, stringBuilder4.toString());
                            }
                        }
                    }
                    mediaMuxer.stop();
                    if (this.mVideoClipSavingCallback != null) {
                        this.mVideoClipSavingCallback.onVideoClipSavingCompleted(readFully(file.getPath()), this.mVideoSnapshot == null ? -1 : this.mVideoSnapshot.time);
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
                        this.mSampleWriterExecutor.shutdown();
                    }
                    if (!(file == null || file.delete())) {
                        access$1002 = CircularMediaRecorder.TAG;
                        stringBuilder3 = new StringBuilder();
                        stringBuilder3.append("Failed to delete the temporary mp4 file: ");
                        stringBuilder3.append(r1);
                        Log.d(access$1002, stringBuilder3.toString());
                    }
                    this.mSampleWriterExecutor.shutdown();
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
                    this.mSampleWriterExecutor.shutdown();
                }
                if (!(file == null || file.delete())) {
                    access$1002 = CircularMediaRecorder.TAG;
                    stringBuilder3 = new StringBuilder();
                    stringBuilder3.append("Failed to delete the temporary mp4 file: ");
                    stringBuilder3.append(r1);
                    Log.d(access$1002, stringBuilder3.toString());
                }
                this.mSampleWriterExecutor.shutdown();
            } catch (Throwable e62) {
                mediaMuxer = null;
                e = e62;
                file = mediaMuxer;
                if (mediaMuxer != null) {
                    try {
                        mediaMuxer.release();
                    } catch (Exception e8) {
                        access$100 = CircularMediaRecorder.TAG;
                        stringBuilder = new StringBuilder();
                        stringBuilder.append("Failed to release the media muxer: ");
                        stringBuilder.append(mediaMuxer);
                        Log.d(access$100, stringBuilder.toString());
                    }
                }
                String access$1004;
                if (!CircularMediaRecorder.SAVE_MICRO_VIDEO_IN_SDCARD) {
                    access$1004 = CircularMediaRecorder.TAG;
                    stringBuilder2 = new StringBuilder();
                    stringBuilder2.append("Ignore deleting the temporary mp4 file: ");
                    stringBuilder2.append(file);
                    Log.d(access$1004, stringBuilder2.toString());
                } else if (!(file == null || file.delete())) {
                    access$1004 = CircularMediaRecorder.TAG;
                    stringBuilder2 = new StringBuilder();
                    stringBuilder2.append("Failed to delete the temporary mp4 file: ");
                    stringBuilder2.append(file);
                    Log.d(access$1004, stringBuilder2.toString());
                }
                this.mSampleWriterExecutor.shutdown();
                throw e;
            }
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
                stringBuilder.append("Failed to load the mp4 file content into memory: ");
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
    }

    public CircularMediaRecorder(int i, int i2, EGLContext eGLContext, boolean z) {
        this.mCircularVideoEncoder = new CircularVideoEncoder(createVideoFormat(i, i2), eGLContext, CAPTURE_DURATION_IN_MICROSECOND, PRE_CAPTURE_DURATION_IN_MICROSECOND);
        if (z) {
            this.mCircularAudioEncoder = new CircularAudioEncoder(createAudioFormat(AUDIO_SAMPLE_RATE, 1), CAPTURE_DURATION_IN_MICROSECOND, PRE_CAPTURE_DURATION_IN_MICROSECOND);
        } else {
            this.mCircularAudioEncoder = null;
        }
        this.mSnapshotRequestScheduler = new BackgroundTaskScheduler(Executors.newSingleThreadExecutor());
    }

    public void setFpsReduction(float f) {
        if (this.mCircularVideoEncoder != null) {
            this.mCircularVideoEncoder.setFpsReduction(f);
        }
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
        this.mSnapshotRequestScheduler.abortRemainingTasks();
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
        this.mSnapshotRequestScheduler.shutdown();
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
        String str = TAG;
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("setOrientationHint(): ");
        stringBuilder.append(i);
        Log.d(str, stringBuilder.toString());
        this.mOrientationHint = i;
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
        this.mSnapshotRequestScheduler.execute(new SnapshotRequest(snapshot, snapshot2, i, videoClipSavingCallback));
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
        MediaFormat createVideoFormat = MediaFormat.createVideoFormat(isH265EncodingPreferred() ? "video/hevc" : "video/avc", i, i2);
        createVideoFormat.setInteger("color-format", 2130708361);
        createVideoFormat.setInteger("bitrate", VIDEO_BIT_RATE);
        createVideoFormat.setInteger("frame-rate", 15);
        createVideoFormat.setFloat("i-frame-interval", VIDEO_I_FRAME_INTERVAL);
        return createVideoFormat;
    }

    private static boolean isH265EncodingPreferred() {
        return CameraSettings.getVideoEncoder() == 5 && MediaCodecCapability.isH265EncodingSupported();
    }
}
