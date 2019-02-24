package com.miui.extravideo.interpolation;

import android.media.MediaCodec.BufferInfo;
import android.media.MediaFormat;
import android.os.Handler;
import android.os.HandlerThread;
import android.util.Log;
import android.view.animation.Interpolator;
import android.view.animation.LinearInterpolator;
import com.miui.extravideo.common.MediaColorConvertUtils;
import com.miui.extravideo.common.MediaDecoderAsync;
import com.miui.extravideo.common.MediaEncoderAsync;
import com.miui.extravideo.common.MediaParamsHolder;
import com.miui.extravideo.common.MediaUtils;
import com.miui.extravideo.deflicker.DeFlickerJni;
import java.io.File;
import java.nio.ByteBuffer;
import java.util.Arrays;
import java.util.Map;
import java.util.concurrent.BlockingQueue;
import java.util.concurrent.LinkedBlockingQueue;
import org.jcodec.containers.mp4.boxes.MetaValue;
import org.jcodec.movtool.MetadataEditor;

class VideoInterpolatorAsyncImp {
    private static final String DECODE_THREAD_NAME = "DecodeThread";
    private static final String ENCODE_THREAD_NAME = "EncodeThread";
    private static final int FRAME_INDEX_BEGIN_INTERPOLATION = 45;
    private static final int FRAME_RATE_NORMAL = 30;
    private static final int FRAME_RATE_ORIGIN = 240;
    private static final int FRAME_RATE_TARGET = 960;
    private static final int FRAME_SIZE_ANIMATION_DURING = 8;
    private static final int FRAME_SIZE_INTERPOLATION = 4;
    private static final int FRAME_SKIP_SIZE_ANIMATION_BEGIN = 16;
    private static final int FRAME_SKIP_SIZE_ORIGIN_SPEED_TO_NORMAL = 8;
    private static final int FRAME_SKIP_SIZE_TARGET_SPEED_TO_NORMAL = 32;
    private static final int FRAME_SKIP_SIZE_TARGET_SPEED_TO_ORIGIN = 4;
    private static final int INTERPOLATOR_ACCURACY = 1;
    private static final int MAX_BUFFER_SIZE = 15;
    private static final int TOTAL_FRAME_SIZE = 300;
    private MediaCodecHandlerThread mDecodeThread;
    private MediaDecoderAsync mDecoder;
    private final String mDstPath;
    private EncodeListener mEncodeListener;
    private MediaCodecHandlerThread mEncodeThread;
    private MediaEncoderAsync mEncoder;
    private int[] mFrameMapping = new int[300];
    private final BlockingQueue<EncodeBufferHolder> mQueue = new LinkedBlockingQueue(15);
    private final boolean mSupportDeFlicker;

    private class DecodeUpdateListener implements com.miui.extravideo.common.MediaDecoderAsync.DecodeUpdateListener {
        private boolean mBeginInterpolator = false;
        private DeFlickerJni mDeFlickerJni;
        private int mDecodeIndex = 0;
        private byte[] mEncodeBuffer;
        private final int mHeight;
        private final MediaInterpolator mMediaInterpolator;
        private MediaParamsHolder mMediaParamsHolder;
        private int mRepresentativeIndex = 0;
        private final int mWidth;
        private byte[] mYuvBuffer;

        public DecodeUpdateListener(MediaParamsHolder mediaParamsHolder) {
            this.mMediaParamsHolder = mediaParamsHolder;
            this.mWidth = this.mMediaParamsHolder.videoWidth;
            this.mHeight = this.mMediaParamsHolder.videoHeight;
            this.mMediaInterpolator = new MediaInterpolator(this.mWidth, this.mHeight, 1);
            if (VideoInterpolatorAsyncImp.this.mSupportDeFlicker) {
                this.mDeFlickerJni = new DeFlickerJni(this.mWidth, this.mHeight);
            }
        }

        public void onOutputFormatChange(MediaFormat mediaFormat) {
            this.mMediaParamsHolder.setFormat(mediaFormat);
        }

        public void onFrameDecodeBegin(int i, long j) {
            if (i == 45) {
                VideoInterpolatorAsyncImp.this.mDecoder.setSkipFrameTimes(1);
            }
        }

        public void onDecodeBuffer(ByteBuffer byteBuffer, BufferInfo bufferInfo) {
            initEncodeBuffer(bufferInfo);
            initYuvBuffer();
            byteBuffer.get(this.mEncodeBuffer);
            byteBuffer.clear();
            if (this.mEncodeBuffer.length > 0) {
                MediaColorConvertUtils.convertDecodeColorToEncode(this.mEncodeBuffer, this.mYuvBuffer, this.mMediaParamsHolder);
                if (this.mDeFlickerJni != null) {
                    this.mDeFlickerJni.process(this.mYuvBuffer);
                }
                if (this.mBeginInterpolator) {
                    this.mMediaInterpolator.configInterpolationSize(4, this.mYuvBuffer);
                    while (this.mMediaInterpolator.hasNext()) {
                        this.mMediaInterpolator.nextByteBuffer(this.mYuvBuffer);
                        VideoInterpolatorAsyncImp.this.putBufferToQueue(this.mYuvBuffer, MediaUtils.computePresentationTime(this.mDecodeIndex, VideoInterpolatorAsyncImp.this.mEncoder.getFrameRate()), this.mRepresentativeIndex);
                        this.mDecodeIndex++;
                        this.mRepresentativeIndex++;
                    }
                } else {
                    VideoInterpolatorAsyncImp.this.putBufferToQueue(this.mYuvBuffer, MediaUtils.computePresentationTime(this.mDecodeIndex, VideoInterpolatorAsyncImp.this.mEncoder.getFrameRate()), this.mRepresentativeIndex);
                    this.mDecodeIndex++;
                    if (this.mDecodeIndex >= 45) {
                        this.mRepresentativeIndex += 4;
                    } else {
                        this.mRepresentativeIndex += 32;
                    }
                }
                if (this.mDecodeIndex == 44) {
                    this.mBeginInterpolator = true;
                }
            }
        }

        public void onDecodeStop(boolean z) {
            release();
            if (z) {
                VideoInterpolatorAsyncImp.this.putEndFlagToQueue();
            }
        }

        public void onError() {
            release();
            notifyEncodeStop();
            VideoInterpolatorAsyncImp.this.notifyTaskError();
        }

        private void release() {
            VideoInterpolatorAsyncImp.this.mDecoder.release();
            this.mMediaInterpolator.release();
            if (this.mDeFlickerJni != null) {
                this.mDeFlickerJni.release();
            }
            VideoInterpolatorAsyncImp.this.mDecodeThread.quitSafely();
        }

        private void initYuvBuffer() {
            if (this.mYuvBuffer == null) {
                this.mYuvBuffer = new byte[(((this.mWidth * this.mHeight) * 3) / 2)];
            }
        }

        private void initEncodeBuffer(BufferInfo bufferInfo) {
            if (!(this.mEncodeBuffer == null || this.mEncodeBuffer.length == bufferInfo.size)) {
                this.mEncodeBuffer = null;
            }
            if (this.mEncodeBuffer == null) {
                this.mEncodeBuffer = new byte[bufferInfo.size];
            }
        }

        private void notifyEncodeStop() {
            VideoInterpolatorAsyncImp.this.mEncoder.stop();
            VideoInterpolatorAsyncImp.this.mQueue.clear();
        }
    }

    private class EncodeUpdateListener implements com.miui.extravideo.common.MediaEncoderAsync.EncodeUpdateListener {
        private int mEncodeIndex;
        private boolean mIsEnd;

        private EncodeUpdateListener() {
            this.mIsEnd = false;
            this.mEncodeIndex = 0;
        }

        /* synthetic */ EncodeUpdateListener(VideoInterpolatorAsyncImp videoInterpolatorAsyncImp, AnonymousClass1 anonymousClass1) {
            this();
        }

        public void onInputBufferAvailable(EncodeBufferHolder encodeBufferHolder) {
            EncodeBufferHolder encodeBufferHolder2;
            if (this.mIsEnd) {
                encodeBufferHolder2 = null;
            } else {
                encodeBufferHolder2 = VideoInterpolatorAsyncImp.this.getBufferFromQueue();
            }
            if (encodeBufferHolder2 == null) {
                encodeBufferHolder.flag = 0;
                encodeBufferHolder.data = null;
            } else if (encodeBufferHolder2.flag == 4) {
                encodeBufferHolder.flag = encodeBufferHolder2.flag;
                this.mIsEnd = true;
            } else if (this.mEncodeIndex >= 300) {
                encodeBufferHolder.flag = 4;
                this.mIsEnd = true;
                notifyDecodeStop();
            } else if (VideoInterpolatorAsyncImp.this.mFrameMapping[this.mEncodeIndex] == encodeBufferHolder2.representativeIndex) {
                configFrame(encodeBufferHolder, encodeBufferHolder2);
                this.mEncodeIndex++;
            } else {
                encodeBufferHolder.flag = 0;
                encodeBufferHolder.data = null;
            }
        }

        public void onEncodeEnd(boolean z) {
            release();
            if (z) {
                VideoInterpolatorAsyncImp.this.notifyTaskFinish();
            } else {
                VideoInterpolatorAsyncImp.this.deleteBadFile();
            }
        }

        public void onError() {
            release();
            notifyDecodeStop();
            VideoInterpolatorAsyncImp.this.deleteBadFile();
            VideoInterpolatorAsyncImp.this.notifyTaskError();
        }

        private void release() {
            VideoInterpolatorAsyncImp.this.mEncoder.release();
            VideoInterpolatorAsyncImp.this.mEncodeThread.quitSafely();
        }

        private void notifyDecodeStop() {
            VideoInterpolatorAsyncImp.this.mDecoder.stop();
            VideoInterpolatorAsyncImp.this.mQueue.clear();
        }

        private void configFrame(EncodeBufferHolder encodeBufferHolder, EncodeBufferHolder encodeBufferHolder2) {
            encodeBufferHolder.data = encodeBufferHolder2.data;
            encodeBufferHolder.presentationTimeUs = MediaUtils.computePresentationTime(this.mEncodeIndex, VideoInterpolatorAsyncImp.this.mEncoder.getFrameRate());
            encodeBufferHolder.flag = encodeBufferHolder2.flag;
        }
    }

    private static class MediaCodecHandlerThread extends HandlerThread {
        private Handler mHandler = new Handler(getLooper());

        MediaCodecHandlerThread(String str) {
            super(str);
            start();
        }

        public void run() {
            super.run();
            Log.d(getName(), "thread exit");
        }
    }

    VideoInterpolatorAsyncImp(String str, String str2, boolean z) {
        this.mSupportDeFlicker = z;
        this.mDstPath = str2;
        this.mDecodeThread = new MediaCodecHandlerThread(DECODE_THREAD_NAME);
        this.mEncodeThread = new MediaCodecHandlerThread(ENCODE_THREAD_NAME);
        this.mDecoder = new MediaDecoderAsync(str, this.mDecodeThread.mHandler);
        MediaParamsHolder mediaParamsHolder = this.mDecoder.getMediaParamsHolder();
        this.mEncoder = new MediaEncoderAsync(mediaParamsHolder.videoWidth, mediaParamsHolder.videoHeight, mediaParamsHolder.videoDegree, mediaParamsHolder.mimeType, str2, this.mEncodeThread.mHandler);
        this.mDecoder.setListener(new DecodeUpdateListener(mediaParamsHolder));
        this.mEncoder.setListener(new EncodeUpdateListener(this, null));
        initMapping();
    }

    private void initMapping() {
        for (int i = 0; i < this.mFrameMapping.length; i++) {
            int addIndexByFrame = getAddIndexByFrame(i);
            if (i < 1) {
                this.mFrameMapping[i] = 0;
            } else {
                this.mFrameMapping[i] = this.mFrameMapping[i - 1] + addIndexByFrame;
            }
        }
    }

    private int getAddIndexByFrame(int i) {
        Interpolator linearInterpolator = new LinearInterpolator();
        if (i < 45) {
            return 32;
        }
        if (i < 53) {
            return 1 + Math.round(15.0f * (1.0f - linearInterpolator.getInterpolation(((float) (i - 45)) / 8.0f)));
        }
        return 1;
    }

    void doDecodeAndEncode() {
        this.mDecoder.setSkipFrameTimes(8);
        try {
            this.mDecoder.start();
            this.mEncoder.start();
        } catch (Exception e) {
            e.printStackTrace();
            if (this.mEncodeListener != null) {
                this.mDecodeThread.mHandler.post(new Runnable() {
                    public void run() {
                        VideoInterpolatorAsyncImp.this.notifyTaskError();
                    }
                });
            }
            this.mEncodeThread.quitSafely();
            this.mDecodeThread.quitSafely();
        }
    }

    private void putEndFlagToQueue() {
        EncodeBufferHolder encodeBufferHolder = new EncodeBufferHolder();
        encodeBufferHolder.flag = 4;
        try {
            this.mQueue.put(encodeBufferHolder);
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
    }

    private void putBufferToQueue(byte[] bArr, long j, int i) {
        EncodeBufferHolder encodeBufferHolder = new EncodeBufferHolder();
        encodeBufferHolder.data = Arrays.copyOf(bArr, bArr.length);
        encodeBufferHolder.flag = 0;
        encodeBufferHolder.presentationTimeUs = j;
        encodeBufferHolder.representativeIndex = i;
        try {
            this.mQueue.put(encodeBufferHolder);
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
    }

    private EncodeBufferHolder getBufferFromQueue() {
        try {
            return (EncodeBufferHolder) this.mQueue.take();
        } catch (InterruptedException e) {
            e.printStackTrace();
            return null;
        }
    }

    private void notifyTaskFinish() {
        addMetaData();
        if (this.mEncodeListener != null) {
            this.mEncodeListener.onEncodeFinish();
            this.mEncodeListener = null;
        }
    }

    private void notifyTaskError() {
        if (this.mEncodeListener != null) {
            this.mEncodeListener.onError();
            this.mEncodeListener = null;
        }
    }

    private void deleteBadFile() {
        File file = new File(this.mDstPath);
        if (file.exists()) {
            file.delete();
        }
    }

    private void addMetaData() {
        try {
            MetadataEditor createFrom = MetadataEditor.createFrom(new File(this.mDstPath));
            Map keyedMeta = createFrom.getKeyedMeta();
            long currentTimeMillis = System.currentTimeMillis();
            keyedMeta.put("com.xiaomi.capture_framerate", MetaValue.createInt(FRAME_RATE_TARGET));
            createFrom.save(true);
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.append("cost: ");
            stringBuilder.append(System.currentTimeMillis() - currentTimeMillis);
            Log.d("jcodec", stringBuilder.toString());
        } catch (Throwable e) {
            Log.w("jcodec", "error \n", e);
        }
    }

    public void setEncodeListener(EncodeListener encodeListener) {
        this.mEncodeListener = encodeListener;
    }
}
