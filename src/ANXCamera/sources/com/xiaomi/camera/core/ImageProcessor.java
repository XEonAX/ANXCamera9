package com.xiaomi.camera.core;

import android.hardware.camera2.params.OutputConfiguration;
import android.media.Image;
import android.media.ImageReader;
import android.os.Handler;
import android.os.HandlerThread;
import android.os.Message;
import android.support.annotation.NonNull;
import android.view.Surface;
import com.android.camera.log.Log;
import com.xiaomi.camera.core.CaptureData.CaptureDataBean;
import com.xiaomi.engine.BufferFormat;
import com.xiaomi.engine.TaskSession;
import java.util.List;

public abstract class ImageProcessor {
    private static final int DEFAULT_IMAGE_BUFFER_QUEUE_SIZE = 4;
    private static final int MSG_IMAGE_RECEIVED = 1;
    private static final String TAG = ImageProcessor.class.getSimpleName();
    ImageReader mDepthImageReaderHolder;
    ImageReader mEffectImageReaderHolder;
    private Handler mHandler;
    private int mImageBufferQueueSize = 4;
    ImageProcessorStatusCallback mImageProcessorStatusCallback;
    boolean mIsBokehMode;
    private boolean mIsNeedStopWork;
    ImageReader mRawImageReaderHolder;
    TaskSession mTaskSession;
    private HandlerThread mWorkThread = new HandlerThread("ImageProcessor");

    public interface ImageProcessorStatusCallback {
        void onImageProcessFailed(Image image, String str);

        void onImageProcessStart(long j);

        void onImageProcessed(Image image, int i);

        void onOriginalImageClosed(Image image);
    }

    public abstract List<OutputConfiguration> configOutputConfigurations(BufferFormat bufferFormat);

    public abstract List<Surface> configOutputSurfaces(BufferFormat bufferFormat);

    abstract boolean isIdle();

    abstract void processImage(CaptureDataBean captureDataBean);

    public ImageProcessor(ImageProcessorStatusCallback imageProcessorStatusCallback, boolean z) {
        this.mImageProcessorStatusCallback = imageProcessorStatusCallback;
        this.mIsBokehMode = z;
    }

    public void setTaskSession(@NonNull TaskSession taskSession) {
        this.mTaskSession = taskSession;
    }

    public void setImageBufferQueueSize(int i) {
        this.mImageBufferQueueSize = i;
    }

    int getImageBufferQueueSize() {
        return this.mImageBufferQueueSize;
    }

    private boolean isAlive() {
        return this.mWorkThread != null && this.mWorkThread.isAlive();
    }

    Handler getHandler() {
        return this.mHandler;
    }

    public void startWork() {
        this.mWorkThread.start();
        this.mHandler = new Handler(this.mWorkThread.getLooper()) {
            public void handleMessage(Message message) {
                if (message.what != 1) {
                    String access$000 = ImageProcessor.TAG;
                    StringBuilder stringBuilder = new StringBuilder();
                    stringBuilder.append("handleMessage: unknown message: ");
                    stringBuilder.append(message.what);
                    Log.d(access$000, stringBuilder.toString());
                    return;
                }
                ImageProcessor.this.processImage((CaptureDataBean) message.obj);
            }
        };
    }

    public void stopWork() {
        this.mWorkThread.quitSafely();
        this.mHandler.removeCallbacksAndMessages(null);
        this.mHandler = null;
        this.mTaskSession.close();
        releaseResource();
    }

    public void tryToStopWork() {
        if (this.mIsNeedStopWork && isIdle()) {
            stopWork();
        }
    }

    public void stopWorkWhenIdle() {
        this.mIsNeedStopWork = true;
        tryToStopWork();
    }

    public void releaseResource() {
        this.mImageProcessorStatusCallback = null;
        if (this.mEffectImageReaderHolder != null) {
            this.mEffectImageReaderHolder.close();
            this.mEffectImageReaderHolder = null;
        }
        if (this.mRawImageReaderHolder != null) {
            this.mRawImageReaderHolder.close();
            this.mRawImageReaderHolder = null;
        }
        if (this.mDepthImageReaderHolder != null) {
            this.mDepthImageReaderHolder.close();
            this.mDepthImageReaderHolder = null;
        }
    }

    public void dispatchTask(CaptureDataBean captureDataBean) {
        if (captureDataBean == null) {
            Log.w(TAG, "dispatchTask: data is null");
        } else if (isAlive()) {
            Message obtainMessage = this.mHandler.obtainMessage();
            obtainMessage.what = 1;
            obtainMessage.obj = captureDataBean;
            this.mHandler.sendMessage(obtainMessage);
        } else {
            throw new RuntimeException("Thread already die!");
        }
    }
}
