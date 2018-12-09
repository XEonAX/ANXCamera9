package com.xiaomi.camera.core;

import android.hardware.camera2.params.OutputConfiguration;
import android.media.Image;
import android.media.ImageReader;
import android.os.Handler;
import android.os.HandlerThread;
import android.os.Looper;
import android.os.Message;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.support.annotation.WorkerThread;
import android.util.Log;
import android.view.Surface;
import com.xiaomi.engine.BufferFormat;
import com.xiaomi.engine.TaskSession;
import com.xiaomi.protocol.ICustomCaptureResult;
import java.util.List;

public abstract class ImageProcessor {
    private static final int DEFAULT_IMAGE_BUFFER_QUEUE_SIZE = 4;
    private static final int MSG_CAPTURE_RESULT_RECEIVED = 2;
    private static final int MSG_IMAGE_RECEIVED = 1;
    private static final String TAG = ImageProcessor.class.getSimpleName();
    private Handler mHandler;
    int mImageBufferQueueSize = 4;
    ImageProcessorStatusCallback mImageProcessorStatusCallback;
    List<ImageReader> mImageReaderList;
    TaskSession mTaskSession;
    private HandlerThread mWorkThread = new HandlerThread("ImageProcessor");

    public interface ImageProcessorStatusCallback {
        void onImageProcessFailed(Image image, String str);

        void onImageProcessStart(long j);

        void onImageProcessed(Image image, int i);

        void onOriginalImageClosed(Image image);
    }

    private class TaskHandler extends Handler {
        public TaskHandler(Looper looper) {
            super(looper);
        }

        public void handleMessage(Message message) {
            String access$000 = ImageProcessor.TAG;
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.append("handleMessage: ");
            stringBuilder.append(message);
            Log.d(access$000, stringBuilder.toString());
            switch (message.what) {
                case 1:
                    if (message.obj instanceof Image) {
                        ImageProcessor.this.onImageReceived((Image) message.obj, message.arg1);
                        return;
                    }
                    stringBuilder = new StringBuilder();
                    stringBuilder.append("Unknown message data:");
                    stringBuilder.append(message.obj);
                    throw new RuntimeException(stringBuilder.toString());
                case 2:
                    if (message.obj instanceof ICustomCaptureResult) {
                        ImageProcessor.this.onCaptureReceived((ICustomCaptureResult) message.obj, message.arg1);
                        return;
                    }
                    stringBuilder = new StringBuilder();
                    stringBuilder.append("Unknown message data:");
                    stringBuilder.append(message.obj);
                    throw new RuntimeException(stringBuilder.toString());
                default:
                    return;
            }
        }
    }

    public abstract List<OutputConfiguration> configOutputConfigurations(BufferFormat bufferFormat);

    public abstract List<Surface> configOutputSurfaces(BufferFormat bufferFormat);

    @WorkerThread
    abstract void onCaptureReceived(ICustomCaptureResult iCustomCaptureResult, int i);

    @WorkerThread
    abstract void onImageReceived(Image image, int i);

    @WorkerThread
    abstract void processImage();

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

    public boolean isAlive() {
        return this.mWorkThread != null && this.mWorkThread.isAlive();
    }

    public Handler getHandler() {
        return this.mHandler;
    }

    public void startWork() {
        this.mWorkThread.start();
        this.mHandler = new TaskHandler(this.mWorkThread.getLooper());
    }

    public void goOffWork() {
        this.mWorkThread.quitSafely();
        this.mHandler = null;
        releaseResource();
    }

    public void dispatchImage(@NonNull Image image, @Nullable int i) {
        if (!this.mWorkThread.isAlive() || this.mHandler == null) {
            throw new RuntimeException("Thread already die!");
        }
        Message obtainMessage = this.mHandler.obtainMessage();
        obtainMessage.what = 1;
        obtainMessage.arg1 = i;
        obtainMessage.obj = image;
        this.mHandler.sendMessage(obtainMessage);
    }

    public void dispatchCaptureResult(@NonNull ICustomCaptureResult iCustomCaptureResult, @Nullable int i) {
        if (!this.mWorkThread.isAlive() || this.mHandler == null) {
            throw new RuntimeException("Thread already die!");
        }
        Message obtainMessage = this.mHandler.obtainMessage();
        obtainMessage.what = 2;
        obtainMessage.arg1 = i;
        obtainMessage.obj = iCustomCaptureResult;
        this.mHandler.sendMessage(obtainMessage);
    }
}
