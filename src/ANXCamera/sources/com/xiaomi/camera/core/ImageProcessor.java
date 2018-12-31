package com.xiaomi.camera.core;

import android.hardware.camera2.params.OutputConfiguration;
import android.media.Image;
import android.os.Handler;
import android.os.HandlerThread;
import android.os.Message;
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
    private Handler mHandler;
    private int mImageBufferQueueSize = 4;
    ImageProcessorStatusCallback mImageProcessorStatusCallback;
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

    abstract void processImage(CaptureDataBean captureDataBean);

    public abstract void releaseResource();

    public ImageProcessor(ImageProcessorStatusCallback imageProcessorStatusCallback) {
        this.mImageProcessorStatusCallback = imageProcessorStatusCallback;
    }

    public void setTaskSession(TaskSession taskSession) {
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
                StringBuilder stringBuilder;
                if (message.what != 1) {
                    String access$000 = ImageProcessor.TAG;
                    stringBuilder = new StringBuilder();
                    stringBuilder.append("handleMessage: unknown message received : ");
                    stringBuilder.append(message.what);
                    Log.d(access$000, stringBuilder.toString());
                } else if (message.obj instanceof CaptureDataBean) {
                    ImageProcessor.this.processImage((CaptureDataBean) message.obj);
                } else {
                    stringBuilder = new StringBuilder();
                    stringBuilder.append("Unknown message data:");
                    stringBuilder.append(message.obj);
                    throw new RuntimeException(stringBuilder.toString());
                }
            }
        };
    }

    public void goOffWork() {
        this.mWorkThread.quitSafely();
        this.mHandler.removeCallbacksAndMessages(null);
        this.mHandler = null;
        releaseResource();
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
